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
 
   // @IBOutlet weak var headercelldist: UILabel!
    @IBOutlet weak var headercelldist: UILabel!

    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        if pintbuttonclicked == true
        {

            headercellmin.backgroundColor = UIColor.yellowColor()
        }
        
        if  bottlebuttonclicked == true
        {

            headercellmax.backgroundColor = UIColor.yellowColor()
        }
        
        if locationbuttonclicked == true
        {

            headercelldist.backgroundColor = UIColor.yellowColor()
        }

    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
