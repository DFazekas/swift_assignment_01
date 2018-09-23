//
//  ViewController.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/22/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var btnAbout: UIButton!
    @IBOutlet var btnProfile: UIButton!
    @IBOutlet var btnPortfolio: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize buttons.
        self.btnAbout.layer.cornerRadius = 10;
        self.btnProfile.layer.cornerRadius = 10;
        self.btnPortfolio.layer.cornerRadius = 10;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func unwindToThisView(segue : UIStoryboardSegue) {
        // Leave empty.
    }

}

