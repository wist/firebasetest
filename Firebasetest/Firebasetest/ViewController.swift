//
//  ViewController.swift
//  Firebasetest
//
//  Created by Wist on 9/6/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureDatabase()
    }

 
    override func viewDidAppear(animated: Bool) {
        
        if case state.sharedInstance.signedIn = false{
        self.topLBL.text = "You Signed Out"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var emailFLD: UITextField!
    @IBOutlet weak var pwdFLD: UITextField!
    @IBOutlet weak var topLBL: UILabel!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var regBTN: UIButton!
    
    
    
//    var ref: FIRDatabaseReference!
//    var messages: [FIRDataSnapshot]! = []
//    var msglength: NSNumber = 10
//    private var _refHandle: FIRDatabaseHandle!
    
    @IBAction func didTapSignIn(sender: AnyObject) {
        // Sign In with credentials.
        let email = emailFLD.text
        let password = pwdFLD.text
        print("sign in start")
        FIRAuth.auth()?.signInWithEmail(email!, password: password!) { (user, error) in
            if let error = error {
                print(error)
                print(error.localizedDescription)
                return
            }
 //            self.ref = FIRDatabase.database().reference()
             print("sign in ok")
             print(user)
//             print(self.ref)
             self.topLBL.text = "You have Signed In"
             state.sharedInstance.displayName = String(user)
             state.sharedInstance.signedIn = true
             self.performSegueWithIdentifier("jumpTo", sender: self)
 //       self.signedIn(user!)
        }
    }
    
    @IBAction func didTapSignUp(sender: AnyObject) {
        let email = emailFLD.text
        let password = pwdFLD.text
        FIRAuth.auth()?.createUserWithEmail(email!, password: password!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            print("sign UP ok")
            print(user)
            state.sharedInstance.signedIn = true
            state.sharedInstance.displayName = String(user)
            self.topLBL.text = "You have Signed UP"
 //         self.setDisplayName(user!)
        }
    }
    
    func configureDatabase() {
    }
    

    

    
}
