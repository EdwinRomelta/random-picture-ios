//
//  CacheModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import data
import cache
import CoreData

struct CacheModule: Module {
    static func configure(binder: SingletonBinder) {

        binder
            .bind(RandomPictureDatabase.self)
            .sharedInScope()
            .to(factory: RandomPictureDatabase.init)

        binder
            .bind(NSManagedObjectContext.self)
            .sharedInScope()
            .to { (randomPictureDatabase: Provider<RandomPictureDatabase>) in
                return randomPictureDatabase.get().context
        }

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

        binder
            .bind(PostCache.self)
            .sharedInScope()
            .to(factory: PostCacheImpl.init)

        binder
            .bind()
            .sharedInScope()
            .to(factory: PostEntityMapper.init)

        binder
            .bind(CachePostDao.self)
            .sharedInScope()
            .to(factory: CachePostDao.init)

    }
}
