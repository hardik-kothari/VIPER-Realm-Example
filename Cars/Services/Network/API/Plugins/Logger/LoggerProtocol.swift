//
//  LoggerProtocol.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import Foundation

protocol LoggerProtocol {
    var level: LoggerLevel { get set }
    func log(warning: String)
    func log(debug: String)
    func log(error: String)
    func log(error: Error?)
    func log(request: URLRequest, statusCode:Int)
}
