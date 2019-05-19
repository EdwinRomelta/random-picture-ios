//
//  PresenterModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import presenter

struct PresenterModule: Module {

    static func configure(binder: SingletonBinder) {
        binder
            .bind()
            .to(factory: LoginViewModel.init)

        binder
            .bind()
            .sharedInScope()
            .to(factory: presenter.PostMapper.init)

        binder
            .bind()
            .to(factory: PostsViewModel.init)
    }

}
