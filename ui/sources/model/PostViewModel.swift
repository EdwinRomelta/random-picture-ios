//
//  PostViewModel.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//
import Foundation

public struct PostViewModel {

    public let id: String?
    public let imgPath: String?
    public let text: String?
    public let timeStamp: String?

    public init(id: String?,
                imgPath: String?,
                text: String?,
                timeStamp: String?) {
        self.id = id
        self.imgPath = imgPath
        self.text = text
        self.timeStamp = timeStamp
    }
}
