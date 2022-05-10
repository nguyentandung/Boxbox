//
//  BoxBoxLoading.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 10/05/2022.
//

import Foundation
import UIKit
import NVActivityIndicatorView
import NVActivityIndicatorViewExtended

class BoxboxLoading : UIView {
    var activityLoading : NVActivityIndicatorView!
    
    init(frame: CGRect,type: NVActivityIndicatorType) {
        super.init(frame: frame)
        setupUI(frame:frame,type: type)
        startLoading()
    }
    
    private func setupUI(frame:CGRect,type:NVActivityIndicatorType) {
       activityLoading = NVActivityIndicatorView(frame: frame,
                                                type: type)
    }
    
    func startLoading() {
        activityLoading.startAnimating()
    }
    
    func stopLoading() {
        activityLoading.stopAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
