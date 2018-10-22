//
//  AvatarViewController.swift
//  Assignment
//
//  Created by Devon on 2018-10-20.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class AvatarViewController: UIViewController {

    @IBOutlet var img1 : UIImageView!   // ImageView - Pic1
    @IBOutlet var img2 : UIImageView!   // ImageView - Pic2
    @IBOutlet var img3 : UIImageView!   // ImageView - Pic3
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let img1Frame : CGRect = img1.frame
        let img2Frame : CGRect = img2.frame
        let img3Frame : CGRect = img3.frame
        
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        var imgTag : Int = -1
        
        if img1Frame.contains(touchPoint) {
            imgTag = 0
        }
        else if img2Frame.contains(touchPoint) {
            imgTag = 1
        }
        else if img3Frame.contains(touchPoint) {
            imgTag = 2
        }
        
        if (imgTag != -1) {
            // Update selected avatar.
            print("Image \(imgTag) touched")
            mainDelegate.imgSelect = imgTag
            self.dismiss(animated: true, completion: nil);
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
