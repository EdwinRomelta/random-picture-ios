
//
//  SessionSharedPreference.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import RxSwift
import RxCocoa

private let KEY_ID = "id"
private let KEY_TOKEN = "token"
private let KEY_NAME = "name"
private let KEY_AVATAR = "avatar"

public class SessionPreference{
    
    public init(){
        
    }
    
    func store(_ cachedSession : CachedSession) -> Completable{
        return Completable.create { completable in
            UserDefaults.standard.set(cachedSession.id, forKey: KEY_ID)
            UserDefaults.standard.set(cachedSession.token, forKey: KEY_TOKEN)
            UserDefaults.standard.set(cachedSession.name, forKey: KEY_NAME)
            UserDefaults.standard.set(cachedSession.avatarUrl, forKey: KEY_AVATAR)
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func get() -> Observable<CachedSession> {
        return Observable.zip(UserDefaults.standard.rx.observe(String.self, KEY_ID),
                              UserDefaults.standard.rx.observe(String.self, KEY_TOKEN),
                              UserDefaults.standard.rx.observe(String.self, KEY_NAME),
                              UserDefaults.standard.rx.observe(String.self, KEY_AVATAR),
                              resultSelector: { id,token,name,avatar in
                                CachedSession(id: id, name: name, token: token, avatarUrl: avatar)
        })
    }
    
    func clear() -> Completable{
        return Completable.create { completable in
            UserDefaults.standard.removePersistentDomain(forName: KEY_ID)
            UserDefaults.standard.removePersistentDomain(forName: KEY_TOKEN)
            UserDefaults.standard.removePersistentDomain(forName: KEY_NAME)
            UserDefaults.standard.removePersistentDomain(forName: KEY_AVATAR)
            completable(.completed)
            return Disposables.create {}
        }
    }
}
