//
//  customheadercell.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Social
import Foundation
import SystemConfiguration

class customheadercell: UITableViewCell
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
    
    @IBOutlet weak var availofferimagetodisplay: UIImageView!

    override func awakeFromNib()
    {
        super.awakeFromNib()
  
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
