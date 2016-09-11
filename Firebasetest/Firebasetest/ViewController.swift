//
//  ViewController.swift
//  Firebasetest
//
//  Created by Wist on 9/6/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

 
    override func viewDidAppear(animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var emailFLD: UITextField!
    @IBOutlet weak var pwdFLD: UITextField!
    @IBOutlet weak var topLBL: UILabel!
    @IBOutlet weak var botLBL: UILabel!
    @IBOutlet weak var loginBTN: UIButton!
    @IBOutlet weak var logoutBTN: UIButton!
    @IBOutlet weak var regBTN: UIButton!
    
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
             print("sign in ok")
             print(user)
             self.topLBL.text = "You have Signed In"
  //          self.signedIn(user!)
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
            self.topLBL.text = "You have Signed UP"
 //         self.setDisplayName(user!)
        }
    }
    
    
    
    @IBAction func signOut(sender: UIButton) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            dismissViewControllerAnimated(true, completion: nil)
            print("sign out ok")
            print(user)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError)")
        }
    }
    
}
