//
//  RoundedButton.swift
//  Assignment
//
//  Created by Devon Fazekas on 9/23/18.
//  Copyright © 2018 Devon Fazekas. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib();
        
        // 1px border should adjust according to screen size.
        layer.borderWidth = 1 / UIScreen.main.nativeScale;
        
        // Set border color to white.
        layer.borderColor = UIColor.white.cgColor;
    }
    
}
