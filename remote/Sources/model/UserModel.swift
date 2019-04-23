//
//  UserModel.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import Foundation

struct UserModel : Codable{
    let id: String
    let name: String
    let avatarUrl: String
    let token: String? = nil
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case avatarUrl = "avatar_url"
        case token = "token"
    }
}
