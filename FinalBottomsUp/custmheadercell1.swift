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

    @IBOutlet weak var availofferbutton: UIButton!
    
    @IBOutlet weak var taprecognizerimage: UIImageView!
    
    @IBOutlet weak var viewtodisplayhappyhourbeforeexpantion: UIView!
    @IBOutlet weak var Happyhourlabelbeforeexpantion: UILabel!
    
    @IBOutlet weak var Happyhourtimingdisplaybeforeexpantion: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
            }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
