//
//  ArticleListView.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import SwiftUI

struct ArticleListView: View {
    @State private var articles: [Article] = []
    @State private var videos: [Article] = []
    @State private var errorMessage: String?
    @State private var isLoading = true
    @State private var selectedTab: Tab = .articles

    enum Tab {
        case articles
        case videos
    }

    var body: some View {
        NavigationView {
            VStack {
                // Header Section
                VStack(alignment: .leading, spacing: 15) {
                    HeaderView(title: "Mon Mediscoop", forChatroom: false)
                    HStack(spacing: 16) {
                        Spacer()
                        Button(action: {

                        }) {
                            Text("Sujets")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(50)
                        }
                        Button(action: {
                            selectedTab = .articles
                        }) {
                            Text("Articles")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(selectedTab == .articles ? Color.black : Color.gray.opacity(0.2))
                                .foregroundColor(selectedTab == .articles ? .white : .black)
                                .cornerRadius(50)
                        }
                        Button(action: {
                            selectedTab = .videos
                        }) {
                            Text("Videos")
                                .padding(.horizontal)
                                .padding(.vertical, 8)
                                .background(selectedTab == .videos ? Color.black : Color.gray.opacity(0.2))
                                .foregroundColor(selectedTab == .videos ? .white : .black)
                                .cornerRadius(50)
                        }
                        Spacer()
                    }
                    
                }
                .padding()

                // Content List Section
                if isLoading {
                    ProgressView("Loading...")
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                } else {
                    List {
                        if selectedTab == .articles {
                            ForEach(articles) { article in
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    ArticleRowView(article: article)
                                        .listRowInsets(EdgeInsets())
                                }
                            }
                        } else if selectedTab == .videos {
                            ForEach(videos) { article in
                                NavigationLink(destination: ArticleDetailView(article: article)) {
                                    VideoRowView(article: article)
                                        .listRowInsets(EdgeInsets())
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .onAppear(perform: fetchDatas)
            //.navigationTitle("Articles")
        }
    }

    private func fetchDatas() {
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
        let operationVideo = ArticleOperations.custom(.getArticlesByType(page: page, itemsPerPage: itemsPerPage, media: "video", favoris: false))
        operationVideo.performRequest { data in
            if let videosArray = data?.array {
                self.videos = videosArray.map { Article(json: $0) }
                self.isLoading = false
            } else {
                self.errorMessage = "Failed to load videos."
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
