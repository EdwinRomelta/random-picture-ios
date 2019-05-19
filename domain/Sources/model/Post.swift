//
//  Post.swift
//  domain
//
//  Created by ImNotPro on 12/05/19.
//

public struct Post {

    public let id: String?
    public let imgPath: String?
    public let text: String?
    public let timeStamp: Date?

    public init(id: String?,
                imgPath: String?,
                text: String?,
                timeStamp: Date?) {
        self.id = id
        self.imgPath = imgPath
        self.text = text
        self.timeStamp = timeStamp
    }
}
