//
//  onemoreclass1.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class onemoreclass1: UITableViewCell
{

    @IBOutlet weak var liqname: UILabel!

    @IBOutlet weak var micprice: UILabel!

    @IBOutlet weak var maxprice: UILabel!
    
    
    @IBOutlet weak var newliqname: UILabel!
    @IBOutlet weak var newminprice: UILabel!
    @IBOutlet weak var newmaxprice: UILabel!
    
    
    
    
    
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
}
