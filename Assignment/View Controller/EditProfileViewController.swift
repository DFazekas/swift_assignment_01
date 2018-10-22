//
//  EditProfileViewController.swift
//  Assignment
//
//  Created by Devon on 2018-10-21.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var imgAvatar : UIImageView!   // ImageView - Avatar
    @IBOutlet var txtName : UITextField!     // TextField - Name
    @IBOutlet var txtAddress : UITextField!  // TextField - Address
    @IBOutlet var txtPhone : UITextField!    // TextField - Phone #
    @IBOutlet var txtEmail : UITextField!    // TextField - Email
    @IBOutlet var swGender : UISwitch!      // Switch - Gender
    @IBOutlet var dtDOB : UIDatePicker!     // DatePicker - DOB
    @IBOutlet var slAge : UISlider!         // Slider - Age
    @IBOutlet var lblAge : UILabel!         // Label - Age
    @IBOutlet var btnSubmit : UIButton!     // Button - Submit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateImage()
    }

    func updateImage() {
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let imgIndex = mainDelegate.imgSelect
        imgAvatar.image = mainDelegate.imgData[imgIndex]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch : UITouch = touches.first!
        let touchPoint : CGPoint = touch.location(in: self.view!)
        
        let imgFrame : CGRect = imgAvatar.frame
        
        if imgFrame.contains(touchPoint) {
            performSegue(withIdentifier: "EditProfileSegueToAvatar", sender: self)
        }
        
    }
    
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
            addDataToDatabase()
            
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
    
    func addDataToDatabase() {
        let data : Data = Data.init()
        let mainDelegate = UIApplication.shared.delegate as! AppDelegate
        let imgIndex : Int = mainDelegate.imgSelect
        let gender : String = (swGender.isOn ? "Female" : "Male")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let date : String = dateFormatter.string(from : dtDOB.date)
        
        data.initWithData(theRow: 0,
                          theImg : imgIndex,
                          theName: txtName.text!,
                          theAddress: txtAddress.text!,
                          thePhone: txtPhone.text!,
                          theEmail: txtEmail.text!,
                          theGender: gender,
                          theDOB: date)
        
        
        let returnCode = mainDelegate.insertIntoDatabase(data: data)
        
        var returnCodeMsg : String = "Data added"
        
        if returnCode == false {
            returnCodeMsg = "Data add failed"
        }
        
        print(returnCodeMsg)
    }
    
    @IBAction func unwindToEditViewController(sender : UIStoryboardSegue) {
        // Leave empty.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
