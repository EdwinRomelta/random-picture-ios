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

public class RandomPictureService {

    private let scheduler: ImmediateSchedulerType
    private let baseUrl: String

    public init(scheduler: TaggedProvider<RemoteExecutorThread>,
         baseUrl: TaggedProvider<BaseUrl>) {
        RandomPictureServiceFactory.createService()
        self.scheduler = scheduler.get()
        self.baseUrl = baseUrl.get()
    }

    func login(_ loginRequest: LoginRequest) -> Single<UserModel> {
        do {
            let parameters = try loginRequest.asParameter()
            return Alamofire.SessionManager.default.rx
                    .responseData(.post, "\(baseUrl)/login", parameters: parameters, encoding: JSONEncoding.prettyPrinted)
                    .observeOn(scheduler)
                    .mapObject(type: UserModel.self)
                    .asSingle()
        } catch {
            return Single.error(error)
        }
    }

    func register(_ email: String, _ name: String, _ password: String) -> Single<UserModel> {
        return Alamofire.SessionManager.default.rx
                .responseData(.post, "\(baseUrl)/register")
                .observeOn(scheduler)
                .mapObject(type: UserModel.self)
                .asSingle()
    }
}

extension ObservableType {

    public func mapObject<T: Codable>(type: T.Type) -> Observable<T> {
        return flatMap { data -> Observable<T> in
            let responseTuple = data as? (HTTPURLResponse, Data)

            guard let jsonData = responseTuple?.1 else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
                )
            }

            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: jsonData)

            return Observable.just(object)
        }
    }

    public func mapArray<T: Codable>(type: T.Type) -> Observable<[T]> {
        return flatMap { data -> Observable<[T]> in
            let responseTuple = data as? (HTTPURLResponse, Data)

            guard let jsonData = responseTuple?.1 else {
                throw NSError(
                    domain: "",
                    code: -1,
                    userInfo: [NSLocalizedDescriptionKey: "Could not decode object"]
                )
            }

            let decoder = JSONDecoder()
            let objects = try decoder.decode([T].self, from: jsonData)

            return Observable.just(objects)
        }
    }
}

extension Encodable {

    func asParameter() throws -> [String: Any] {
        do {
            let data = try JSONEncoder().encode(self)
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                return dictionary
            }
        } catch {
        }
        throw LayerError.remote
    }
}

public struct BaseUrl: Tag {
    public typealias Element = String
}

public struct RemoteExecutorThread: Tag {
    public typealias Element = ImmediateSchedulerType
}
