//
//  Data.swift
//  Assignment
//
//  Created by Devon on 2018-10-21.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class Data: NSObject {
    var id : Int?
    var img : Int?
    var name : String?
    var address : String?
    var phone : String?
    var email : String?
    var gender : String?
    var dob : String?
    var age : Int?
    
    func initWithData(theRow theId : Int, theImg : Int, theName : String, theAddress : String, thePhone : String, theEmail : String, theGender : String, theDOB : String) {
        self.id = theId
        self.img = theImg
        name = theName
        address = theAddress
        phone = thePhone
        email = theEmail
        gender = theGender
        dob = theDOB
        age = -1
    }
}
