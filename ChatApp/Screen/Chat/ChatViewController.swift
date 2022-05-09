//
//  ChatViewController.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 15/04/2022.
//

import UIKit

class ChatViewController: UIViewController {

    @IBOutlet weak var tblChat: UITableView!
    
    var messageBox : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        addMessage()
    }
    
    func register() {
        self.tblChat.delegate = self
        self.tblChat.dataSource = self
        self.tblChat.separatorStyle = .none
        self.tblChat.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
    }
    
    func scrolltoBottom() {
        self.tblChat.scrollToRow(at: IndexPath(row: messageBox.count - 1, section: 0), at: .bottom, animated: true)
    }
    
    func addMessage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: {
            self.messageBox.append("Hello")
            self.tblChat.reloadData()
            self.scrolltoBottom()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.messageBox.append("My Name is Dung")
                self.tblChat.reloadData()
                self.scrolltoBottom()
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    self.messageBox.append("The Free Forex API is only for use for displaying")
                    self.tblChat.reloadData()
                    self.scrolltoBottom()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                        self.messageBox.append("In order to prevent your site from being blacklisted, all you have to do is add the following linked image to your site next to where the rates are shown")
                        self.tblChat.reloadData()
                        self.scrolltoBottom()
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                            self.messageBox.append("Calling the end point will provide a list of the currency pairs that are supported.")
                            self.tblChat.reloadData()
                            self.scrolltoBottom()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                self.messageBox.append("Calling the end ")
                                self.tblChat.reloadData()
                                self.scrolltoBottom()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                    self.messageBox.append("Each pair uses the base currency as determined by the establised priority rankings.")
                                    self.tblChat.reloadData()
                                    self.scrolltoBottom()
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                        self.messageBox.append("To get the rates data, simply add the parameter 'pairs' with one or more currency pairs as a comma separated list.")
                                        self.tblChat.reloadData()
                                        self.scrolltoBottom()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                            self.messageBox.append("The Free Forex API is a simple REST API providing real-time foreign exchange rates for the major currency pairs. No more, no less.")
                                            self.tblChat.reloadData()
                                            self.scrolltoBottom()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                self.messageBox.append("It's a small thing, but every time I open my current Xcode project the default iOS device to run my app on is my phone. Is there a way to change it to one of the simulators?")
                                                self.tblChat.reloadData()
                                                self.scrolltoBottom()
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                    self.messageBox.append("It's a small thing, but every time I open my current Xcode project the default iOS device to run my app on is my phone. Is there a way to change it to one of the simulators?")
                                                    self.tblChat.reloadData()
                                                    self.scrolltoBottom()
                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                        self.messageBox.append("It's a small thing, but every time I open my current Xcode project the default iOS device to run my app on is my phone. Is there a way to change it to one of the simulators?")
                                                        self.tblChat.reloadData()
                                                        self.scrolltoBottom()
                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                            self.messageBox.append("It's a small thing, but every time I open my current Xcode project the default iOS device to run my app on is my phone. Is there a way to change it to one of the simulators?")
                                                            self.tblChat.reloadData()
                                                            self.scrolltoBottom()
                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                self.messageBox.append("If you want the tableview to scroll when")
                                                                self.tblChat.reloadData()
                                                                self.scrolltoBottom()
                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                    self.messageBox.append("remember viewwillappear calls everytime")
                                                                    self.tblChat.reloadData()
                                                                    self.scrolltoBottom()
                                                                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                        self.messageBox.append("This worked for me in Swift 4")
                                                                        self.tblChat.reloadData()
                                                                        self.scrolltoBottom()
                                                                        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                            self.messageBox.append("function of my UITableViewController class.")
                                                                            self.tblChat.reloadData()
                                                                            self.scrolltoBottom()
                                                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                                self.messageBox.append("they scroll down on reloadData rather than the screen appearing.")
                                                                                self.tblChat.reloadData()
                                                                                self.scrolltoBottom()
                                                                                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                                                                    self.messageBox.append("Ended")
                                                                                    self.tblChat.reloadData()
                                                                                    self.scrolltoBottom()
                                                                                })
                                                                            })
                                                                        })
                                                                    })
                                                                })
                                                            })
                                                        })
                                                    })
                                                })
                                            })
                                        })
                                    })
                                })
                            })
                        })
                    })
                })
            })
        })
    }

}

extension ChatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row =
    }
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let message = self.messageBox?[indexPath.row]
        let message = self.messageBox[indexPath.row]
        let cell = tblChat.dequeueReusableCell(withIdentifier: "ChatTableViewCell", for: indexPath) as! ChatTableViewCell
        cell.contentMessage.text = message
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if messageBox.count == 0 {
            return 0
        }else {
            return messageBox.count
        }
    }
}
