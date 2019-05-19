//
//  PostMapper.swift
//  remote
//
//  Created by ImNotPro on 12/05/19.
//

import data

public class PostMapper: EntityMapper {

    typealias Data = PostEntity
    typealias Remote = PostModel

    public init() {

    }

    func mapFromRemote(_ type: PostModel) -> PostEntity {
        return PostEntity(id: type.id,
                             imgPath: type.imgPath,
                             text: type.text,
                             timeStamp: type.timeStamp)
    }

}
