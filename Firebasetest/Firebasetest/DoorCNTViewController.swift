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
//    @IBOutlet weak var DoorImage: UIImageView!
    @IBOutlet weak var DoorDetails: UILabel!
    @IBOutlet weak var openSesam: UIButton!
    @IBOutlet weak var gateView: UIImageView!
    @IBOutlet weak var BTState: UIImageView!
    
    var doorIndex: Int!
    var doorName: String!
    var doorDTL: String!
    var isChecked: Bool!
    var gateImg: String!
    var BTStateLevel: Int!
    let checkedImage = UIImage(named: "SZMOpen")
    let unCheckedImage = UIImage(named: "SZMClose")
    
    
    
 //   var doorIMG: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if gateImg == nil {
        gateView.image = UIImage(named: String("gate_default"))
        }
        if BTStateLevel == nil {
            BTState.image = UIImage(named: String("BT000"))
        }
        
        self.DoorTitle.text = self.doorName! as String
        self.DoorDetails.text = self.doorDTL! as String
        
        isChecked = false
        
        self.updateImage()
        
//        self.DoorImage.image = UIImage(named: self.doorIMG)! as UIImage

    }
    override func viewDidAppear(_ animated: Bool) {
        print("Door " + String(doorIndex))
//        self.openSesam.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GateSettingsDidTouch(_ sender: Any) {
    }

    @IBAction func SezamDidTouch(_ sender: Any) {
      
        self.updateImage()
        
    }
    
    func updateImage() {
        if isChecked == true{
            openSesam.setImage(unCheckedImage, for: .normal)
            isChecked = false
        }else{
            openSesam.setImage(checkedImage, for: .normal)
            isChecked = true
        }
        
    }
    
    func buttonClicked(sender:UIButton) {
        if(sender == self){
            isChecked = !isChecked
        }
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
