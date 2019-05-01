//
//  DataModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import RxSwift
import domain
import data

struct DataModule : Module {
    static func configure(binder: SingletonBinder) {
        binder
            .bind(ImmediateSchedulerType.self)
            .tagged(with: ThreadExecutorImpl.self)
            .sharedInScope()
            .to(value: MainScheduler.asyncInstance)
        
        binder
            .bind(SessionRepository.self)
            .sharedInScope()
            .to(factory : SessionDataRepository.init )
        
        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionDataStoreFactory.init )
        
        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionCacheDataStore.init )
        
        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionRemoteDataStore.init )

        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionMapper.init )
    }
    
}
