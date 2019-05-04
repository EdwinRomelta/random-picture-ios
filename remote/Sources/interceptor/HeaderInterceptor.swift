//
//  HeaderInterceptor.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import Alamofire

class HeaderInterceptor : RequestAdapter{
    
    private let HEADER_AUTHORIZATION = "authorization"
    private var token : String? = nil
    
    func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        var urlRequest = urlRequest
        if (token != nil) {
            urlRequest.setValue(token, forHTTPHeaderField: HEADER_AUTHORIZATION)
        }
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        return urlRequest
    }
    
    func addToken(_ token : String){
        self.token = token
    }
    
    func clearHeader() {
        token = nil
    }
}
