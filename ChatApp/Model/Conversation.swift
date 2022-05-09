//
//  Conversation.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import Foundation

struct Conversation : Decodable {
    let id : String
    let other_emailId : String
    let last_message : String
}
