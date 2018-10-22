//
//  ProfileViewController.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/22/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView : UITableView!
    var listData : [String] = []
    let mainDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "background_grey.jpg"))
        updateTable()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTable()
        self.tableView.reloadData()
        super.viewWillAppear(animated)
    }
    
    func updateTable() {
        mainDelegate.readDataFromDatabase()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // How many rows there are in the TableView.
        return mainDelegate.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of all rows in TableView.
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Cell appearance for TableView.
        
        // Check if row is leaving the screen.
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as? SiteCell ?? SiteCell(style: .default, reuseIdentifier: "cell")
        tableCell.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        let rowNum = indexPath.row
        let imgIndex = mainDelegate.data[rowNum].img!
        
        tableCell.img.image = mainDelegate.imgData[imgIndex]
        tableCell.nameLabel.text = mainDelegate.data[rowNum].name
        tableCell.addressLabel.text = mainDelegate.data[rowNum].address
        tableCell.phoneLabel.text = mainDelegate.data[rowNum].phone
        tableCell.emailLabel.text = mainDelegate.data[rowNum].email
        tableCell.genderLabel.text = mainDelegate.data[rowNum].gender
        tableCell.dobLabel.text = mainDelegate.data[rowNum].dob
        
        return tableCell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToProfileViewController(sender : UIStoryboardSegue) {
        // Leave empty.
    }

}
