//
//  Validation.swift
//  presenter
//
//  Created by ImNotPro on 01/05/19.
//

private let emailRegex = "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" +
    "\\@" +
    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
    "(" +
    "\\." +
    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
")+"
private let emailPredicate =  NSPredicate(format:"SELF MATCHES %@", emailRegex)

extension String{
    
    var isEmail : Bool {
        return emailPredicate.evaluate(with: self)
    }
}
