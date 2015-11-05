//
//  custmheadercell1.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 08/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class custmheadercell1: UITableViewCell

{

    
    @IBOutlet weak var vodkarestaurantname: UILabel!
    
    @IBOutlet weak var vodkaavgprice: UILabel!
    
    @IBOutlet weak var mapbuttonvodkaclass: UIButton!

    
    override func awakeFromNib()
    {
        super.awakeFromNib()
//        if pricebuttonclicked == true
//        {
//            vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//        }
//        
//        if distancevodkabuttonclicked == true
//        {
//            vodkadistance.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//        }
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
