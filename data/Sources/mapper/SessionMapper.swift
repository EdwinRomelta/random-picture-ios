//
//  SessionMapper.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain

class SessionMapper : Mapper{
    
    typealias entity = SessionEntity
    typealias domain = Session
    
    func mapFromEntity(_ type: SessionEntity) -> Session {
        return Session(id: type.id,
                       name: type.name,
                       avatarUrl: type.avatarUrl)
    }
    
    func mapToEntity(_ type: Session) -> SessionEntity {
        fatalError("Unsupported Operation Exception")
    }
}
