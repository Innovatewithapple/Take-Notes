//
//  ViewController.swift
//  messegingapp
//
//  Created by admin on 23/06/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //set the firebase referance
        ref = Database.database().reference()
        
       // Retrive the post and listen for changes
       databaseHandle = ref?.child("Post").observe(.childAdded, with: { (snapshot) in
            
            //code for execute when a child is added under "Post"
            //take the value from the snapshot and added into a postData array
        
        
        //Try to convert the value from data to string
        let post = snapshot.value as? String
        if let actualPost = post{
            
             // Append the data from postData array
            self.postData.append(actualPost)
            //Reload the TableView
            self.tableView.reloadData()
            
            
        }
        })
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }

}

