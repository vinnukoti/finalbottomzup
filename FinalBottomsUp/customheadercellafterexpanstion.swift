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

    @IBOutlet weak var imageforborder: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
        //viewtodisplayhappyhoursafterexpanstion.layer.addBorder(UIRectEdge.Bottom, color: UIColor.greenColor(), thickness: 2)
        
//        var bottomBorder: UIView = UIView()
//        var borderThickness: Int = 1
//
//        bottomBorder.backgroundColor = UIColor.greenColor()
//        bottomBorder.frame = CGRectMake(0, 0, 10, 1)
//        viewtodisplayhappyhoursafterexpanstion.addSubview(bottomBorder)
        
       // viewtodisplayhappyhoursafterexpanstion = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        //viewtodisplayhappyhoursafterexpanstion.backgroundColor = UIColor.yellowColor()
        
//       var border = CALayer()
//      border.backgroundColor = UIColor.greenColor().CGColor
////        border.frame = CGRect(x: 0, y: , width: 150, height: 2)
//       border.addBorder(UIRectEdge.Top, color: UIColor.greenColor(), thickness: 2)
//        //border.addBorder(UIRectEdge.Left, color: UIColor.greenColor(), thickness: 2)
//       // border.addBorder(UIRectEdge.Right, color: UIColor.greenColor(), thickness: 2)
//       //border.frame = CGRect(x: 0, y: 0, width: 150, height: 2)
//        
       //viewtodisplayhappyhoursafterexpanstion.layer.addSublayer(border)
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
