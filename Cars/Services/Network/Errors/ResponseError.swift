//
//  ResponseError.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import Moya

public enum ResponseError<E>: Error {
    case network(error: NetworkError)
    case service(error: E)
    
    public var serviceError: E? {
        switch self {
        case .service(let error):
            return error
        default:
            return nil
        }
    }
    
    public var networkError: NetworkError? {
        switch self {
        case .network(let error):
            return error
        default:
            return nil
        }
    }
    
    public init(_ error: NetworkError) {
        self = .network(error: error)
    }
    
    public init(_ error: E) {
        self = .service(error: error)
    }
    
    public init(_ error: MoyaError) {
        switch error.urlError?.code {
        case .some(.notConnectedToInternet):
            self = .network(error: .noInternet)
        case .some(.timedOut):
            self = .network(error: .timeout)
        default:
            self = .network(error: .internalError(statusCode: nil))
        }
    }
}
