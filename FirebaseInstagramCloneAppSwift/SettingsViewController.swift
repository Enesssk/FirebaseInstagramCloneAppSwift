//
//  SettingsViewController.swift
//  FirebaseInstagramCloneAppSwift
//
//  Created by Enes Kala on 4.03.2024.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutButtonClicked(_ sender: Any) {
        
        do{
           try  Auth.auth().signOut()
            performSegue(withIdentifier: "toViewController", sender: nil)
        }catch{
            print("Error")
        }
       
        
       
        
        
    }
   
}
