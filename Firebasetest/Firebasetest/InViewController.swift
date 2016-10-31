//
//  InViewController.swift
//  Firebasetest
//
//  Created by Wist on 10/27/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit
import Firebase

class InViewController: UIViewController, UIPageViewControllerDataSource{
    
    var items = [NSDictionary]()
    var pageViewController: UIPageViewController!
    
    @IBOutlet weak var UserPic: UIImageView!
    @IBOutlet weak var botLBL: UILabel!
    var ref: FIRDatabaseReference!

    
    @IBAction func UserDidTouchLogout(_ sender: AnyObject) {
        let firebaseAuth = FIRAuth.auth()
        do {
            try firebaseAuth?.signOut()
            dismiss(animated: true, completion: nil)
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
       
        
        UserPic.image = UIImage(named: String("userpic_default"))
        

        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.ref = FIRDatabase.database().reference(withPath: "trusted_devices")
        //        print(self.ref)
        self.ref.observe(.value, with: { snapshot -> Void in
            
            var temporaryItemsArray = [NSDictionary]()
            
            for item in snapshot.children
            {
                let child = item as! FIRDataSnapshot
                let dictionary = child.value! as! NSDictionary
                temporaryItemsArray.append(dictionary)
            }
            
            self.items = temporaryItemsArray

            print("We have " + String(self.items.count)+" items")
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        print(self.items)
        
 
            self.pageViewController = self.storyboard?.instantiateViewController(withIdentifier: "DoorViewCNTR") as! UIPageViewController
        
            self.pageViewController.dataSource = self
        
        
            let startVC = self.viewControllerAtIndex(0) as DoorCNTViewController
            
            let viewControllers = NSArray(object: startVC)
        
            self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)

            self.pageViewController.view.frame = CGRect(x: 12, y: 120, width: 350, height: 450)
            self.pageViewController.view.backgroundColor = UIColor.clear
        
            self.addChildViewController(self.pageViewController)
        
            self.view.addSubview(self.pageViewController.view)
        
            self.pageViewController.didMove(toParentViewController: self)
        
        })
    
    }

    override func viewDidAppear(_ animated: Bool) {
        botLBL.text = "User:" + state.sharedInstance.displayName!

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(_ index: Int) -> DoorCNTViewController {
        if (self.items.count == 0 || (index >= self.items.count))
        {
        return DoorCNTViewController()
        }
        
        let vc : DoorCNTViewController = self.storyboard?.instantiateViewController(withIdentifier: "DoorCNTViewController")
        as! DoorCNTViewController
        
        vc.doorName = self.items[index]["name"] as! String
        vc.doorDTL = self.items[index]["mac"] as! String
 //       vc.doorIMG = self.items[index]["imageUrl"] as! String
 //       vc.doorIMG = self.items[index]["positionUUID"] as! String
        vc.doorIndex = index 
        
        return vc
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! DoorCNTViewController
        var indexT = vc.doorIndex as Int
    
            if (indexT == 0 || indexT == NSNotFound)
                {
                    return nil
                }
                indexT -= 1
                return self.viewControllerAtIndex(indexT)
        }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let vc = viewController as! DoorCNTViewController
            var indexT = vc.doorIndex as Int
        
            if (indexT == NSNotFound)
                {
                    return nil
                }
                indexT += 1
        
            if (indexT == self.items.count)
                {
                    return nil
                }
            return self.viewControllerAtIndex(indexT)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return self.items.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    @IBAction func backBTN(_ sender: AnyObject) {
        
        let startVC = self.viewControllerAtIndex(0) as DoorCNTViewController
        let viewControllers = NSArray(object: startVC)
    
        
        self.pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .forward, animated: true, completion: nil)
        
    }

    
    func loadFirebaseData() {
//        print("Hallo at data load")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.ref = FIRDatabase.database().reference(withPath: "trusted_devices")
//        print(self.ref)
        self.ref.observe(.value, with: { snapshot -> Void in

        
        var temporaryItemsArray = [NSDictionary]()
            
        for item in snapshot.children
                {
 //                   print("See something")
 //                   print(item)
                    let child = item as! FIRDataSnapshot
                    let dictionary = child.value! as! NSDictionary
                    temporaryItemsArray.append(dictionary)
                }
            
        self.items = temporaryItemsArray
//      print(self.items)
        print("We have " + String(self.items.count)+" items")
        
       
            
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
        })
      
    }
    

}
