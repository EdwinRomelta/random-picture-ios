//
//  RandomPictureService.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

import domain
import Alamofire
import RxAlamofire
import RxSwift
import Cleanse

public class RandomPictureService{
    
    private let scheduler : ImmediateSchedulerType
    private let baseUrl : String
    
    public init(scheduler : TaggedProvider<RemoteExecutorThread>,
         baseUrl : TaggedProvider<BaseUrl>) {
        self.scheduler = scheduler.get()
        self.baseUrl = baseUrl.get()
    }
    
    func login(_ email: String,_ password: String) -> Single<UserModel>{
       return RxAlamofire
            .data(.post, "\(baseUrl)/login/")
            .observeOn(scheduler)
            .map{ try JSONDecoder().decode(UserModel.self, from: $0) }
            .asSingle()
    }
    
    func register(_ email: String,_ name:String,_ password: String) -> Single<UserModel>{
        return RxAlamofire
            .data(.post, "\(baseUrl)/register/")
            .observeOn(scheduler)
            .map{ try JSONDecoder().decode(UserModel.self, from: $0) }
            .asSingle()
    }
}

public struct BaseUrl : Tag {
    public typealias Element = String
}

public struct RemoteExecutorThread : Tag {
    public typealias Element = ImmediateSchedulerType
}
