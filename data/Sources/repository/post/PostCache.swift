//
//  PostCache.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import RxSwift

public protocol PostCache {

    func getPosts() -> Observable<[PostEntity]>

    func savePosts(_ posts: [PostEntity]) -> Completable
}
