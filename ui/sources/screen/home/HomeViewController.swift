//
//  HomeViewController.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//

import UIKit
import Cleanse

class HomeViewController: UIViewController {

    var mainInjector: PropertyInjector<MainViewController>!

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let childViewController = MainViewController()
        mainInjector.injectProperties(into: childViewController)
        addChild(childViewController)
        view.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
        
        var horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|", options: [], metrics: nil, views: [
            "childView": childViewController.view
            ])
        
        var vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|", options: [], metrics: nil, views: [
            "childView": childViewController.view
            ])
        
        view.addConstraints(horzConstraints)
        view.addConstraints(vertConstraints)
        
        childViewController.view.translatesAutoresizingMaskIntoConstraints = false

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

extension HomeViewController {
    func injectProperties(_ mainInjector: PropertyInjector<MainViewController>) {
        self.mainInjector = mainInjector
    }
}
