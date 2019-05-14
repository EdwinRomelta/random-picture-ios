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
import data
import Moya
import RxMoya

public class RandomPictureService {

    private let provider = MoyaProvider<RandomPictureAPI>()
    private let scheduler: ImmediateSchedulerType
    private let decoder = JSONDecoder()

    public init(scheduler: TaggedProvider<RemoteExecutorThread>, baseUrl: TaggedProvider<BaseUrl>) {
        RandomPictureServiceFactory.createService()
        self.scheduler = scheduler.get()
        RandomPictureAPI.baseUrl = baseUrl.get()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(formatter)
    }

    func login(_ loginRequest: LoginRequest) -> Single<UserModel> {
        return provider.rx.request(.login(loginRequest))
                .filterSuccessfulStatusCodes()
                .map(UserModel.self)
                .observeOn(scheduler)
    }

    func register(_ email: String, _ name: String, _ password: String) -> Single<UserModel> {
        return provider.rx.request(.register(email, name, password))
                .filterSuccessfulStatusCodes()
                .map(UserModel.self)
                .observeOn(scheduler)
    }
    
    func getPosts() -> Single<[PostModel]> {
        return provider.rx.request(.getPosts)
            .filterSuccessfulStatusCodes()
            .map([PostModel].self,using: decoder)
            .observeOn(scheduler)
    }
}

public struct BaseUrl: Tag {
    public typealias Element = String
}

public struct RemoteExecutorThread: Tag {
    public typealias Element = ImmediateSchedulerType
}
