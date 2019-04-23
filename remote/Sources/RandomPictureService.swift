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

class RandomPictureService{
    
    private let scheduler : ImmediateSchedulerType
    private let baseUrl : String
    
    init(scheduler : ImmediateSchedulerType,
         baseUrl : String) {
        self.scheduler = scheduler
        self.baseUrl = baseUrl
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
