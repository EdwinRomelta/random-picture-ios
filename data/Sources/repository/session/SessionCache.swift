//
//  SessionCache.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import RxSwift

public protocol SessionCache {
    
    func store(_ sessionEntity: SessionEntity) -> Completable
    
    func get() -> Observable<SessionEntity>
    
    func clear() -> Completable
}
