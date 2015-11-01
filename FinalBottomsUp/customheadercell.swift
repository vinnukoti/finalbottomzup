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
 
    @IBOutlet weak var headercelldist: UILabel!
 
    @IBOutlet weak var pintimage: UIImageView!
    
    @IBOutlet weak var bottleimage: UIImageView!
    
    @IBOutlet weak var locationimage: UIImageView!
    
    @IBOutlet weak var arrowmark: UIImageView!
    
    var obj = tableviewclass()
    

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        if pintbuttonclicked == true
        {
//            pintimage.image = UIImage(named: "enabled")
//            bottleimage.image = UIImage(named: "enabled")
//            locationimage.image = UIImage(named: "enabled")
            
            headercellmin.backgroundColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        }
        
        if  bottlebuttonclicked == true
        {
            //            pintimage.image = UIImage(named: "enabled")
            //            bottleimage.image = UIImage(named: "enabled")
            //            locationimage.image = UIImage(named: "enabled")
            
            headercellmax.backgroundColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        }
        
        if locationbuttonclicked == true
        {
            //            pintimage.image = UIImage(named: "enabled")
            //            bottleimage.image = UIImage(named: "enabled")
            //            locationimage.image = UIImage(named: "enabled")
            
            headercelldist.backgroundColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        }
        
        if arrowimage == true
        {
            arrowmark.image = UIImage(named: "arrowup")
     
            
        }
        if arrowimage == false
        {
            arrowmark.image = UIImage(named: "arrow")
      
        }

        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
