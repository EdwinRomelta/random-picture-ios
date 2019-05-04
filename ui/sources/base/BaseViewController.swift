//
//  BaseViewController.swift
//  ui
//
//  Created by ImNotPro on 04/05/19.
//

import UIKit
import RxSwift
import presenter

class BaseViewController : UIViewController{
    
    let disposeBag = DisposeBag()
    
    func show(_ errorResource : ErrorResource){
        if let dialogErrorResourse = errorResource as? DialogErrorResource {
            dialogErrorResourse.show(self)
        }
    }
}

extension DialogErrorResource {
    
    fileprivate func show(_ viewController : UIViewController){
        let alert = UIAlertController(title: "Random Picture", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true)
    }
}
