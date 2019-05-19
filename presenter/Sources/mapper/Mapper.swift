//
//  Mapper.swift
//  presenter
//
//  Created by ImNotPro on 12/05/19.
//

/**
 * Interface for model mappers. It provides helper methods that facilitate
 * retrieving of models from outer layers
 *
 * @param <V> the view model input type
 * @param <D> the domain model output type
 */
protocol Mapper {

    associatedtype View
    associatedtype Domain

    func mapToView(_ type: Domain) -> View

}
