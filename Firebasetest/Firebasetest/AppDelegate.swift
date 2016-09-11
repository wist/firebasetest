//
//  AppDelegate.swift
//  Firebasetest
//
//  Created by Wist on 9/6/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        FIRApp.configure()
        return true
    }

  
}

