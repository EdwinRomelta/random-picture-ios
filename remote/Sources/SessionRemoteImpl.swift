//
//  SessionRemoteImpl.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import data
import RxSwift

public class SessionRemoteImpl: SessionRemote {
    
    private let randomPictureService : RandomPictureService
    private let userMapper : UserMapper
    
    public init(randomPictureService : RandomPictureService,
         userMapper : UserMapper) {
        self.randomPictureService = randomPictureService
        self.userMapper = userMapper
    }
    
    public func setSession(_ token: String?) -> Completable {
        return Completable.create{ completable in
            if let token = token {
                RandomPictureServiceFactory.addSession(token)
            } else {
                RandomPictureServiceFactory.clearSession()
            }
            return Disposables.create()
        }
    }
    
    public func doRegister(_ email: String, _ name: String, _ password: String) -> Single<SessionEntity> {
        return randomPictureService.register(email, name, password)
            .do(onSuccess: {
                if let token = $0.token{
                    RandomPictureServiceFactory.addSession(token)
                }
            })
            .map { self.userMapper.mapFromRemote($0) }
    }
    
    public func doLogin(_ email: String, _ password: String) -> Single<SessionEntity> {
        return randomPictureService.login(email, password)
            .do(onSuccess: {
                if let token = $0.token{
                    RandomPictureServiceFactory.addSession(token)
                }
            })
            .map { self.userMapper.mapFromRemote($0) }
    }
    
    
}
