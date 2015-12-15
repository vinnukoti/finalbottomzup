//
//  customheadercellafterexpastionforvodka.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 26/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class customheadercellafterexpastionforvodka: UITableViewCell

{

    @IBOutlet weak var bottlelabel: UILabel!
    @IBOutlet weak var restnameafterexpastion: UILabel!
    @IBOutlet weak var happyhourslabelafteexaption: UILabel!
    @IBOutlet weak var happyhourstiminglabelafterexpation: UILabel!
    @IBOutlet weak var viewtodisplayhappyhoursafterexpation: UIView!
    //var width = CGFloat()
    
    
//    init()
//    {
//        width = viewtodisplayhappyhoursafterexpation.frame.width
//    }

//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func awakeFromNib()
    
    {
        super.awakeFromNib()
        // Initialization code
    //  width = viewtodisplayhappyhoursafterexpation.frame.width

    }

    override func setSelected(selected: Bool, animated: Bool)
    
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
