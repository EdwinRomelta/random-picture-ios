//
//  SessionRemoteImpl.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

struct LoginRequest: Codable {
    let email: String
    let password: String

    init(_ email: String,
         _ password: String) {
        self.email = email
        self.password = password
    }

    private enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
}
