//
//  DoorCNTViewController.swift
//  Firebasetest
//
//  Created by Wist on 10/28/16.
//  Copyright © 2016 Wist. All rights reserved.
//

import UIKit

class DoorCNTViewController: UIViewController {

    @IBOutlet weak var DoorTitle: UILabel!
    @IBOutlet weak var DoorImage: UIImageView!
    @IBOutlet weak var DoorDetails: UILabel!
    
    var doorIndex: Int!
    var doorName: String!
    var doorDTL: String!
    var doorIMG: String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.DoorTitle.text = self.doorName
        self.DoorDetails.text = self.doorDTL
        self.DoorImage.image = UIImage(named: self.doorIMG)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
