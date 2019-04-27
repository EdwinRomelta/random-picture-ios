//
//  CachedSession.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//


class CachedSession{
    let id: String?
    let name: String?
    let token: String?
    let avatarUrl: String?
    
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
