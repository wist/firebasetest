//
//  InViewController.swift
//  Firebasetest
//
//  Created by Wist on 10/27/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit
import Firebase

class InViewController: UIViewController{
    
    var items = [NSDictionary]()
    @IBOutlet weak var botLBL: UILabel!
    @IBOutlet weak var txField: UITextView!
    
        var ref: FIRDatabaseReference!
        var messages: [FIRDataSnapshot]! = []
        var msglength: NSNumber = 10
        private var _refHandle: FIRDatabaseHandle!

    
    @IBAction func UserDidTouchLogout(sender: AnyObject) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            dismissViewControllerAnimated(true, completion: nil)
            print("sign out ok")
            botLBL.text = "User Loged Out"
            state.sharedInstance.signedIn = false
            //            print(user)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError)")
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadFirebaseData()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        botLBL.text = "User:" + state.sharedInstance.displayName!

        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadFirebaseData() {
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        self.ref = FIRDatabase.database().reference()
        print(self.ref.child("TestNodes"))
        ref.observeEventType(.Value, withBlock: { (snapshot) -> Void in
        var temporaryItemsArray = [NSDictionary]()
            
        for item in snapshot.children {
                print("See something")
                print(item)
                let child = item as! FIRDataSnapshot
                let dictionary = child.value as! NSDictionary
                
                temporaryItemsArray.append(dictionary)
                
            }
            
            self.items = temporaryItemsArray
            print(temporaryItemsArray)
//            self.tableView.reloadData()
            
            UIApplication.sharedApplication().networkActivityIndicatorVisible = false
            
        })
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
