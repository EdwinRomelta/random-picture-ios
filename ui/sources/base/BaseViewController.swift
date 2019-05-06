//
//  BaseViewController.swift
//  ui
//
//  Created by ImNotPro on 04/05/19.
//

import UIKit
import RxSwift
import presenter

class BaseViewController: UIViewController {

    let disposeBag = DisposeBag()

}

extension DialogErrorResource {

    func show(_ viewController: UIViewController) {
        let alert = UIAlertController(title: R.string.localizable.appname(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: R.string.localizable.dialog_ok(), style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
}
