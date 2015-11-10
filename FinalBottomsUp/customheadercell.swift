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
    
    @IBOutlet weak var availofferbuttonbeer: UIButton!
    
    
    @IBOutlet weak var newheadercellname: UILabel!
    @IBOutlet weak var newheadercellmin: UILabel!
    @IBOutlet weak var newheadercellmax: UILabel!
    @IBOutlet weak var newmapbutton: UIButton!
    @IBOutlet weak var newavailofferbuttonbeer: UIButton!
    
    @IBOutlet weak var happyhourslabelbeer: UILabel!
    
    
    

    var tableobject = tableviewclass()
    override func awakeFromNib()
    {
        super.awakeFromNib()
    
//        if tableobject.pintbuttonclicked == true
//        {
//
//            headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//
//        }
        
        let happyhorsimage = UIImage(named: "Happyhoursround image")
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: happyhourslabelbeer.frame.width, height: happyhourslabelbeer.frame.height))
        myImageView.image = happyhorsimage
        happyhourslabelbeer.addSubview(myImageView)
        


    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
