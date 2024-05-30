//
//  ArticleRequest.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

enum ArticleRequest {
    static let baseUrl = "https://api1.santor.biz/api/"

    case getArticles(page: Int, itemsPerPage: Int)
    case getArticlesByType(page: Int, itemsPerPage: Int, media: String, favoris: Bool, idAuthor: Int? = nil)
    case setFavorisArticle(id: Int, isFavorite: Bool)
    case getFilterArticle
    // case updateFilter(filter: [FilterArticle])

    var name: String? {
        switch self {
        case .getArticles:
            return "GET_ARTICLES"
        case .getArticlesByType:
            return "GET_ARTICLES_BY_TYPE"
        case .setFavorisArticle:
            return "SET_FAVORIS_ARTICLE"
        case .getFilterArticle:
            return "GET_FILTER_ARTICLE"
        /* case .updateFilter:
            return "UPDATE_FILTER" */
        }
    }

    var requestName: String {
        switch self {
        case .getArticles, .getArticlesByType:
            return "articles"
        case .setFavorisArticle(let id, _):
            return "articles/\(id)"
        case .getFilterArticle:
            return "interest_areas"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getArticles, .getArticlesByType, .getFilterArticle:
            return .get
        case .setFavorisArticle:
            return .patch
        /* case .updateFilter:
            return .put */
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getArticles(let page, let itemsPerPage):
            return ["page": page, "itemsPerPage": itemsPerPage]
        case .getArticlesByType(let page, let itemsPerPage, let media, let favoris, let idAuthor):
            if let idAuthor = idAuthor {
                return ["page": page, "itemsPerPage": itemsPerPage, "media": media, "favorite": String(favoris), "idAuthor": idAuthor]
            } else {
                return ["page": page, "itemsPerPage": itemsPerPage, "media": media, "favorite": String(favoris)]
            }
        case .setFavorisArticle(_, let isFavorite):
            return ["favorite": isFavorite]
        /* case .updateFilter(let filter):
            let filterDictArray = filter.map { filterArticle -> [String: Any] in
                    return [
                        "id": filterArticle.id,
                        "libelle": filterArticle.name,
                        "isFavorite": filterArticle.isFavorite,
                        "subareas": filterArticle.subareas.map { subarea -> [String: Any] in
                            return [
                                "id": subarea.id,
                                "libelle": subarea.name,
                                "isFavorite": subarea.isFavorite,
                                // Add more properties if necessary
                            ]
                        }
                    ]
                }
            return ["interestAreas": filterDictArray] */
        case .getFilterArticle:
            return nil
        }
    }

    var headers: [String : String] {
        switch self {
        case .getArticles, .getArticlesByType, .getFilterArticle:
            return ["accept":"application/json", "Authorization": "DG8E9TVDF-AAAAAAAAAAAAAAAAAAAA-329927"]
        case .setFavorisArticle:
            return ["accept":"application/json", "Authorization": "DG8E9TVDF-AAAAAAAAAAAAAAAAAAAA-329927", "Content-Type": "application/merge-patch+json"]
        default:
            return ["":""]
        }
    }

    var alamofireHeaders: HTTPHeaders {
        return HTTPHeaders(headers)
    }
}
