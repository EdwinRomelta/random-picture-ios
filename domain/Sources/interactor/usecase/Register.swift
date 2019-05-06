//
//  Register.swift
//  domain
//
//  Created by ImNotPro on 15/04/19.
//

import RxSwift
import Cleanse

public class Register: CompletableUseCase<RegisterParam> {

    private let sessionRepository: SessionRepository

    public init(sessionRepository: SessionRepository,
                threadExecutor: TaggedProvider<ThreadExecutorImpl>,
                postExecutionThread: TaggedProvider<PostThreadExecutorImpl>) {
        self.sessionRepository = sessionRepository
        super.init(threadExecutor.get(), postExecutionThread.get())
    }

    public override func buildUseCaseObservable(_ params: RegisterParam) -> Completable {
        return sessionRepository.register(params)
    }
}

public struct RegisterParam {
    public let name: String
    public let email: String
    public let password: String
}
