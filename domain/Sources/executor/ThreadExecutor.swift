//
//  ThreadExecutor.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift
import Cleanse

public typealias ThreadExecutor = ImmediateSchedulerType

public struct ThreadExecutorImpl: Tag {
    public typealias Element = ImmediateSchedulerType
}
