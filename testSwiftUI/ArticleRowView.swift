//
//  ArticleRowView.swift
//  testSwiftUI
//
//  Created by teamdoc on 29/05/2024.
//

import Foundation
import SwiftUI
import SwiftyJSON

struct ArticleRowView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                if let firstAuthor = article.authors.first {
                    Text("Pr \(firstAuthor.firstName) \(firstAuthor.lastName)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer(minLength: 5)
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(article.title)
                        .font(.headline)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3) // Allows unlimited lines
                        .fixedSize(horizontal: false, vertical: true)
                    Spacer()
                }
                
                Spacer()

                if let avatarURL = URL(string: article.thumbnail) {
                    AsyncImage(url: avatarURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 70)
                            .clipped()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 70)
                    }
                }
            }

            HStack {
                Text("Maladies systémiques (lupus, sclérodermie,...)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Image(systemName: "bookmark")
                Image(systemName: "line.horizontal.3.decrease.circle")
            }
        }
        .padding()
        .frame(height: 190) // Adjust this height as needed
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.gray.opacity(0.3), radius: 3, x: 0, y: 1)
    }
}

struct ArticleRowView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleArticleJSON: JSON = [
            "id": 1,
            "articleType": 1,
            "readableArticleType": "Research",
            "authors": [
                "id": 1,
                "shortFormHonorific": "Dr.",
                "firstName": "Jane",
                "lastName": "Doe",
            ],
            "title": "Sample Article",
            "publicationDate": "2023-10-09T00:00:00Z",
            "readablePublicationDate": "October 9, 2023",
            "thumbnail": "https://via.placeholder.com/150",
            "originalArticleTitle": "Original Article Title",
            "originalArticleAuthors": "Author One, Author Two",
            "originalArticleSource": "Journal of Examples",
            "originalAbstractUrl": "https://example.com/abstract",
            "lead": "This is the lead of the article.",
            "body": "This is the body of the article.",
            "vimeoLink": "https://vimeo.com/example",
            "authorisedComments": true,
            "favorite": false,
            "category": "Research",
            "categoryColor": "#FF0000"
        ]
        ArticleRowView(article: Article(json: sampleArticleJSON))
            .previewLayout(.sizeThatFits)
    }
}
