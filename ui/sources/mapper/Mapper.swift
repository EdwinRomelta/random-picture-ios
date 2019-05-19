//
//  Mapper.swift
//  ui
//
//  Created by ImNotPro on 12/05/19.
//

protocol Mapper {

    associatedtype View
    associatedtype Presenter

    func mapToViewModel(_ type: Presenter) -> View

}
