//
//  ViewController.swift
//  FirebaseInstagramCloneAppSwift
//
//  Created by Enes Kala on 4.03.2024.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signInButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
    }
    
    
    @IBAction func signUpClickedButton(_ sender: Any) {
    }
    
}

