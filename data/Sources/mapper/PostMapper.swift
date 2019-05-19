//
//  PostMapper.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import domain

public class PostMapper: Mapper {

    typealias Entity = PostEntity
    typealias Domain = Post

    public init() {

    }

    func mapFromEntity(_ type: PostEntity) -> Post {
        return Post(id: type.id,
                       imgPath: type.imgPath,
                       text: type.text,
                        timeStamp: type.timeStamp)
    }

    func mapToEntity(_ type: Post) -> PostEntity {
        fatalError("Unsupported Operation Exception")
    }
}
