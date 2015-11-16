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
    @IBOutlet weak var headercellnamechild: UILabel!
    
    @IBOutlet weak var setheadercellnamechildimaghe: UIImageView!

    @IBOutlet weak var headercellmin: UILabel!

    @IBOutlet weak var headercellmax: UILabel!

    @IBOutlet weak var mapbutton: UIButton!
    
    @IBOutlet weak var availofferbuttonbeer: UIButton!
    
    @IBOutlet weak var arrowimage: UIImageView!
    @IBOutlet weak var happyhourslabelbeer: UILabel!
    
    
    

    //var tableobject = tableviewclass()
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
//        if tableobject.pintbuttonclicked == true
//        {
//
//            headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//
//        }
        
//        let happyhoursimage = UIImage(named: "Restauranttab")
//        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: headercellname.frame.width, height: headercellname.frame.height))
//        myImageView.image = happyhoursimage
//        headercellname.addSubview(myImageView)
        


    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
