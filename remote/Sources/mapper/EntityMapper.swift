//
//  EntityMapper.swift
//  remote
//
//  Created by ImNotPro on 23/04/19.
//

/**
 * Interface for model mappers. It provides helper methods that facilitate
 * retrieving of models from outer Data source layers
 *
 * @param <Remote> the Remote model input type
 * @param <Data> the entity model output type
 */
protocol EntityMapper {

    associatedtype Data
    associatedtype Remote

    func mapFromRemote(_ type: Remote) -> Data

}
