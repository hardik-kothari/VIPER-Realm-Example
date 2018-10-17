//
//  NetworkError.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import Moya

public enum NetworkError: Error {
    case noInternet
    case timeout
    case internalError(statusCode: Int?)
    
    init(_ error: MoyaError?, statusCode: Int? = nil) {
        if let urlError = error?.urlError {
            switch urlError.code {
            case .notConnectedToInternet:
                self = .noInternet
            case .timedOut:
                self = .timeout
            default:
                self = .internalError(statusCode: statusCode ?? error?.response?.statusCode)
            }
        } else {
            self = .internalError(statusCode: statusCode ?? error?.response?.statusCode)
        }
    }
    
    public var statusCode: Int? {
        switch self {
        case .internalError(let statusCode):
            return statusCode
        default:
            return nil
        }
    }
    
}

extension MoyaError {
    var urlError:URLError? {
        switch self {
        case .underlying(let error, _):
            return error as? URLError
        default:
            return nil
        }
    }
}
