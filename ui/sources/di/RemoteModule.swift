//
//  RemoteModule.swift
//  ui
//
//  Created by ImNotPro on 01/05/19.
//

import Cleanse
import RxSwift
import data
import remote

struct RemoteModule: Module {
    static func configure(binder: SingletonBinder) {
        binder
            .bind(ImmediateSchedulerType.self)
            .tagged(with: RemoteExecutorThread.self)
            .sharedInScope()
            .to(value: ConcurrentDispatchQueueScheduler(qos: .background))

        binder
            .bind()
            .sharedInScope()
            .to(factory: RandomPictureService.init)

        binder
            .bind(String.self)
            .tagged(with: BaseUrl.self)
            .sharedInScope()
            .to(value: "https://us-central1-random-picture.cloudfunctions.net/api")

        binder
            .bind()
            .sharedInScope()
            .to(factory: UserMapper.init)
        
        binder
            .bind()
            .sharedInScope()
            .to(factory: remote.PostMapper.init)

        binder
            .bind(SessionRemote.self)
            .sharedInScope()
            .to(factory: SessionRemoteImpl.init)
        
        binder
            .bind(PostRemote.self)
            .sharedInScope()
            .to(factory: PostRemoteImpl.init)
    }
}
