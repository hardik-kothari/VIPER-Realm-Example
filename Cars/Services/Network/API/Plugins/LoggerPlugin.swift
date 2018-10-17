//
//  LoggerPlugin.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Moya
import Result

struct LoggerPlugin: PluginType {
    let Logger: LoggerProtocol
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .failure(let error):
            Logger.log(error: error)
        case .success(let result):
            if let request = result.request, result.statusCode != 200 {
                Logger.log(request: request, statusCode:result.statusCode)
            }
        }
    }
}
