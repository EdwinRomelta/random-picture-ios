//
//  Login.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift
import Cleanse

public class Login: CompletableUseCase<LoginParam> {

    private let sessionRepository: SessionRepository

    public init(sessionRepository: SessionRepository,
         threadExecutor: TaggedProvider<ThreadExecutorImpl>,
         postExecutionThread: TaggedProvider<PostThreadExecutorImpl>) {
        self.sessionRepository = sessionRepository
        super.init(threadExecutor.get(), postExecutionThread.get())
    }

    public override func buildUseCaseObservable(_ params: LoginParam) -> Completable {
        return sessionRepository.login(params)
    }
}

public struct LoginParam {
    public let email: String
    public let password: String

    public init(_ email: String,
         _ password: String) {
        self.email = email
        self.password = password
    }
}
