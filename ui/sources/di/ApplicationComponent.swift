//
//  ApplicationComponent.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import UIKit
import Cleanse

struct ApplicationComponent : Cleanse.RootComponent {
    // When we call build() it will return the Root type, which is a PropertyInjector<AppDelegate>.
    // More on how we use the PropertyInjector type later.
    typealias Root = PropertyInjector<AppDelegate>
    
    // Required function from Cleanse.RootComponent protocol.
    static func configure(binder: Binder<Singleton>) {
        binder.include(module: UIWindow.Module.self)
        
        binder.include(module: UIModule.self)
        binder.include(module: PresenterModule.self)
        binder.include(module: DomainModule.self)
        binder.include(module: DataModule.self)
        binder.include(module: CacheModule.self)
        binder.include(module: RemoteModule.self)
    }
    
    // Required function from Cleanse.RootComponent protocol.
    static func configureRoot(binder bind: ReceiptBinder<Root>) -> BindingReceipt<Root> {
        return bind.propertyInjector(configuredWith: { bind in
            bind.to(injector: AppDelegate.injectProperties)
        })
    }
    
}

extension AppDelegate {
    func injectProperties(_ window: UIWindow,
                          _ loginViewController : LoginViewController) {
        self.window = window
        self.loginViewController = loginViewController
    }
}
