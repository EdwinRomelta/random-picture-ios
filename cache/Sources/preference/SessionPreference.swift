//
//  SessionSharedPreference.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import RxSwift
import RxCocoa

private let keyId = "id"
private let keyToken = "token"
private let keyName = "name"
private let keyAvatar = "avatar"

public class SessionPreference {

    public init() {

    }

    func store(_ cachedSession: CachedSession) -> Completable {
        return Completable.create { completable in
            UserDefaults.standard.set(cachedSession.id, forKey: keyId)
            UserDefaults.standard.set(cachedSession.token, forKey: keyToken)
            UserDefaults.standard.set(cachedSession.name, forKey: keyName)
            UserDefaults.standard.set(cachedSession.avatarUrl, forKey: keyAvatar)
            completable(.completed)
            return Disposables.create {}
        }
    }

    func get() -> Observable<CachedSession> {
        return Observable.zip(UserDefaults.standard.rx.observe(String.self, keyId),
                              UserDefaults.standard.rx.observe(String.self, keyToken),
                              UserDefaults.standard.rx.observe(String.self, keyName),
                              UserDefaults.standard.rx.observe(String.self, keyAvatar),
                              resultSelector: { id, token, name, avatar in
                                CachedSession(id: id, name: name, token: token, avatarUrl: avatar)
        })
    }

    func clear() -> Completable {
        return Completable.create { completable in
            UserDefaults.standard.removePersistentDomain(forName: keyId)
            UserDefaults.standard.removePersistentDomain(forName: keyToken)
            UserDefaults.standard.removePersistentDomain(forName: keyName)
            UserDefaults.standard.removePersistentDomain(forName: keyAvatar)
            completable(.completed)
            return Disposables.create {}
        }
    }
}
