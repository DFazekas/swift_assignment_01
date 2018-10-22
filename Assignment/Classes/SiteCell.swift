//
//  SiteCell.swift
//  Assignment
//
//  Created by Devon on 2018-10-21.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class SiteCell: UITableViewCell {
    
    let img = UIImageView()
    let nameLabel = UILabel()
    let addressLabel = UILabel()
    let phoneLabel = UILabel()
    let emailLabel = UILabel()
    let genderLabel = UILabel()
    let dobLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameLabel.backgroundColor = .clear
        nameLabel.textColor = .black
        
        addressLabel.textAlignment = .left
        addressLabel.font = UIFont.boldSystemFont(ofSize: 12)
        addressLabel.backgroundColor = .clear
        addressLabel.textColor = .darkGray
        
        phoneLabel.textAlignment = .left
        phoneLabel.font = UIFont.boldSystemFont(ofSize: 12)
        phoneLabel.backgroundColor = .clear
        phoneLabel.textColor = .darkGray
        
        emailLabel.textAlignment = .left
        emailLabel.font = UIFont.boldSystemFont(ofSize: 12)
        emailLabel.backgroundColor = .clear
        emailLabel.textColor = .darkGray
        
        genderLabel.textAlignment = .left
        genderLabel.font = UIFont.boldSystemFont(ofSize: 12)
        genderLabel.backgroundColor = .clear
        genderLabel.textColor = .darkGray
        
        dobLabel.textAlignment = .left
        dobLabel.font = UIFont.boldSystemFont(ofSize: 12)
        dobLabel.backgroundColor = .clear
        dobLabel.textColor = .darkGray
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(img)
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(dobLabel)
    }
    
    override func layoutSubviews() {
        img.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        nameLabel.frame = CGRect(x: 45, y: 0, width: 460, height: 30)
        addressLabel.frame = CGRect(x: 45, y: 15, width: 460, height: 30)
        phoneLabel.frame = CGRect(x: 45, y: 30, width: 460, height: 30)
        emailLabel.frame = CGRect(x: 190, y: 0, width: 460, height: 30)
        genderLabel.frame = CGRect(x: 190, y: 15, width: 460, height: 30)
        dobLabel.frame = CGRect(x: 190, y: 30, width: 460, height: 30)
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
