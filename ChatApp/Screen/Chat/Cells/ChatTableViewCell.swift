//
//  ChatTableViewCell.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 15/04/2022.
//

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        customFont()
    }

    func customFont() {
        self.contentMessage.font = UIFont().initFont(name: FontName.robotoLight.rawValue, size: 15)
    }
    
}
