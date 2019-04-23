//
//  UserMapper.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import data

class UserMapper : EntityMapper{
    
    typealias data = SessionEntity
    typealias remote = UserModel
    
    func mapFromRemote(_ type: UserModel) -> SessionEntity {
        return SessionEntity(id : type.id,
                             name : type.name,
                             token : type.token,
                             avatarUrl : type.avatarUrl)
    }
    
}
