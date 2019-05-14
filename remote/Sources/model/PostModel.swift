//
//  PostModel.swift
//  remote
//
//  Created by ImNotPro on 12/05/19.
//

public struct PostModel : Codable {
    
    public let id: String
    public let imgPath: String
    public let text: String
    public let timeStamp: Date
    
    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case imgPath = "imgPath"
        case text = "text"
        case timeStamp = "timestamp"
    }
}
