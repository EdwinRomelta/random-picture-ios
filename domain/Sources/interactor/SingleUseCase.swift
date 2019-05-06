//
//  SingleUseCase.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift

/**
 * Abstract class for a UseCase that returns an instance of a [Single].
 */
class SingleUseCase<T, Params> {

    private let threadExecutor: ThreadExecutor
    private let postExecutionThread: PostThreadExecutor
    private var subscription = Disposables.create()

    init(threadExecutor: ThreadExecutor,
        postExecutionThread: PostThreadExecutor) {
        self.threadExecutor = threadExecutor
        self.postExecutionThread = postExecutionThread
    }

    /**
     * Builds a [Single] which will be used when the current [SingleUseCase] is executed.
     */
    func buildUseCaseObservable(_ params: Params? = nil) -> Single<T> {
        return Single.never()
    }

    /**
     * Executes the current use case.
     */
    public func execute(singleObserver: @escaping (SingleEvent<T>) -> Void, params: Params? = nil) {
       subscription =  self.buildUseCaseObservable(params)
            .subscribeOn(threadExecutor)
            .observeOn(postExecutionThread)
            .subscribe(singleObserver)
    }

    /**
     * Unsubscribes from current [Disposable].
     */
    public func dispose() {
        subscription.dispose()
    }
}
