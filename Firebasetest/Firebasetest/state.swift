//
//  state.swift
//  Firebasetest
//
//  Created by Wist on 10/27/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import Foundation

class state: NSObject {
    
    static let sharedInstance = state()
    
    var signedIn = false
    var displayName: String?
//    var photoURL: URL?
}
