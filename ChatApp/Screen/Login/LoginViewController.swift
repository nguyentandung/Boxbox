//
//  LoginViewController.swift
//  ChatApp
//
//  Created by Nguyen Tan Dung on 27/04/2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var userName_tf: UITextField!
    @IBOutlet weak var passWord_tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func registerAccount(with username:String,with password:String) {
        FirebaseAuth.Auth.auth().createUser(withEmail: username, password: password, completion: { AuthResult, error in
            guard let result = AuthResult, error == nil else {
                print(error)
                return
            }
            let user = result.user
            print("Created user:\(user)")
            let userInfo = User(adfsId: "4163vdv", firstname: "Nguyen", lastname: "Dung", group: "BSV21", role: "Admin")
            DatabaseManager.sharedInstance.createNewUser(with: username, info: userInfo)
            self.loginAccount(with: username, with: password)
        })
    }
    
    func validateData() {
        let username = self.userName_tf.text!
        let password = self.passWord_tf.text!
        if username != "" && password != "" {
            DatabaseManager.sharedInstance.userExist(with: username, completion: { [weak self] isExist in
                if !isExist {
                    print("User not existing. Wait to register")
                    self?.registerAccount(with: username, with: password)
                }else {
                    print("User existing. Wait to sign-in")
                    self?.loginAccount(with: username, with: password)
                }
            })
        }else {
            print("Validate fail. Check again!!")
        }
    }
    
    func showChatScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "MainViewController")
        let navController = UINavigationController(rootViewController: viewcontroller)
        AppDelegate.sharedInstance.changeRootViewController(viewcontroller: navController)
    }
    
    func loginAccount(with username:String, with password:String) {
        FirebaseAuth.Auth.auth().signIn(withEmail: username, password: password, completion: { [weak self] AuthResult, error in
            guard let result = AuthResult, error == nil else {
                print(error as Any)
                return
            }
            //MARK: Show homeScreen when login Success
            self?.showChatScreen()
        })
    }
    
    @IBAction func actionLogin(_ sender: Any) {
//        validateData()
//        self.loginAccount(with: "dungnt1@gmail.com", with: "Dung4321")
    }
}
