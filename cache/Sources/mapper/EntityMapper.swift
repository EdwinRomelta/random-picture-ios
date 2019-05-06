//
//  EntityMapper.swift
//  cache
//
//  Created by ImNotPro on 27/04/19.
//

import Foundation

/**
 * Interface for model mappers. It provides helper methods that facilitate
 * retrieving of models from outer data source layers
 *
 * @param <T> the cached model input type
 * @param <T> the remote model input type
 * @param <V> the model return type
 */
protocol EntityMapper {

    associatedtype Cache
    associatedtype Data

    func mapFromCached(_ type: Cache) -> Data

    func mapToCached(_ type: Data) -> Cache

}
