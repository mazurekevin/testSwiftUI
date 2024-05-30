//
//  VideoRowView.swift
//  testSwiftUI
//
//  Created by teamdoc on 30/05/2024.
//

import Foundation
import SwiftUI
import SwiftyJSON

struct VideoRowView: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Thumbnail Image
            if let avatarURL = URL(string: article.thumbnail) {
                AsyncImage(url: avatarURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(height: 200)
                }
            }
            // Title
            Text(article.title)
                .font(.headline)
                .padding(.horizontal)
            
            // Category and Date
            HStack {
                Circle()
                    .fill(Color(hex: article.categoryColor))
                    .frame(width: 8, height: 8)
                
                Text(article.category)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("·")
                
                Text(article.readablePublicationDate)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Button(action: {
                    // Action to toggle favorite status
                }) {
                    Image(systemName: article.favorite ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.black)
                }
            }
            .padding(.horizontal)
                        
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.vertical, 5)
    }
}

// Extension to convert hex string to Color
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xff0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00ff00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000ff) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}


struct VideoRowView_Previews: PreviewProvider {
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
        VideoRowView(article: Article(json: sampleArticleJSON))
            .previewLayout(.sizeThatFits)
    }
}
