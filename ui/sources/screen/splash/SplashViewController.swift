//
//  SplashViewController.swift
//  ui
//
//  Created by ImNotPro on 02/05/19.
//

import UIKit
import presenter

class SplashViewController: UIViewController {

    var loginViewModel: LoginViewModel!

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        AppDelegate.shared.router.toLoginScreen()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SplashViewController {
    func injectProperties(_ loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
}
