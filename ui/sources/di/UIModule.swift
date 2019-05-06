//
//  UIModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import UIKit
import Cleanse
import RxSwift
import domain

struct UIModule: Module {
    struct ATag: Tag { typealias Element = String }
    public static func configure(binder: SingletonBinder) {
        binder.include(module: UIScreen.Module.self)
        binder.include(module: UIWindow.Module.self)

        binder
            .bind(ImmediateSchedulerType.self)
            .tagged(with: PostThreadExecutorImpl.self)
            .sharedInScope()
            .to(value: MainScheduler.instance)

        binder
            .bind()
            .to(factory: RootViewController.init)

        binder
            .bindPropertyInjectionOf(LoginViewController.self)
            .to(injector: LoginViewController.injectProperties)

        binder
            .bindPropertyInjectionOf(SplashViewController.self)
            .to(injector: SplashViewController.injectProperties)
    }

}

extension UIScreen {
    /// This is a simple module that binds UIScreen.mainScreen() to UIScreen
    public struct Module: Cleanse.Module {
        public static func configure(binder: UnscopedBinder) {
            binder
                .bind(UIScreen.self)
                .to { UIScreen.main }
        }
    }
}

extension UIWindow {
    /// This is the module that configures how we build our main window. It ias assumed when one requests
    /// injection of an un-tagged UIWindow, we will be giving them the "main" or "key" window.
    public struct Module: Cleanse.Module {
        public static func configure(binder: SingletonBinder) {
            binder
                .bind(UIWindow.self)
                .sharedInScope()
                .to { (rootViewController: Provider<RootViewController>, mainScreen: UIScreen) in
                    let window = UIWindow(frame: mainScreen.bounds)
                    window.rootViewController = rootViewController.get()
                    return window
            }
        }
    }
}
