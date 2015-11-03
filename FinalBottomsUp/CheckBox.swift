//
//  CheckBox.swift
//  checkbox
//
//  Created by kent on 9/27/14.
//  Copyright (c) 2014 kent. All rights reserved.
//

import UIKit

class CheckBox: UIButton
{
    
    //images
    let checkedImage = UIImage(named: "pint")
    let unCheckedImage = UIImage(named: "bottle")
    
    //bool propety
    var isChecked:Bool = false
        {
        didSet
        {
            if isChecked == true
            {
                self.setImage(checkedImage, forState: .Normal)
            }
            else
            {
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }

    
    override func awakeFromNib()
    {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    


    func buttonClicked(sender:UIButton)
    {
        
//        if(sender == self)
//        {
//            if isChecked == true
//            {
//                isChecked = false
//            }
//            else
//            {
//                isChecked = true
//            }
//        }
        
        if pintbuttonclicked == true
        {
           // isChecked = true
            self.setImage(checkedImage, forState: .Normal)
         
        }
        else
        {
            self.setImage(unCheckedImage, forState: .Normal)
        }
        
        if bottlebuttonclicked == true
        {
            isChecked = true
        }
        
        if locationbuttonclicked == true
        {
            isChecked = true
        }
//        else
//        {
//            isChecked = false
//        }
        
     
    }
}


