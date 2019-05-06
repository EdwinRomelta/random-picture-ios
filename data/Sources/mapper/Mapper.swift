//
//  Mapper.swift
//  data
//
//  Created by ImNotPro on 15/04/19.
//

/**
 * Interface for model mappers. It provides helper methods that facilitate
 * retrieving of models from outer data source layers
 *
 * @param <T> the cached model input type
 * @param <T> the remote model input type
 * @param <V> the model return type
 */
protocol Mapper {

    associatedtype Entity
    associatedtype Domain

    func mapFromEntity(_ type: Entity) -> Domain

    func mapToEntity(_ type: Domain) -> Entity

}
