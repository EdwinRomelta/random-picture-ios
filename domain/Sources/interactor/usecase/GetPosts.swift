//
//  GetPosts.swift
//  domain
//
//  Created by ImNotPro on 12/05/19.
//

import RxSwift
import Cleanse

public class GetPosts: ObservableUseCase<[Post], Void> {

    private let postRepository: PostRepository

    public init(postRepository: PostRepository,
                threadExecutor: TaggedProvider<ThreadExecutorImpl>,
                postExecutionThread: TaggedProvider<PostThreadExecutorImpl>) {
        self.postRepository = postRepository
        super.init(threadExecutor.get(), postExecutionThread.get())
    }

    public override func buildUseCaseObservable(_ params: Void?) -> Observable<[Post]> {
        return postRepository.getPost()
    }
}
