//
//  ConversationsTableViewCell.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 09/05/2022.
//

import UIKit

class ConversationsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgAvatarUser: UIImageView!
    @IBOutlet weak var lblGroupName: UILabel!
    @IBOutlet weak var lblLastContentMessage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
