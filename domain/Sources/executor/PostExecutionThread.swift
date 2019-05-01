//
//  PostExecutionThread.swift
//  domain
//
//  Created by ImNotPro on 14/04/19.
//

import RxSwift
import Cleanse

public typealias PostThreadExecutor = ImmediateSchedulerType

public struct PostThreadExecutorImpl : Tag {
    public typealias Element = ImmediateSchedulerType
}
