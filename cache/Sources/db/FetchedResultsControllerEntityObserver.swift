//
//  FetchedResultsControllerEntityObserver.swift
//  cache
//
//  Created by ImNotPro on 18/05/19.
//

import Foundation
import CoreData
import RxSwift

final class FetchedResultsControllerEntityObserver<T: NSFetchRequestResult>: NSObject, NSFetchedResultsControllerDelegate {

    typealias Observer = AnyObserver<[T]>

    fileprivate let observer: Observer
    fileprivate let disposeBag = DisposeBag()
    fileprivate let fetchResultController: NSFetchedResultsController<T>

    init(observer: Observer, fetchRequest: NSFetchRequest<T>, managedObjectContext context: NSManagedObjectContext, sectionNameKeyPath: String?, cacheName: String?) {
        self.observer = observer

        self.fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                              managedObjectContext: context,
                                              sectionNameKeyPath: sectionNameKeyPath,
                                              cacheName: cacheName)
        super.init()

        context.perform {
            self.fetchResultController.delegate = self
            do {
                try self.fetchResultController.performFetch()
            } catch {
                observer.on(.error(error))
            }
            self.sendNextElement()
        }
    }

    fileprivate func sendNextElement() {
        self.fetchResultController.managedObjectContext.perform {
            let entities = self.fetchResultController.fetchedObjects ?? []
            self.observer.on(.next(entities))
        }
    }

    public func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        sendNextElement()
    }
}

extension FetchedResultsControllerEntityObserver: Disposable {

    public func dispose() {
        fetchResultController.delegate = nil
    }

}
