//
//  ComposeViewController.swift
//  messegingapp
//
//  Created by admin on 23/06/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func addPost(_ sender: Any) {
        //TODO: post cell data to firebase
        ref?.child("Post").childByAutoId().setValue(textView.text)
        //navigate to viewcontroller
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        //navigate to viewcontroller
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
