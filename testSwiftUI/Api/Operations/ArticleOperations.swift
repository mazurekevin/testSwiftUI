//
//  ArticleOperations.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ArticleOperationSuccess = (Data?) -> Void
typealias ArticleOperationFailure = (Error) -> Void

enum ArticleOperations {
    case custom(ArticleRequest)

    func performRequest(success: @escaping (JSON?) -> Void, failure: @escaping ArticleOperationFailure) {
        guard case let .custom(articleRequest) = self else {
            fatalError("Invalid case for ArticleOperations")
        }

        let url = ArticleRequest.baseUrl + articleRequest.requestName
        let method = articleRequest.method
        let parameters = articleRequest.parameters
        let headers = articleRequest.alamofireHeaders
        /*print(url)
        print(method)
        print(parameters)
        print(headers)*/
        APIRequest.performJSONRequest(url: url, method: method, parameters: parameters, headers: headers) { result in
            switch result {
            case .success(let json):
                print("------------ \(articleRequest.name ?? "") ------------")
                success(json)
            case .failure(let error):
                self.handleFailure(error: error, failure: failure)
            }
        }
    }

    private func handleFailure(error: Error, failure: ArticleOperationFailure) {
        // Handle error response
        failure(error)
    }
}




