//
//  RandomPictureServiceFactory.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import Alamofire

class RandomPictureServiceFactory{
    
    private static let headerInterceptor = HeaderInterceptor()
    
    static func createService(){
        let sessionManager = Alamofire.SessionManager.default
        sessionManager.adapter = headerInterceptor
    }
    
    static func addSession(_ token: String) {
        headerInterceptor.addToken(token)
    }
    
    static func clearSession() {
        headerInterceptor.clearHeader()
    }
}
