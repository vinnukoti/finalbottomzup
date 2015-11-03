//
//  maplable.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 12/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit


class maplable: UITableViewCell
{
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var distance: UILabel!
  
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        if distnacemapsort == true
        {
            distance.backgroundColor = UIColor.yellowColor()
           
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
  
    
}
