//
//  NetworkActivityPlugin.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Moya
import Result
import UIKit

struct NetworkActivityPlugin: PluginType {
    
    static var activeRequests: Int = 0
    
    func willSend(_ request: RequestType, target: TargetType) {
        NetworkActivityPlugin.activeRequests += 1
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        NetworkActivityPlugin.activeRequests -= 1
        if NetworkActivityPlugin.activeRequests < 1 {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
}
