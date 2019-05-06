//
//  SessionMapper.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

import domain

public class SessionMapper: Mapper {

    typealias Entity = SessionEntity
    typealias Domain = Session

    public init() {

    }

    func mapFromEntity(_ type: SessionEntity) -> Session {
        return Session(id: type.id,
                       name: type.name,
                       avatarUrl: type.avatarUrl)
    }

    func mapToEntity(_ type: Session) -> SessionEntity {
        fatalError("Unsupported Operation Exception")
    }
}
