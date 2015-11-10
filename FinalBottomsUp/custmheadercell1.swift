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
    
    @IBOutlet weak var happyhourslabelvodka: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let happyhorsimage = UIImage(named: "Happyhoursround image")
        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: happyhourslabelvodka.frame.width, height: happyhourslabelvodka.frame.height))
        myImageView.image = happyhorsimage
        happyhourslabelvodka.addSubview(myImageView)

    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    
    
}
