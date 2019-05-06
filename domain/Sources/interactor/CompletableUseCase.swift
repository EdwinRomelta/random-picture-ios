//
//  CompletableUseCase.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift

/**
 * Abstract class for a UseCase that returns an instance of a [Completable].
 */
open class CompletableUseCase<Params> {

    private let threadExecutor: ThreadExecutor
    private let postExecutionThread: PostThreadExecutor
    private var subscription = Disposables.create()

    public init(_ threadExecutor: ThreadExecutor,
         _ postExecutionThread: PostThreadExecutor) {
        self.threadExecutor = threadExecutor
        self.postExecutionThread = postExecutionThread
    }

    /**
     * Builds a [Completable] which will be used when the current [CompletableUseCase] is executed.
     */
    func buildUseCaseObservable(_ params: Params) -> Completable {
        return Completable.never()
    }

    /**
     * Executes the current use case.
     */
    public func execute(completableObserver: @escaping (CompletableEvent) -> Void, params: Params) -> Disposable {
        subscription = self.buildUseCaseObservable(params)
            .subscribeOn(threadExecutor)
            .observeOn(postExecutionThread)
            .subscribe(completableObserver)
        return subscription
    }

    /**
     * Unsubscribes from current [Disposable].
     */
    func dispose() {
        subscription.dispose()
    }
}
