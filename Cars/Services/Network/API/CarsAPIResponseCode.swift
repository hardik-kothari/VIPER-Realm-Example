//
//  CarsAPIResponseCode.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit

enum CarsAPIResponseCode: Int {
    case ok = 200
    case noContent = 204
    case dataNotUpdated = 304
    case badRequest = 400
    case unauthorized = 401
    case notFound = 404
    case noAcceptable = 406
    case internalError = 500
}
