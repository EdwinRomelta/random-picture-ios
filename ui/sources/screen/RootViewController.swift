//
//  RootViewController.swift
//  ui
//
//  Created by ImNotPro on 04/05/19.
//

import UIKit
import Cleanse

class RootViewController: UIViewController {

    var splashInjector: PropertyInjector<SplashViewController>
    var loginInjector: PropertyInjector<LoginViewController>
    var homeInjector: PropertyInjector<HomeViewController>
    var currentScreen: UIViewController

    init(
        splashInjector: PropertyInjector<SplashViewController>,
        loginInjector: PropertyInjector<LoginViewController>,
        homeInjector: PropertyInjector<HomeViewController>) {
        self.splashInjector = splashInjector
        self.loginInjector = loginInjector
        self.homeInjector = homeInjector

        let splashViewController = SplashViewController()
        splashInjector.injectProperties(into: splashViewController)
        self.currentScreen = splashViewController
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(currentScreen)
        currentScreen.view.frame = view.bounds
        view.addSubview(currentScreen.view)
        currentScreen.didMove(toParent: self)
    }

    func toLoginScreen() {
        let loginViewController = LoginViewController()
        loginInjector.injectProperties(into: loginViewController)
        let loginScreen = UINavigationController(rootViewController: loginViewController)
        addChild(loginScreen)
        loginScreen.view.frame = view.bounds
        view.addSubview(loginScreen.view)
        loginScreen.didMove(toParent: self)
        currentScreen.willMove(toParent: nil)
        currentScreen.view.removeFromSuperview()
        currentScreen.removeFromParent()
        currentScreen = loginScreen
    }

    func toHomeScreen() {
        let homeViewController = HomeViewController()
        homeInjector.injectProperties(into: homeViewController)
        let homeScreen = UINavigationController(rootViewController: homeViewController)
        addChild(homeScreen)
        homeScreen.view.frame = view.bounds
        view.addSubview(homeScreen.view)
        homeScreen.didMove(toParent: self)
        currentScreen.willMove(toParent: nil)
        currentScreen.view.removeFromSuperview()
        currentScreen.removeFromParent()
        currentScreen = homeScreen
    }
}

extension AppDelegate {

    static var shared: AppDelegate {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            return appDelegate
        }
        fatalError("Failed to casting app delegate")
    }

    var router: RootViewController {
        if let rootViewController =   window?.rootViewController as? RootViewController {
            return rootViewController
        }
        fatalError("Failed to casting rootViewController")
    }
}
