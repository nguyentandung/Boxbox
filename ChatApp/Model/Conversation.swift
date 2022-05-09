//
//  Conversation.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import Foundation

struct Conversation : Decodable {
    let id : String
    let messageIdList : [String]
    let userIdList : [String]
}
