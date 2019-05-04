//
//  DefaultErrorResource.swift
//  presenter
//
//  Created by ImNotPro on 01/05/19.
//

import Foundation

public class DialogErrorResource: ErrorResource {
    
    public let message : String
    
    init(_ message : String) {
        self.message = message
    }
}
