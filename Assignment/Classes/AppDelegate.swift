//
//  AppDelegate.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/22/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit
import SQLite3

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var databaseName : String? = "Assignment2Database.db"
    var databasePath : String?
    var data : [Data] = []
    var imgData = [#imageLiteral(resourceName: "pic1"), #imageLiteral(resourceName: "pic2"), #imageLiteral(resourceName: "pic3")]
    var imgSelect : Int = 0

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Find database file path on device.
        let documentPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentDir = documentPaths[0]
        databasePath = documentDir.appending("/" + databaseName!)
        
        // Check if database exists, create otherwise.
        checkAndCreateDatabase()
        
        return true
    }
    
    func checkAndCreateDatabase() {
        var success = false
        let fileManager = FileManager.default
        
        success = fileManager.fileExists(atPath: databasePath!)
        
        if success {
            return
        }
        
        let databasePathFromApp = Bundle.main.resourcePath?.appending("/" + databaseName!)
        
        try? fileManager.copyItem(atPath: databasePathFromApp!, toPath: databasePath!)
        
        return
        
    }
    
    func readDataFromDatabase() {
        data.removeAll()
        
        var db : OpaquePointer? = nil
        
        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            print("Successfully opened connection to database at \(self.databasePath ?? "Huh?")")
            
            var queryStatement : OpaquePointer? = nil
            let queryStatementString : String = "select * from entries"
            
            if sqlite3_prepare(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let id : Int = Int(sqlite3_column_int(queryStatement, 0))
                    let img : Int = Int(sqlite3_column_int(queryStatement, 1))
                    let cName = sqlite3_column_text(queryStatement, 2)
                    let cAddress = sqlite3_column_text(queryStatement, 3)
                    let cPhone = sqlite3_column_text(queryStatement, 4)
                    let cEmail = sqlite3_column_text(queryStatement, 5)
                    let cGender = sqlite3_column_text(queryStatement, 6)
                    let cDOB = sqlite3_column_text(queryStatement, 7)
                    
                    // Convert C-type Strings to Strings.
                    let name = String(cString : cName!)
                    let address = String(cString: cAddress!)
                    let phone = String(cString: cPhone!)
                    let email = String(cString : cEmail!)
                    let gender = String(cString : cGender!)
                    let dob = String(cString : cDOB!)
                    
                    let tempData : Data = Data.init()
                    tempData.initWithData(theRow: id, theImg : img, theName: name, theAddress: address, thePhone: phone, theEmail: email, theGender: gender, theDOB: dob)
                    data.append(tempData)
                    
                    print("Query results")
                    print("\(id) | \(name) | Image: \(img)")
                }
                sqlite3_finalize(queryStatement)
            }
            else {
                print("Select statement could not be prepared")
            }
            
            // Close database.
            sqlite3_close(db)
        }
        else {
            print("Unable to open database")
        }
    }

    func insertIntoDatabase(data : Data) -> Bool {
        var db : OpaquePointer? = nil
        var returnCode : Bool = true

        if sqlite3_open(self.databasePath, &db) == SQLITE_OK {
            var insertStatement : OpaquePointer? = nil
            let insertStatementString : String = "insert into entries values(NULL, ?, ?, ?, ?, ?, ?, ?)"
        
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                let img = data.img! as NSInteger
                let nameStr = data.name! as NSString
                let addressStr = data.address! as NSString
                let phoneStr = data.phone! as NSString
                let emailStr = data.email! as NSString
                let genderStr = data.gender! as NSString
                let dobStr = data.dob! as NSString
            
                sqlite3_bind_int(insertStatement, 1, Int32(img))
                sqlite3_bind_text(insertStatement, 2, nameStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 3, addressStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 4, phoneStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 5, emailStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 6, genderStr.utf8String, -1, nil)
                sqlite3_bind_text(insertStatement, 7, dobStr.utf8String, -1, nil)
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    let rowID = sqlite3_last_insert_rowid(db)
                    print("Successfully inserted row \(rowID)")
                }
                else {
                    print("Could not insert row")
                    returnCode = false
                }
                sqlite3_finalize(insertStatement)
            }
            else {
                print("Insert statement could not be prepared")
                returnCode = false
            }
            sqlite3_close(db)
        }
        else {
            print("Unable to open database")
            returnCode = false
        }
        
        return returnCode
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

