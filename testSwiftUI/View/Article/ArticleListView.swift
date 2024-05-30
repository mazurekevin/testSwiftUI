//
//  ArticleListView.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import SwiftUI

struct ArticleListView: View {
    @State private var articles: [Article] = []
    @State private var errorMessage: String?
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            VStack {
                // Header Section
                VStack(alignment: .leading, spacing: 15) {
                    HeaderView(title: "Mon Mediscoop", forChatroom: false)
                    HStack(spacing: 16) {
                        Spacer()
                        Button(action: {
                            // Action for Sujets
                        }) {
                            Text("Sujets")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        Button(action: {
                            // Action for Articles
                        }) {
                            Text("Articles")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.black)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }
                        Button(action: {
                            // Action for Videos
                        }) {
                            Text("Videos")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        Spacer()
                    }
                    
                }
                .padding()

                // Article List Section
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List(articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            ArticleRowView(article: article)
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear(perform: fetchArticles)
            //.navigationTitle("Articles")
        }
    }

    private func fetchArticles() {
        let page = 1
        let itemsPerPage = 10
        let operation = ArticleOperations.custom(.getArticlesByType(page: page, itemsPerPage: itemsPerPage, media: "texte", favoris: false))
        operation.performRequest { data in
            if let articlesArray = data?.array {
                self.articles = articlesArray.map { Article(json: $0) }
                self.isLoading = false
            } else {
                self.errorMessage = "Failed to load articles."
                self.isLoading = false
            }
        } failure: { error in
            self.errorMessage = error.localizedDescription
            self.isLoading = false
        }
    }
}

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        VStack {
            Text(article.title)
                .font(.largeTitle)
                .padding()
            // Add more fields here to display the full article details
        }
        .navigationTitle("Article Details")
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
