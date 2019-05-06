//
//  Session.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

public struct Session {

    public let id: String?
    public let name: String?
    public let avatarUrl: String?

    public init(id: String?,
                name: String?,
                avatarUrl: String?) {
        self.id = id
        self.name = name
        self.avatarUrl = avatarUrl
    }
}
