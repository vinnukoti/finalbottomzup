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
    
    var tableobject = tableviewclass()
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
        if tableobject.pintbuttonclicked == true
        {

            headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
            //#fde8d7
//                //set the background color to #ffd200
//                view.backgroundColor = UIColor(
//                    red: 0xfd/255,
//                    green: 0xe8/255,
//                    blue: 0xd7/255,
//                    alpha: 1.0)
        }
        
//        if  tableobject.bottlebuttonclicked == true
//        {
//
//            headercellmax.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//        }
        
//        if tableobject.locationbuttonclicked == true
//        {
//
//            headercelldist.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//        }

    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
