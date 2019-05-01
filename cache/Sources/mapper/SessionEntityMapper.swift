//
//  SessionEntityMapper.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import data

public class SessionEntityMapper: EntityMapper {
    
    typealias cache = CachedSession
    typealias data = SessionEntity

    public init(){
        
    }
    
    func mapFromCached(_ type: CachedSession) -> SessionEntity {
        return SessionEntity(id: type.id,
                             name: type.name,
                             token: type.token,
                             avatarUrl: type.avatarUrl)
    }
    
    func mapToCached(_ type: SessionEntity) -> CachedSession {
        return CachedSession(id: type.id,
                             name: type.name,
                             token: type.token,
                             avatarUrl: type.avatarUrl)
    }
    
}
