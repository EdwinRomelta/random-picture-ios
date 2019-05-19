//
//  AppDelegate.swift
//  ui
//
//  Created by ImNotPro on 13/04/19.
//  Copyright © 2019 Edwin. All rights reserved.
//

import FLEX
import UIKit
import Cleanse
import presenter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        #if DEBUG
            FLEXManager.shared().showExplorer()
        #endif

        do {
            let propertyInjector = try ComponentFactory.of(ApplicationComponent.self).build(())
            propertyInjector.injectProperties(into: self)
        } catch (let error) {
            print(error)
        }
        window!.backgroundColor = UIColor.white
        window!.makeKeyAndVisible()
        return true
    }

}
