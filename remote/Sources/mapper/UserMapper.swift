//
//  UserMapper.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import data

public class UserMapper : EntityMapper{
    
    typealias data = SessionEntity
    typealias remote = UserModel
    
    public init(){
        
    }
    
    func mapFromRemote(_ type: UserModel) -> SessionEntity {
        return SessionEntity(id : type.id,
                             name : type.name,
                             token : type.token,
                             avatarUrl : type.avatarUrl)
    }
    
}
