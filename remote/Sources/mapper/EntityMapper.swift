//
//  EntityMapper.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

/**
 * Interface for model mappers. It provides helper methods that facilitate
 * retrieving of models from outer data source layers
 *
 * @param <remote> the remote model input type
 * @param <data> the entity model output type
 */
protocol EntityMapper {
    
    associatedtype data
    associatedtype remote
    
    func mapFromRemote(_ type: remote) -> data
    
}
