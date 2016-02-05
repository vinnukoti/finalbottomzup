//
//  customheadercellcocktail.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 05/02/16.
//  Copyright (c) 2016 Appsriv Technologies. All rights reserved.
//


import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Social
import Foundation
import SystemConfiguration


class customheadercellcocktail: UITableViewCell
{
    @IBOutlet weak var headercellname: UILabel!

    @IBOutlet weak var headercellmin: UILabel!
    
    @IBOutlet weak var headercellmax: UILabel!
    
    @IBOutlet weak var mapbutton: UIButton!
    
    @IBOutlet weak var shadowimage: UIImageView!
    
    @IBOutlet weak var arrowimage: UIButton!
    
    @IBOutlet weak var Happyhourslabel: UILabel!
    
    @IBOutlet weak var tapguesturerecognizer: UIImageView!
    
    @IBOutlet weak var citynamedisplay: UILabel!
    
    @IBOutlet weak var headercellimage: UIImageView!
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
