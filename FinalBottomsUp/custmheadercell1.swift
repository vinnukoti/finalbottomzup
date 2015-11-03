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
    
    @IBOutlet weak var vodkadistance: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        if pricebuttonclicked == true
        {
            vodkaavgprice.backgroundColor = UIColor.yellowColor()
        }
        
        if distancevodkabuttonclicked == true
        {
            vodkadistance.backgroundColor = UIColor.yellowColor()
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
