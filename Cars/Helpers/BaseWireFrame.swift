//
//  BaseWireFrame.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit

class BaseWireframe {
    
    private unowned var _viewController: UIViewController
    
    //to retain view controller reference upon first access
    private var _temporaryStoredViewController: UIViewController?
    
    init(viewController: UIViewController) {
        _temporaryStoredViewController = viewController
        _viewController = viewController
    }
}

extension BaseWireframe {
    var viewController: UIViewController {
        defer { _temporaryStoredViewController = nil }
        return _viewController
    }
    
    var navigationController: UINavigationController? {
        return (UIApplication.shared.delegate?.window as? UIWindow)?.rootViewController as? UINavigationController
    }
}
