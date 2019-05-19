//
//  PostRemoteDataStore.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import domain
import RxSwift

public class PostRemoteDataStore: PostDataStore {

    private let postRemote: PostRemote

    public init(postRemote: PostRemote) {
        self.postRemote = postRemote
    }

    func getPosts() -> Observable<[PostEntity]> {
        return postRemote.getPosts().asObservable()
    }

    func savePosts(_ posts: [PostEntity]) -> Completable {
        fatalError("Unsupported Operation")
    }

}
