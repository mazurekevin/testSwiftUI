//
//  ApiRequest.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias JSONRequestCompletion = (Result<JSON, Error>) -> Void

struct APIRequest {

    static func performJSONRequest(url: URLConvertible, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, completion: @escaping JSONRequestCompletion) {
        
        if method == .post || method == .patch || method == .put{
            AF.request(url, method: method, parameters: parameters,encoding: JSONEncoding.default, headers: headers)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        completion(.success(json))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }else if method == .get || method == .delete{
            AF.request(url, method: method, parameters: parameters, headers: headers)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        completion(.success(json))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
        
        
    }
    
}
