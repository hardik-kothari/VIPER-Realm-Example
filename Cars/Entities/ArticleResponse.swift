//
//  ArticleResponse.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Mapper

class ArticleResponse: Mappable {
    
    var status: String = ""
    var articleList: [Article] = []
    
    required init(map: Mapper) throws {
        status = (try? map.from("status")) ?? ""
        let articleList: [Article] = try map.from("content")
        self.articleList = articleList
    }
}
