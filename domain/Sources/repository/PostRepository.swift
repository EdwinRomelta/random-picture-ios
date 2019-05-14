//
//  PostRepository.swift
//  domain
//
//  Created by ImNotPro on 12/05/19.
//

import RxSwift
import Cleanse

public protocol PostRepository {
    
    func getPost() -> Single<[Post]>
}
