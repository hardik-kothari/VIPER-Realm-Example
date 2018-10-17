//
//  Logger.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation
import Moya

enum LoggerLevel: Int {
    case debug = 0
    case warning = 1
    case error = 2
}

struct Logger {
    public var level: LoggerLevel = .debug
    
    func log(_ text: String, level: LoggerLevel) {
        if level.rawValue >= self.level.rawValue {
            print(text)
        }
    }
}

extension Logger: LoggerProtocol {
    func log(warning: String) {
        log(warning, level: .warning)
    }
    
    func log(debug: String) {
        log(debug, level: .debug)
    }
    
    func log(error: String) {
        log(error, level: .error)
    }
    
    func log(error: Error?) {
        if let error = error as? MoyaError {
            var text = "Moya Error: \(error)"
            if let request = error.response?.request { text += "Request: \(request)" }
            if let response = error.response { text += "Response: \(response)" }
            log(error: text)
        } else if let error = error {
            log(error: "Error: \(error)")
        }
    }
    
    func log(request: URLRequest, statusCode:Int) {
        log("StatusCode: \(statusCode) for request: \(request)", level: .error)
    }
}
