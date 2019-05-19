//
//  PostMapper.swift
//  presenter
//
//  Created by ImNotPro on 12/05/19.
//

import domain

public class PostMapper: Mapper {

    typealias View = PostView
    typealias Domain = Post

    public init() {

    }

    func mapToView(_ type: Post) -> PostView {
        return PostView(id: type.id,
                          imgPath: type.imgPath,
                          text: type.text,
                          timeStamp: type.timeStamp)
    }

}
