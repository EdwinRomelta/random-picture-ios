//
//  PostMapper.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//

import presenter
import SwiftDate

public class PostMapper: Mapper {

    typealias View = PostViewModel
    typealias Presenter = PostView

    public init() {

    }

    func mapToViewModel(_ type: PostView) -> PostViewModel {
        return PostViewModel(id: type.id,
                        imgPath: type.imgPath,
                        text: type.text,
                        timeStamp: type.timeStamp?.toRelative(style: RelativeFormatter.twitterStyle()))
    }

}
