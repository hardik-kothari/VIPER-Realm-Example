//
//  RealmServiceProtocol.swift
//  Cars
//
//  Created by Hardik on 17/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation

struct Sorted {
    var key: String
    var ascending: Bool = true
}

protocol RealmServiceProtocol: class {
    associatedtype EntityType

    func save(item: EntityType) throws
    
    func save(items: [EntityType]) throws
    
    func update(block: @escaping () -> ()) throws
    
    func delete(item: EntityType) throws
    
    func deleteAll() throws
    
    func fetch(predicate: NSPredicate?, sorted: Sorted?) -> [EntityType]
    
    func fetchAll() -> [EntityType]
}

protocol Entity {
    associatedtype RealmEntityType
    var realmObject: RealmEntityType { get }
}

protocol RealmEntity {
    associatedtype EntityType
    var entityObject: EntityType { get }
}
