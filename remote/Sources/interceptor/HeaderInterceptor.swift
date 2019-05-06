//
//  HeaderInterceptor.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import Alamofire

class HeaderInterceptor: RequestAdapter {

    private let headerAuthorization = "authorization"
    private var token: String?

    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if (token != nil) {
            urlRequest.setValue(token, forHTTPHeaderField: headerAuthorization)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }

    func addToken(_ token: String) {
        self.token = token
    }

    func clearHeader() {
        token = nil
    }
}
