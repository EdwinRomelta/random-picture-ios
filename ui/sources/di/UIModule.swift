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

struct UIModule : Module {
    public static func configure(binder: SingletonBinder) {
        binder
            .bind(ImmediateSchedulerType.self)
            .tagged(with: PostThreadExecutorImpl.self)
            .sharedInScope()
            .to(value: MainScheduler.instance)
        binder
            .bind()
            .to(factory: LoginViewController.init)
    }
    
}

extension UIWindow {
    /// This is the module that configures how we build our main window. It ias assumed when one requests
    /// injection of an un-tagged UIWindow, we will be giving them the "main" or "key" window.
    public struct Module : Cleanse.Module {
        public static func configure(binder: SingletonBinder) {
            binder
                .bind(UIWindow.self)
                .sharedInScope()
                .to { UIWindow.init(frame: UIScreen.main.bounds) }
        }
    }
}

extension UIViewController {
    /// This will represent the rootViewController that is assigned to our main window
    public struct Root : Tag {
        public typealias Element = UIViewController
    }
}
