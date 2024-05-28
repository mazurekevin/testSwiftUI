//
//  article.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import SwiftyJSON
import Combine

struct Article: Identifiable {
    let id: Int
    let articleType: Int
    let readableArticleType: String
    let authors: [Author]
    let title: String
    let publicationDate: Date
    let readablePublicationDate: String
    let thumbnail: String
    let originalArticleTitle: String
    let originalArticleAuthors: String
    let originalArticleSource: String
    let originalAbstractUrl: String
    let lead: String
    let body: String
    let vimeoLink: String
    let authorisedComments: Bool
    var favorite: Bool
    let category: String
    let categoryColor: String

    init(json: JSON) {
        id = json["id"].intValue
        articleType = json["articleType"].intValue
        readableArticleType = json["readableArticleType"].stringValue
        authors = json["authors"].arrayValue.map { Author(json: $0) }
        title = json["title"].stringValue
        publicationDate = ISO8601DateFormatter().date(from: json["publicationDate"].stringValue) ?? Date()
        readablePublicationDate = json["readablePublicationDate"].stringValue
        thumbnail = json["thumbnail"].stringValue
        originalArticleTitle = json["originalArticleTitle"].stringValue
        originalArticleAuthors = json["originalArticleAuthors"].stringValue
        originalArticleSource = json["originalArticleSource"].stringValue
        originalAbstractUrl = json["originalAbstractUrl"].stringValue
        lead = json["lead"].stringValue
        body = json["body"].stringValue
        vimeoLink = json["vimeoLink"].stringValue
        authorisedComments = json["authorisedComments"].boolValue
        favorite = json["favorite"].boolValue
        category = json["category"].stringValue
        categoryColor = json["categoryColor"].stringValue
    }
}
