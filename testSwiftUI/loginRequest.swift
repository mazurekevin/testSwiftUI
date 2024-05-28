//
//  loginRequest.swift
//  testSwiftUI
//
//  Created by teamdoc on 28/05/2024.
//

import Foundation
import Alamofire

enum LoginRequest {
    static let baseUrl = "https://api1.santor.biz/api/"

    case login(email: String, password: String)
    case logout
    case checkEmail(email: String)
    case resetPassword(email: String)
    
    var name: String? {
        switch self {
        case .login:
            return "LOGIN"
        case .logout:
            return "LOGOUT"
        case .checkEmail:
            return "CHECK_EMAIL"
        case .resetPassword:
            return "RESET_PASSWORD"
        }
    }
    
    var requestName: String {
        switch self {
        case .login:
            return "login"
        case .logout:
            return "logout"
        case .checkEmail:
            return "check-username"
        case .resetPassword:
            return "reset-password"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login, .checkEmail, .resetPassword:
            return .post
        case .logout:
            return .delete
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .login(let email, let password):
            return ["username": email, "password": password]
        case .checkEmail(let email):
            return ["username": email]
        case .logout:
            return ["disconnectAllDevices": false]
        case .resetPassword(let email):
            return ["username": email]
        }
    }
    
    var headers: [String : String] {
        switch self {
        case .login, .resetPassword:
            return ["accept": "application/json"]
        case .logout, .checkEmail:
            //let bearer = "Bearer \(Config.instance.token)"
            return ["accept": "application/json", "Authorization": "bearer"]
        }
    }

    var alamofireHeaders: HTTPHeaders {
        return HTTPHeaders(headers)
    }
}
