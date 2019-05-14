//
//  PostRemote.swift
//  data
//
//  Created by ImNotPro on 12/05/19.
//

import domain
import RxSwift

public protocol PostRemote {
    
    func getPosts() -> Single<[PostEntity]>
    
}
