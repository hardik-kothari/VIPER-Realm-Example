//
//  StyleGuide.swift
//  Cars
//
//  Created by Hardik on 16/10/2561 BE.
//  Copyright © 2561 Hardik Kothari. All rights reserved.
//

import UIKit

extension UIColor {
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 76.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var black82: UIColor {
        return UIColor(white: 0.0, alpha: 0.82)
    }
    
    @nonobjc class var greyBlue: UIColor {
        return UIColor(red: 107.0 / 255.0, green: 124.0 / 255.0, blue: 146.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var darkGreyBlue: UIColor {
        return UIColor(red: 50.0 / 255.0, green: 51.0 / 255.0, blue: 91.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greyish: UIColor {
        return UIColor(white: 172.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var greyishBrownTwo: UIColor {
        return UIColor(white: 74.0 / 255.0, alpha: 1.0)
    }
}

extension UIFont {
    
    class var detailTitle: UIFont {
        return UIFont.systemFont(ofSize: 27.0, weight: .medium)
    }
    
    class var listTitle: UIFont {
        return UIFont.systemFont(ofSize: 24.0, weight: .medium)
    }
    
    class var detailSubject: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .medium)
    }
    
    class var detailIngress: UIFont {
        return UIFont.systemFont(ofSize: 18.0, weight: .regular)
    }
    
    class var logo: UIFont {
        return UIFont.systemFont(ofSize: 17.0, weight: .medium)
    }
    
    class var detailDescription: UIFont {
        return UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    
    class var listIngress: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }
    
    class var sideBarMenuItem: UIFont {
        return UIFont.systemFont(ofSize: 14.0, weight: .medium)
    }
    
    class var dateTime: UIFont {
        return UIFont.systemFont(ofSize: 13.0, weight: .regular)
    }
}
