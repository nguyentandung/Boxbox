//
//  UIViewController.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 10/05/2022.
//

import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

extension UIViewController {
    
    func showLoading() {
        let frame = CGRect(x: self.view.frame.size.width/2, y: self.view.frame.size.height/2, width: 40, height: 40)
        let view = BoxboxLoading(frame: frame, type: .ballClipRotatePulse)
        self.view.addSubview(view)
        view.startLoading()
    }
    
    func hideLoading() {
       
    }
}
