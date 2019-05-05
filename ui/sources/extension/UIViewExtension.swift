//
//  UIViewExtension.swift
//  ui
//
//  Created by ImNotPro on 04/05/19.
//

import UIKit
import Rswift

extension UIView {
    
    enum Visibility: String {
        case visible = "visible"
        case invisible = "invisible"
        case gone = "gone"
    }
    
    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }
    
    @IBInspectable
    var visibilityState: String {
        get {
            return self.visibility.rawValue
        }
        set {
            let _visibility = Visibility(rawValue: newValue)!
            self.visibility = _visibility
        }
    }
    
    private func setVisibility(_ visibility: Visibility) {
        let constraints = self.constraints.filter({$0.firstAttribute == .height && $0.constant == 0 && $0.secondItem == nil && ($0.firstItem as? UIView) == self})
        let constraint = (constraints.first)

        switch visibility {
        case .visible:
            constraint?.isActive = false
            self.isHidden = false
            break
        case .invisible:
            constraint?.isActive = false
            self.isHidden = true
            break
        case .gone:
            self.isHidden = true
            if let constraint = constraint {
                constraint.isActive = true
            } else {
                let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                // constraint.priority = UILayoutPriority(rawValue: 999)
                self.addConstraint(constraint)
                constraint.isActive = true
            }
            self.setNeedsLayout()
            self.setNeedsUpdateConstraints()
        }
    }
}
