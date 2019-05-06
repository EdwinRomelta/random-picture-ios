//
//  PresenterModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import presenter

struct PresenterModule: Module {

    static func configure(binder: Binder<Unscoped>) {
        binder
            .bind()
            .to(factory: LoginViewModel.init)
    }

}
