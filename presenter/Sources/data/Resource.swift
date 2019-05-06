//
//  Resource.swift
//  presenter
//
//  Created by ImNotPro on 01/05/19.
//

import Foundation

public class Resource <T: Any> {

    public let state: ResourceState
    public let data: T?
    public let error: ErrorResource?

    private init(_ state: ResourceState,
                 _ data: T?,
                 _ error: ErrorResource?) {
        self.state = state
        self.data = data
        self.error = error
    }

    static func success<T>(data: T)-> Resource<T> {
        return Resource<T>(ResourceState.SUCCESS, data, nil)
    }

    static func error<T>(error: ErrorResource)-> Resource<T> {
        return Resource<T>(ResourceState.ERROR, nil, error)
    }

    static func loading()-> Resource<T> {
        return Resource<T>(ResourceState.LOADING, nil, nil)
    }
}
