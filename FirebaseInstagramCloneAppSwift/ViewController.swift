//
//  ViewController.swift
//  FirebaseInstagramCloneAppSwift
//
//  Created by Enes Kala on 4.03.2024.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInButtonClicked(_ sender: Any) {
        
        if emailText.text == "" && passwordText.text == "" {
            self.makeAlert(titleInput: "Error", messageInput: "Please enter a password or email")
        } else {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { response, error in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        }
        
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
    }
    
    
    @IBAction func signUpClickedButton(_ sender: Any) {
        
        if emailText.text == "" && passwordText.text == "" {
            self.makeAlert(titleInput: "Error", messageInput: "Please enter a email or password")
        }else{
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { response, error in
            
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
                
            }
        }
        
    }
    
    func makeAlert (titleInput : String, messageInput : String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
}

