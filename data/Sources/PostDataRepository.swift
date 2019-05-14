//
//  PostDataRepository.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import Cleanse
import RxSwift
import domain

public class PostDataRepository: PostRepository {
    
    
    private let factory: PostDataStoreFactory
    private let postMapper: PostMapper
    
    public init(factory: PostDataStoreFactory,
                postMapper: PostMapper) {
        self.factory = factory
        self.postMapper = postMapper
    }
    
    public func getPost() -> Single<[Post]> {
        return factory.retrieveRemoteDataStore().getPosts()
            .map{$0.map{self.postMapper.mapFromEntity($0)}}
    }
    
}
