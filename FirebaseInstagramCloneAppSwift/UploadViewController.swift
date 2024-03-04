//
//  UploadViewController.swift
//  FirebaseInstagramCloneAppSwift
//
//  Created by Enes Kala on 4.03.2024.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var commentText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chosenImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
        
    }
    
    @objc func chosenImage () {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        
        present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func uploadButtonClicked(_ sender: Any) {
        
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        //image ı dataya çeviriyoruz ki kaydedelim.
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpeg")
            
            imageReference.putData(data, metadata: nil) { metaData, error in
                if error != nil {
                    self.makeAlert(titleInput: "error", messageInput: error!.localizedDescription)
                } else{
                    
                    imageReference.downloadURL { url, error in
                        
                        
                        if error != nil {
                            let imageUrl = url?.absoluteString
                            
                            
                            //save to Database
                            
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReference : DocumentReference? = nil
                            
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser?.email!, "comment" : self.commentText.text!, "date" : FieldValue.serverTimestamp(), "like" : 0] as [String : Any]
                            
                            firestoreReference = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                
                                if error != nil {
                                    self.makeAlert(titleInput: "error", messageInput: error?.localizedDescription ?? "ERROR")
                                } else {
                                    self.tabBarController?.selectedIndex = 0
                                }
                    
                            })
                            
                            
                        }
                        
                        
                        
                        
                    }
                    
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
