//
//  SettingsViewController.swift
//  FirebaseInstagramCloneAppSwift
//
//  Created by Enes Kala on 4.03.2024.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func signOutButtonClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toViewController", sender: nil)
        
        
    }
   
}
