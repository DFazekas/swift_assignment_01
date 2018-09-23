//
//  ProfileViewController.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/22/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtName : UITextField!     // TextField - Name
    @IBOutlet var txtAddress : UITextField!  // TextField - Address
    @IBOutlet var txtPhone : UITextField!    // TextField - Phone #
    @IBOutlet var txtEmail : UITextField!    // TextField - Email
    @IBOutlet var swGender : UISwitch!      // Switch - Gender
    @IBOutlet var dtDOB : UIDatePicker!     // DatePicker - DOB
    @IBOutlet var slAge : UISlider!         // Slider - Age
    @IBOutlet var lblAge : UILabel!         // Label - Age
    @IBOutlet var btnSubmit : UIButton!     // Button - Submit
    
    
    //////////////////// Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Unhide keyboard.
        return textField.resignFirstResponder();
    }
    
    //////////////////// Slider
    @IBAction func sliderValueChange(sender : UISlider) {
        // Handles slider value change.
        updateLabel();
    }
    
    func updateLabel() {
        let age = NSInteger(slAge.value)
        lblAge.text = "Age(\(age)):";
    }
    
    //////////////////// Submit
    @IBAction func submitProfile(sender : UIButton) {
        // Get name and email.
        let name = txtName.text ?? "";
        let email = txtEmail.text ?? "";
        
        // Ensure name and email are filled.
        if (!name.isEmpty && !email.isEmpty) {
            // Alert confirmation with user.
            let alert = UIAlertController(title: "Changes saved", message: "Thank you, \(name). Your email, \(email), was successfully saved.", preferredStyle: .alert);
            
            let yesAction = UIAlertAction(title: "Continue", style: .default, handler: {(alert: UIAlertAction!) in
                self.dismiss(animated: true, completion: nil);
            });
            
            // Join alert buttons to alert box.
            alert.addAction(yesAction);
            
            // Picard - "make it so".
            present(alert, animated: true);
        }
        else {
            // Inform user of empty required fields.
            let alert = UIAlertController(title: "Error", message: "Some of the required fields are empty!", preferredStyle: .alert);
            
            let yesAction = UIAlertAction(title: "Sorry, I'll fix it", style: .default, handler: nil);
            
            alert.addAction(yesAction);
            present(alert, animated: true);
        }
        
    }
    
    func doTheUpdate() {
        // Save the profile data.
        //let data : Data = .init();
        //data.initWithStuff(theName: txtName.text!, theEmail: txtEmail.text!);
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
