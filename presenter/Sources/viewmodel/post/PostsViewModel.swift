//
//  PostViewModel.swift
//  presenter
//
//  Created by ImNotPro on 12/05/19.
//

import domain
import RxSwift
import RxCocoa
import Cleanse

public class PostsViewModel: BaseViewModel {

    public let postResponse: Driver<Resource<[PostView]>>
    private let dispose = DisposeBag()

    private let getPosts: GetPosts
    private let postMapper: PostMapper
    private let postResponsePublisher: PublishSubject<Resource<[PostView]>>

    public init(postMapper: PostMapper,
                getPosts: GetPosts) {
        self.postMapper = postMapper
        self.getPosts = getPosts

        postResponsePublisher = PublishSubject.init()
        postResponsePublisher.onNext(Resource.loading())
        postResponse = postResponsePublisher.asDriver(onErrorJustReturn: Resource<[PostView]>.error(error: DialogErrorResource("Oops, something went wrong")))
        super.init()

        self.compositeDisposable.insert(self.getPosts.execute(self.getPostsSubscriber(event:), ()))
    }

    private func getPostsSubscriber(event: Event<[Post]>) {
        switch event {
        case .next(let posts):
            postResponsePublisher.onNext(Resource<[PostView]>.success(data: posts.map {postMapper.mapToView($0)}))
        case .error(let error):
            print(error)
            postResponsePublisher.onNext(Resource<[PostView]>.error(error: DialogErrorResource("Oops, something went wrong")))
        case .completed: break
        }
    }
}
