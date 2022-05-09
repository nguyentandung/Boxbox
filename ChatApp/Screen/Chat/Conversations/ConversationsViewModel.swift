//
//  ConversationsViewModel.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 09/05/2022.
//

import UIKit

final class ConversationViewModel {
    init() {}
    
    func queryConversations(completion: @escaping ([Conversation]) -> Void) {
        let convs = [Conversation(id: "1", other_emailId: "Join", last_message: "Calling the end point will provide a list of the currency pairs that are supported."),
                     Conversation(id: "2", other_emailId: "Alias", last_message: "Each pair uses the base currency as determined by the establised priority rankings."),
                     Conversation(id: "3", other_emailId: "Tom", last_message: "If you want the tableview to scroll when"),
                     Conversation(id: "4", other_emailId: "Anessh", last_message: ""),
                     Conversation(id: "5", other_emailId: "Negi", last_message: "")]
        completion(convs)
    }
}
