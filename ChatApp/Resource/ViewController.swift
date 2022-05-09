//
//  ViewController.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 15/04/2022.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var conversationTbl: UITableView!
    
    var convs : [Conversation] = [Conversation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.conversationTbl.delegate = self
        self.conversationTbl.dataSource = self
        
        getAllConversation()
    }
    
    func getAllConversation() {
//        self.conversationTbl.reloadData()
        DatabaseManager.sharedInstance.getAllConversation(completion: { convs in
            print("result is:\(convs.count)")
            self.convs = convs
            self.conversationTbl.reloadData()
        })
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return convs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = conversationTbl.dequeueReusableCell(withIdentifier: "ConversationTableViewCell", for: indexPath) as! ConversationTableViewCell
        cell.idConv.text = convs[indexPath.row].id
//        cell.nameConv.text = convs[indexPath.row].userIdList[0]
        return cell
    }
    
}

class ConversationTableViewCell : UITableViewCell {
    @IBOutlet weak var idConv : UILabel!
    @IBOutlet weak var nameConv : UILabel!
}
