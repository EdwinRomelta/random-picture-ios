//
//  Login.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift

public class Login: CompletableUseCase<LoginParam> {
    
    private let sessionRepository: SessionRepository
    
    init(sessionRepository: SessionRepository,
         threadExecutor : ThreadExecutor,
         postExecutionThread: PostThreadExecutor) {
        self.sessionRepository = sessionRepository
        super.init(threadExecutor, postExecutionThread)
    }
    
    public override func buildUseCaseObservable(_ params: LoginParam) -> Completable {
        return sessionRepository.login(params)
    }
}

public struct LoginParam{
    public let email: String
    public let password: String
}
