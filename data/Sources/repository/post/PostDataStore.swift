//
//  PostDataStore.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import domain
import RxSwift

protocol PostDataStore {

    func getPosts() -> Observable<[PostEntity]>

    func savePosts(_ posts: [PostEntity]) -> Completable
}
