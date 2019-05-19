//
//  AbstractDao.swift
//  cache
//
//  Created by ImNotPro on 19/05/19.
//

import RxSwift
import CoreData

protocol AbstractDao {
    associatedtype T: CachedCoreData

    func query(with predicate: NSPredicate?,
               sortDescriptors: [NSSortDescriptor]?) -> Observable<[T]>

    func save(_ entity: T) -> Completable

}

public class BaseDao<T: CachedCoreData>: AbstractDao {

    private let context: NSManagedObjectContext

    public init(context: NSManagedObjectContext) {
        self.context = context
    }

    func query(with predicate: NSPredicate?,
               sortDescriptors: [NSSortDescriptor]?) -> Observable<[T]> {
        let fetchRequest = T.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        return Observable.create { observer in
            let observerAdapter = FetchedResultsControllerEntityObserver(
                observer: observer,
                fetchRequest: fetchRequest,
                managedObjectContext: self.context,
                sectionNameKeyPath: nil,
                cacheName: nil)
            return Disposables.create {
                observerAdapter.dispose()
            }
        }
    }

    func save(_ entity: T) -> Completable {
        return Completable.deferred {
            do {
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: T.entityName)

                let result = try self.context.fetch(fetchRequest) as? T
                if(result == nil) {
                    let newEntity = try NSEntityDescription.insertNewObject(forEntityName: T.entityName, into: self.context) as? T
                    newEntity?.update(entity)
                } else {
                    result?.update(entity)
                }
                try? self.context.save()
                return Completable.empty()
            } catch {
                return Completable.error(error)
            }
        }
    }

}
