//
//  Message.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import Foundation

struct Message : Codable {
    let id : String
    let content : String
    let time : String
    let senderId : String
}

