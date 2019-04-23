//
//  SessionDataStore.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain
import RxSwift

protocol SessionDataStore {
    
    func getSession() -> Observable<SessionEntity>
    
    func doRegister(_ registerParam: RegisterParam) -> Single<SessionEntity>
    
    func doLogin(_ loginParam: LoginParam) -> Single<SessionEntity>
    
    func store(_ sessionEntity: SessionEntity) -> Completable
    
    func clear() -> Completable
}
