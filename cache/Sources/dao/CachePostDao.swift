//
//  CachePostDao.swift
//  cache
//
//  Created by ImNotPro on 18/05/19.
//

import RxSwift
import CoreData

public class CachePostDao: BaseDao<CachedPost> {

    public override init(context: NSManagedObjectContext) {
        super.init(context: context)
    }

    func all() -> Observable<[CachedPost]> {
        let idSortDescriptor = NSSortDescriptor(key: "id", ascending: true)
        let sortDescriptors = [idSortDescriptor]
        return query(with: nil, sortDescriptors: sortDescriptors)
    }

//    func save(_ entity : CachedPost) -> Completable {
//        return Completable.deferred {
//            do {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Post")
//
//                let result = try self.context.fetch(fetchRequest) as? CachedPost
//                if(result == nil){
//                    let newEntity = try NSEntityDescription.insertNewObject(forEntityName: "Post", into: self.context) as? CachedPost
//                    newEntity?.update(entity)
//                } else{
//                    result?.update(entity)
//                }
//                try? self.context.save()
//                return Completable.empty()
//            } catch {
//                return Completable.error(error)
//            }
//        }
//    }
}
