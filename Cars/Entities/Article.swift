//
//  Article.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Mapper
import RealmSwift

class Article: Mappable, Entity {
    typealias RealmEntityType = ArticleRealm
    
    var id: Int = 0
    var title: String = ""
    var ingress: String = ""
    var imageURL: String = ""
    var launchDate: String = ""
    var tags: [String] = []
    var content: [ArticleItem] = []
    var createdDate: Int64 = 0
    var changedDate: Int64 = 0
    
    public init(entity: RealmEntityType) {
        self.id = entity.id
        self.title = entity.title
        self.ingress = entity.ingress
        self.imageURL = entity.imageURL
        self.launchDate = entity.launchDate
        self.tags = []
        for tag in entity.tags {
            self.tags.append(tag)
        }
        self.content = []
        for articleItem in entity.content {
            self.content.append(articleItem.entityObject)
        }
        self.createdDate = entity.createdDate
        self.changedDate = entity.changedDate
    }
    
    required init(map: Mapper) throws {
        id = (try? map.from("id")) ?? 0
        title = (try? map.from("title")) ?? ""
        ingress = (try? map.from("ingress")) ?? ""
        imageURL = (try? map.from("image")) ?? ""
        launchDate = (try? map.from("dateTime")) ?? ""
        tags = (try? map.from("tags")) ?? []
        let contentList: [ArticleItem] = try map.from("content")
        self.content = contentList
        createdDate = (try? map.from("created")) ?? 0
        changedDate = (try? map.from("changed")) ?? 0
    }
    
    var realmObject: ArticleRealm {
        return ArticleRealm(entity: self)
    }
}

class ArticleRealm: Object, RealmEntity {
    typealias EntityType = Article
    
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var ingress: String = ""
    @objc dynamic var imageURL: String = ""
    @objc dynamic var launchDate: String = ""
    var tags = List<String>()
    @objc dynamic var createdDate: Int64 = 0
    @objc dynamic var changedDate: Int64 = 0
    var content = List<ArticleItemRealm>()

    convenience required init(entity: EntityType) {
        self.init()
        self.id = entity.id
        self.title = entity.title
        self.ingress = entity.ingress
        self.imageURL = entity.imageURL
        self.launchDate = entity.launchDate
        self.tags = List<String>()
        for tag in entity.tags {
            self.tags.append(tag)
        }
        self.content = List<ArticleItemRealm>()
        for articleItem in entity.content {
            self.content.append(articleItem.realmObject)
        }
        self.createdDate = entity.createdDate
        self.changedDate = entity.changedDate
    }
    
    var entityObject: Article {
        return Article(entity: self)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
