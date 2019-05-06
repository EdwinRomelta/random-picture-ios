//
//  SessionEntity.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

public struct SessionEntity {
    public let id: String?
    public let name: String?
    public let token: String?
    public let avatarUrl: String?

    public init(id: String?,
         name: String?,
         token: String?,
         avatarUrl: String?) {
        self.id = id
        self.name = name
        self.token = token
        self.avatarUrl = avatarUrl
    }
}
