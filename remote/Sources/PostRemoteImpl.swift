//
//  PostRemoteImpl.swift
//  remote
//
//  Created by ImNotPro on 12/05/19.
//

import data
import RxSwift

public class PostRemoteImpl: PostRemote {
    
    
    private let randomPictureService: RandomPictureService
    private let postMapper: PostMapper
    
    public init(randomPictureService: RandomPictureService,
                postMapper: PostMapper) {
        self.randomPictureService = randomPictureService
        self.postMapper = postMapper
    }
    
    public func getPosts() -> Single<[PostEntity]> {
        return randomPictureService.getPosts()
            .map { $0.map{self.postMapper.mapFromRemote($0)} }
    }

}
