//
//  Extensions.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit
import MBProgressHUD

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(ofType _: T.Type, withIdentifier identifier: String? = nil) -> T {
        let identifier = identifier ?? String(describing: T.self)
        return instantiateViewController(withIdentifier: identifier) as! T
    }
}

extension UIViewController {
    func presentWireframe(_ wireframe: BaseWireframe, animated: Bool = true, completion: (()->())? = nil) {
        wireframe.viewController.modalPresentationStyle = .overCurrentContext
        present(wireframe.viewController, animated: animated, completion: completion)
    }
    
    func dismissWireframe(_ animated: Bool = true, completion: (()->())? = nil) {
        dismiss(animated: animated, completion: completion)
    }

    func showActivityIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.showAdded(to: self.view, animated: true)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: self.view, animated: true)
        }
    }
}

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        self.pushViewController(wireframe.viewController, animated: animated)
    }
    
    func popWireframe(_ animated: Bool = true) {
        self.popViewController(animated: animated)
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        let newController = String(describing: wireframe.viewController.classForCoder)
        var existingVC: UIViewController!
        for viewController in self.viewControllers {
            let existingController = String(describing: viewController.classForCoder)
            if newController == existingController {
                existingVC = viewController
                break
            }
        }
        if existingVC != nil {
            self.popToViewController(existingVC, animated: true)
        } else {
            self.setViewControllers([wireframe.viewController], animated: animated)
        }
    }
}

extension String {
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        if let date = dateFormatter.date(from: self) {
            let calendar = Calendar.current
            let launchYear = calendar.component(.year, from: date)
            let currentYear = calendar.component(.year, from: Date())
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "dd MMMM yyyy, "
            if launchYear == currentYear {
                dateFormatter.dateFormat = "dd MMMM, "
            }
            if !timeIs24HourFormat() {
                dateFormatter.dateFormat += "h:mm a"
            } else {
                dateFormatter.dateFormat += "HH:mm"
            }
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            print("There was an error decoding the string")
            return ""
        }
    }
    
    func timeIs24HourFormat() -> Bool {
        let locale = NSLocale.current
        let formatter: String = DateFormatter.dateFormat(fromTemplate: "j", options:0, locale:locale)!
        if formatter.contains("a") {
            return false
        } else {
            return true
        }
    }
}
