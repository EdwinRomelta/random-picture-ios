//
//  Register.swift
//  domain
//
//  Created by ImNotPro on 15/04/19.
//

import RxSwift

public class Register: CompletableUseCase<RegisterParam> {
    
    private let sessionRepository: SessionRepository
    
    init(sessionRepository: SessionRepository,
         threadExecutor : ThreadExecutor,
         postExecutionThread: PostThreadExecutor) {
        self.sessionRepository = sessionRepository
        super.init(threadExecutor, postExecutionThread)
    }
    
    public override func buildUseCaseObservable(_ params: RegisterParam) -> Completable {
        return sessionRepository.register(params)
    }
}

public struct RegisterParam{
    public let name: String
    public let email: String
    public let password: String
}
