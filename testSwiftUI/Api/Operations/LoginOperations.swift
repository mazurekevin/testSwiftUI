//
//  LoginOperations.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias LoginOperationSuccess = (JSON?) -> Void
typealias LoginOperationFailure = (Error) -> Void

enum LoginOperations {
    case custom(LoginRequest)

    func performRequest(success: @escaping LoginOperationSuccess, failure: @escaping LoginOperationFailure) {
        guard case let .custom(loginRequest) = self else {
            fatalError("Invalid case for LoginOperations")
        }
        let url = LoginRequest.baseUrl + loginRequest.requestName
        let method = loginRequest.method
        let parameters = loginRequest.parameters
        let headers = loginRequest.alamofireHeaders

        print(url)
        print(method)
        print(parameters)
        print(headers)
        APIRequest.performJSONRequest(url: url, method: method, parameters: parameters, headers: headers) { result in
            switch result {
            case .success(let json):
                print("------------ \(loginRequest.name ?? "") ------------")
                success(json)
            case .failure(let error):
                self.handleFailure(error: error, failure: failure)
            }
        }
    }

    private func handleFailure(error: Error, failure: LoginOperationFailure) {
        // Handle error response
        failure(error)
    }
}
