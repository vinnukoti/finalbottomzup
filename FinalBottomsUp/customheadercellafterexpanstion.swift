//
//  customheadercellafterexpanstion.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 26/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class customheadercellafterexpanstion: UITableViewCell
{
    @IBOutlet weak var bottlelabel: UILabel!
    
    @IBOutlet weak var pintlabel: UILabel!
    
    @IBOutlet weak var restNameafterexpastion: UILabel!

    @IBOutlet weak var HappyhourstimingAfterexpantion: UILabel!
    @IBOutlet weak var viewtodisplayhappyhoursafterexpanstion: UIView!
    
    @IBOutlet weak var imageviewtapguesturerecognizer: UIImageView!
    
    @IBOutlet weak var happyhoursdisplaylabelafterexpantion: UILabel!

  //var widthnew = CGFloat()
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
//    {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        widthnew = viewtodisplayhappyhoursafterexpanstion.frame.width
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    // widthnew =  viewtodisplayhappyhoursafterexpanstion.frame.width
        

    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
