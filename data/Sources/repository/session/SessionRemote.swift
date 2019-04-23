//
//  SessionRemote.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import RxSwift

public protocol SessionRemote {
    
    func setSession(_ token: String?) -> Completable
    
    func doRegister(_ email: String,_ name: String,_ password: String) -> Single<SessionEntity>
    
    func doLogin(_ email: String,_ password: String) -> Single<SessionEntity>
    
}
