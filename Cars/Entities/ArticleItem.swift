//
//  ArticleItem.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Mapper
import RealmSwift

class ArticleItem: Mappable, Entity {
    typealias RealmEntityType = ArticleItemRealm
    
    var type: String = ""
    var subject: String = ""
    var desc: String = ""
    
    public init(entity: RealmEntityType) {
        self.type = entity.type
        self.subject = entity.subject
        self.desc = entity.desc
    }
    
    required init(map: Mapper) throws {
        type = (try? map.from("type")) ?? ""
        subject = (try? map.from("subject")) ?? ""
        desc = (try? map.from("description")) ?? ""
    }
    
    var realmObject: ArticleItemRealm {
        return ArticleItemRealm(entity: self)
    }
}

class ArticleItemRealm: Object, RealmEntity {
    typealias EntityType = ArticleItem
    
    @objc dynamic var type: String = ""
    @objc dynamic var subject: String = ""
    @objc dynamic var desc: String = ""
    
    convenience required init(entity: EntityType) {
        self.init()
        self.type = entity.type
        self.subject = entity.subject
        self.desc = entity.desc
    }

    var entityObject: ArticleItem {
        return ArticleItem(entity: self)
    }
}
