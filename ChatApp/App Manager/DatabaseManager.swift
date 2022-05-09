//
//  DatabaseManager.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import Foundation
import FirebaseFirestore
import UIKit
import Firebase
import FirebaseDatabase

enum CollectionPath {
    static let user = "User"
    static let message = "Message"
    static let group = "Group"
    static let department = "Department"
    static let conversation = "Conversation"
}

enum DocumentPath : String {
    case document = "/example"
}

class DatabaseManager {
    static let sharedInstance = DatabaseManager()
    private let database = Firestore.firestore()
    
    public func addMessage(with message:[Message]) {
//        let collectionPath = CollectionPath.message.rawValue
        for message in message {
            let data = ["id": message.id,
                        "content": message.content,
                        "time": message.time,
                        "senderId": message.senderId]
            database.collection(CollectionPath.message).document((String(format: "MessageId%@", message.id))).setData(data, merge: true)
        }
    }

    public func addDepartment(with deparment:Department) {
        
          var childData : [String] = []
           for i in 0..<deparment.child.count {
               childData.append(deparment.child[i])
           }
  
            let data : [String:Any] = ["child":childData,
                                       "parent":""]
            database.collection(CollectionPath.department).document(String(format: "BSV")).setData(data, merge: true)
    }
    
    
    
    func getCities() {
        var message = [Message]()
        database.collection("Message").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dataDescription = document.data()
                    print("Document data: \(dataDescription)")
                    do {
                        let json = try JSONSerialization.data(withJSONObject: dataDescription)
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedCountries = try decoder.decode(Message.self, from: json)
                        print(decodedCountries)
                        message.append(decodedCountries)
                    } catch {
                        print(error)
                    }
                }
                
                print(message.count)
                print("Oke ad: \(message[0].senderId + message[0].content)")
            }
        }
    }
    
}

///Validate Account
extension DatabaseManager {
    
    public func userExist(with email: String, completion:@escaping (Bool)-> Void) {
        let docRef = database.collection(CollectionPath.user).document(email)
        docRef.getDocument { (document, error) in
            guard let document = document, error == nil else  {
                print("User not exist")
                completion(false)
                return
            }
            if document.exists {
                print("User existing")
                completion(true)
            }else {
                print("User not exist")
                completion(false)
            }
        }
    }
    
    public func createNewUser(with email:String, info: User) {
        let docRef = database.collection(CollectionPath.user)
        
        let data : [String : Any] = ["adfsId":info.adfsId,
                        "firstname":info.firstname,
                        "lastname" :info.lastname,
                        "group" :info.group,
                        "role" :info.role]
        docRef.document(email).setData(data)
    }
}

extension DatabaseManager {
    
    public func addConversation(with conversations:[Conversation]) {
        let conversationRef = database.collection(CollectionPath.conversation)
        for conversation in conversations {
            let data : [String : Any] = ["id":conversation.id,
                        "messageIdList":conversation.messageIdList,
                        "userIdList" :conversation.userIdList]
            conversationRef.document("conv\(conversation.id)").setData(data)
        }
    }
}

extension DatabaseManager {
    
    public func getAllConversation(completion:@escaping ([Conversation]) -> Void){
        var convs = [Conversation]()
        database.collection(CollectionPath.conversation).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dataDescription = document.data()
                    print("Document data: \(dataDescription)")
                    do {
                        let json = try JSONSerialization.data(withJSONObject: dataDescription)
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let decodedCountries = try decoder.decode(Conversation.self, from: json)
                        print(decodedCountries)
                        convs.append(decodedCountries)
                    } catch {
                        print(error)
                    }
                }
                completion(convs)
            }
        }
    }
    
//    public func startListenChangeConversations(with emailId: String, completion: @escaping ([Conversation]) -> Void) {
//        var convs = [Conversation]()
//        database.collection(CollectionPath.conversation).addSnapshotListener{ documentSnapshot, error in
//            guard let querySnapshot = documentSnapshot?.documents, error != nil else {
//                print(error as Any)
//                completion(convs)
//                return
//            }
//            /// if conversations have change
//
//        }
//    }
}

