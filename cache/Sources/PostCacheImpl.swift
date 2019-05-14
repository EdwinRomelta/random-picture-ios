//
//  PostCacheImpl.swift
//  cache
//
//  Created by ImNotPro on 12/05/19.
//

import data
import RxSwift

public class PostCacheImpl: PostCache {
    
    let postEntityMapper: PostEntityMapper
    
    public init(postEntityMapper: PostEntityMapper){
        self.postEntityMapper = postEntityMapper
    }
    
    public func getPosts() -> Single<[PostEntity]> {
        fatalError()
    }
    
}
