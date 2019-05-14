//
//  RandomPictureAPI.swift
//  remote
//
//  Created by ImNotPro on 07/05/19.
//

import Foundation
import Moya

enum RandomPictureAPI {
    case login(_ loginRequest: LoginRequest)
    case register(_ email: String, _ name: String, _ password: String)
    case getPosts
}

func stubbedResponse(_ fileName: String) -> Data {
    @objc class TestClass: NSObject { }

    let bundle = Bundle(for: TestClass.self)
    guard let path = bundle.path(forResource: fileName, ofType: "json") else {
        fatalError("No stubbed response for \(fileName)")
    }
    guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
        fatalError("Failed to read data \(fileName)")
    }
    return data
}

extension RandomPictureAPI: TargetType {

    static var baseUrl: String?

    var baseURL: URL {
        guard let url = URL(string: RandomPictureAPI.baseUrl!) else {
            fatalError("baseUrl is not configurated")
        }
        return url
    }
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .register:
            return "/register"
        case .getPosts:
            return "/posts"
        }
    }
    var method: Moya.Method {
        switch self {
        case .login, .register:
            return .post
        case .getPosts:
            return .get
        }
    }
    var sampleData: Data {
        switch self {
        case .login:
            return stubbedResponse("Login")
        case .register:
            return stubbedResponse("Register")
        case .getPosts:
            return stubbedResponse("Login")
        }
    }
    var task: Task {
        switch self {
        case .login(let loginRequest):
            return .requestJSONEncodable(loginRequest)
        case .register:
            return .requestPlain
        case .getPosts:
                return .requestPlain
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
