//
//  ObservableUseCase.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift

/**
 * Abstract class for a UseCase that returns an instance of a [Single].
 */
open class ObservableUseCase<T, Params> {
    
    private let threadExecutor : ThreadExecutor
    private let postExecutionThread : PostThreadExecutor
    private var disposables = CompositeDisposable()
    
    init(threadExecutor : ThreadExecutor,
         postExecutionThread: PostThreadExecutor) {
        self.threadExecutor = threadExecutor
        self.postExecutionThread = postExecutionThread
    }
    
    /**
     * Builds a [Single] which will be used when the current [FlowableUseCase] is executed.
     */
    func buildUseCaseObservable(_ params: Params? = nil) -> Observable<T>{
        return Observable.never()
        
    }
    
    /**
     * Executes the current use case.
     */
    public func execute(observer: @escaping (Event<T>) -> Void, params: Params? = nil) {
       let observable = self.buildUseCaseObservable(params)
            .subscribeOn(threadExecutor)
            .observeOn(postExecutionThread)
            .subscribe(observer)
        addDisposable(observable)
    }
    
    /**
     * Unsubscribes from current [Disposable].
     */
    public func dispose(){
        if(!disposables.isDisposed){
            disposables.dispose()
        }
    }
    
    private func addDisposable(_ disposable : Disposable){
        disposables.insert(disposable)
    }
}
