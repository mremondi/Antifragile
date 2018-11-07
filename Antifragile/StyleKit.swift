//
//  StyleKit.swift
//  Antifragile
//
//  Created by Michael Remondi on 9/20/18.
//  Copyright © 2018 Michael Remondi. All rights reserved.
//

import Foundation
import UIKit

struct StyleKit{
    
    struct Colors{
        static let backgroundGrey = UIColor(red: 46/255.0, green: 46/255.0, blue: 46/255.0, alpha: 1.0)
        static let tabBarGrey = UIColor(red: 38/255.0, green: 38/255.0, blue: 38/255.0, alpha: 1.0)
        static let primaryPurple = UIColor(red: 163/255.0, green: 47/255.0, blue: 183/255.0, alpha: 1.0)
        static let primaryBlue = UIColor(red: 47/255.0, green: 122/255.0, blue: 183/255.0, alpha: 1.0)
        
        static let pastelRed = UIColor(red: 255/255.0, green: 104/255.0, blue: 104/255.0, alpha: 1.0)
    }
    
    struct Font{
        enum FontType {
            case bold
            case boldItalic
            case italic
            case light
            case lightItalic
            case regular
            case semiBold
            case semiBoldItalic
            case thin
            case thinItalic
        }
        
        static func primaryFont(size: CGFloat, type: FontType) -> UIFont{
            var font: UIFont?
            switch type{
            case .bold:
                font = UIFont(name: "JosefinSans-Bold", size: size)
            case .boldItalic:
                font = UIFont(name: "JosefinSans-BoldItalic", size: size)
            case .italic:
                font = UIFont(name: "JosefinSans-Italic", size: size)
            case .light:
                font = UIFont(name: "JosefinSans-Light", size: size)
            case .lightItalic:
                font = UIFont(name: "JosefinSans-LightItalic", size: size)
            case .regular:
                font = UIFont(name: "JosefinSans-Regular", size: size)
            case .semiBold:
                font = UIFont(name: "JosefinSans-SemiBold", size: size)
            case .semiBoldItalic:
                font = UIFont(name: "JosefinSans-SemiBoldItalic", size: size)
            case .thin:
                font = UIFont(name: "JosefinSans-Thin", size: size)
            case .thinItalic:
                font = UIFont(name: "JosefinSans-ThinItalic", size: size)
            }
            guard let customFont = font else {
                return UIFont(name: "Helvetica", size: size)!
            }
            return customFont
        }
    }
}
