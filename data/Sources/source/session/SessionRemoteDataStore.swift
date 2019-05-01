//
//  SessionRemoteDataStore.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain
import RxSwift

public class SessionRemoteDataStore: SessionDataStore {
    
    private let sessionRemote: SessionRemote
    
    public init(sessionRemote: SessionRemote) {
        self.sessionRemote = sessionRemote
    }
    
    func getSession() -> Observable<SessionEntity> {
        fatalError("Unsupported Operation Exception")
    }
    
    func doRegister(_ registerParam: RegisterParam) -> Single<SessionEntity> {
        return sessionRemote.doRegister(registerParam.email, registerParam.name, registerParam.password)
    }
    
    func doLogin(_ loginParam: LoginParam) -> Single<SessionEntity> {
        return  sessionRemote.doLogin(loginParam.email, loginParam.password)
    }
    
    func store(_ sessionEntity: SessionEntity) -> Completable {
        return sessionRemote.setSession(sessionEntity.token)
    }
    
    func clear() -> Completable {
        return sessionRemote.setSession(nil)
    }
    
}
