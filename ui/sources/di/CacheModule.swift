//
//  CacheModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import data
import cache

struct CacheModule : Module {
    static func configure(binder: SingletonBinder) {
        binder
            .bind(SessionCache.self)
            .sharedInScope()
            .to(factory: SessionCacheImpl.init )
        
        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionPreference.init)

        binder
            .bind()
            .sharedInScope()
            .to(factory: SessionEntityMapper.init)

    }
}
