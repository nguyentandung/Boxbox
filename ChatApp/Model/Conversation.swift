//
//  Conversation.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import Foundation

struct Conversation : Codable {
    let id : String
    let otherEmail : String
    let lastMessage : String
}
