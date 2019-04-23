//
//  SessionRepository.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift

public protocol SessionRepository {
    
    func getSession() -> Observable<Session>
    
    func register(_ registerParam: RegisterParam) -> Completable
    
    func login(_ loginParam: LoginParam) -> Completable
    
    func logout() -> Completable
}
