//
//  RootViewController.swift
//  Sample App
//
//  Created by Hritikesh Yadav on 26/01/23.
//

import UIKit

class RootViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.renderUI()
        // Do any additional setup after loading the view.
    }

    func renderUI(){
        self.usernameField.placeholder = "Username"
        self.passwordField.placeholder = "Password"
        
        self.loginBtn.layer.backgroundColor = UIColor.red.cgColor
        self.loginBtn.layer.cornerRadius = 7.0
    }
    
    func validatePassword(userName : String, password : String){
//        if userName == nil && password == nil{
            self.headerTitle.text = "Logged in"
        let navigationController = UINavigationController(rootViewController: RootViewController(nibName: "RootViewController", bundle: nil))

            let listVC = ListViewController(nibName: "ListViewController", bundle: nil)
            self.navigationController?.pushViewController(listVC, animated: false)
//            self.present(listVC, animated: true)
        /*/}else{
            self.alert()
        }*/
    }
    
    @IBAction func loginBtnAction(_ sender: Any) {
        self.validatePassword(userName: self.usernameField.text ?? "", password: self.passwordField.text ?? "")
    }
}

//Alert
extension RootViewController {
    func alert(){
        // create the alert
             let alert = UIAlertController(title: "Alert", message: "Wrong Username or Password.", preferredStyle: UIAlertController.Style.alert)

             // add an action (button)
             alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

             // show the alert
             self.present(alert, animated: true, completion: nil)
    }
}
