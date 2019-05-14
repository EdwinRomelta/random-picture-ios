//
//  DomainModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import domain

struct DomainModule: Module {

    static func configure(binder: SingletonBinder) {
        binder
            .bind()
            .to(factory: Login.init)
        
        binder
            .bind()
            .to(factory: GetPosts.init)
    }
}
