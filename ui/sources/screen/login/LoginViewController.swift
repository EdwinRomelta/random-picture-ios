//
//  LoginViewController.swift
//  ui
//
//  Created by ImNotPro on 27/04/19.
//

import UIKit
import Cleanse
import data
import presenter
import Rswift

class LoginViewController: BaseViewController {

    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    var loginViewModel: LoginViewModel!
    var spinner = UIActivityIndicatorView(style: .whiteLarge)

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
        self.loginViewModel.loginResponse.drive(onNext: { resourse in
                switch resourse.state {
                    case .LOADING:
                        self.emailTextField.isUserInteractionEnabled = false
                        self.passwordTextField.isUserInteractionEnabled = false
                        self.emailErrorLabel.visibility = .gone
                        self.passwordErrorLabel.visibility = .gone
                        self.registerButton.visibility = .gone
                        self.loginButton.visibility = .gone
                        self.loadingIndicator.visibility = .visible
                    case .SUCCESS:
                        self.emailTextField.isUserInteractionEnabled = true
                        self.passwordTextField.isUserInteractionEnabled = true
                        self.registerButton.visibility = .visible
                        self.loginButton.visibility = .visible
                        self.loadingIndicator.visibility = .gone
                    case .ERROR:
                        self.emailTextField.isUserInteractionEnabled = true
                        self.passwordTextField.isUserInteractionEnabled = true
                        self.registerButton.visibility = .visible
                        self.loginButton.visibility = .visible
                        self.loadingIndicator.visibility = .gone
                        guard let errorResource = resourse.error else {
                            return
                        }
                        if let validationErrorResource = errorResource as? ValidationErrorResource {
                            if (validationErrorResource.errorCode & LoginViewModel.validationEmptyEmail > 0) {
                                self.emailErrorLabel.text = R.string.localizable.signupscreen_erroremptyemail()
                                self.emailErrorLabel.visibility = .visible
                            } else if (validationErrorResource.errorCode & LoginViewModel.validationInvalidEmail > 0) {
                                self.emailErrorLabel.text = R.string.localizable.signupscreen_errorinvalidemail()
                                self.emailErrorLabel.visibility = .visible
                            }

                            if (validationErrorResource.errorCode & LoginViewModel.validationEmptyPassword > 0) {
                                self.passwordErrorLabel.text = R.string.localizable.signupscreen_erroremptypassword()
                                self.passwordErrorLabel.visibility = .visible
                            }
                        }
                        if let dialogErrorResource = errorResource as? DialogErrorResource {
                            dialogErrorResource.show(self)
                        }
            }
        }).disposed(by: disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLogin(_ sender: Any) {
        loginViewModel.doLogin(emailTextField.text ?? "",
                               passwordTextField.text ?? "")
    }
}

extension LoginViewController {
    func injectProperties(_ loginViewModel: LoginViewModel) {
        self.loginViewModel = loginViewModel
    }
}
