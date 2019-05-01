//
//  LoginViewController.swift
//  ui
//
//  Created by ImNotPro on 27/04/19.
//

import UIKit
import Cleanse
import presenter

class LoginViewController: UIViewController, Tag {
    typealias Element = LoginViewController
    
    let loginViewModel : LoginViewModel
    
    init(loginViewModel : LoginViewModel) {
        self.loginViewModel = loginViewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    struct Module : Cleanse.Module {
        static func configure(binder: SingletonBinder) {
        }
    }
}
