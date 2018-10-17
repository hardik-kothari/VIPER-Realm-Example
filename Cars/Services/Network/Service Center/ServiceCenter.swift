//
//  ServiceCenter.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Moya

public enum ServiceCenterError: Error {
    case serviceNotFound
}

public class ServiceCenter: NSObject {
    
    static var services: [Any] = []
    
    public static func register(_ service:Any) {
        services.append(service)
    }
    
    public static func inject<T: Any>() throws -> T {
        for service in services {
            if let service = service as? T {
                return service
            }
        }
        print("Service is not registered", String(describing: T.self))
        throw ServiceCenterError.serviceNotFound
    }
}

extension ServiceCenter {
    
    public static func configure() {
        let logger =  Logger()
        
        let provider = CarsProvider (
            plugins: [
                NetworkActivityPlugin(),
                LoggerPlugin(Logger: logger)
            ]
        )
        ServiceCenter.register(logger)
        
        let articleService = ArticleService(provider:provider, logger:logger)
        ServiceCenter.register(articleService)
    }
}
