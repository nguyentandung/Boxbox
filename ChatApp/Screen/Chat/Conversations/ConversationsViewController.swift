//
//  ConversationsViewController.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 09/05/2022.
//

import UIKit

class ConversationsViewController: UIViewController {

    @IBOutlet weak var tblConversation: UITableView!
    
    let viewModel = ConversationViewModel()
    var conversations = [Conversation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupTableview()
        getAllConversations()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    @IBAction func actionCreateConversation(_ sender: Any) {
        viewModel.createConversation(idCreator: "dungnt1@gmail.com", idSecondUser: "dungnt2@gmail.com")
    }
    
    private func setupTableview() {
        self.tblConversation.delegate = self
        self.tblConversation.dataSource = self
        
        /// Register cell
        tblConversation.register(UINib(nibName: "ConversationsTableViewCell", bundle: nil), forCellReuseIdentifier: "ConversationsTableViewCell")
    }
    
    private func setUpUI() {
        /// title
        self.title = "Conversations"
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: Int((self.navigationController?.navigationBar.bounds.width)!), height: 50)
    }
    
    private func getAllConversations() {
        self.viewModel.queryConversations(completion: { [weak self] convs in
            self?.conversations = convs
            DispatchQueue.main.async {
                self?.tblConversation.reloadData()
            }
        })
    }

}

extension ConversationsViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let chatVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Chat")
        self.navigationController?.pushViewController(chatVC, animated: true)
    }
}

extension ConversationsViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conversations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let conv = conversations[indexPath.row]
        let cell = tblConversation.dequeueReusableCell(withIdentifier: "ConversationsTableViewCell", for: indexPath) as! ConversationsTableViewCell
        cell.lblGroupName.text = conv.otherEmail
        cell.lblLastContentMessage.text = !conv.lastMessage.isEmpty ? conv.lastMessage : String(format: "You and %@ have been a friend", conv.otherEmail)
        return cell
    }
}
