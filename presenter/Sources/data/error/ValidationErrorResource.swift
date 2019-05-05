//
//  ValidationErrorResource.swift
//  presenter
//
//  Created by ImNotPro on 05/05/19.
//

import Foundation

public class ValidationErrorResource : ErrorResource{
    
    public let errorCode : Int
    
    init(_ errorCode : Int) {
        self.errorCode = errorCode
    }
}
