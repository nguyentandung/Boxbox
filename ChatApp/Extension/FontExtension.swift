//
//  FontExtension.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 26/04/2022.
//

import Foundation
import UIKit

enum FontName : String {
    case robotoMedium = "Roboto-Medium"
    case robotoLight = "Roboto-Light"
    case robotoBlackItalic = "Roboto-BlackItalic"
}

extension UIFont {
    func initFont(name: String,size:CGFloat) -> UIFont {
        return UIFont(name: name, size: size)!
    }
}
