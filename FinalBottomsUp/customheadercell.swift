//
//  customheadercell.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Social
import Foundation
import SystemConfiguration

class customheadercell: UITableViewCell
{
    @IBOutlet weak var headercellname: UILabel!

    @IBOutlet weak var headercellmin: UILabel!

    @IBOutlet weak var headercellmax: UILabel!
 
    @IBOutlet weak var headercelldist: UILabel!
 
    override func awakeFromNib()
    {
        super.awakeFromNib()

 
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func discountbutton(sender: AnyObject)
    {

    }
    
    
    @IBAction func facebooklogin(sender: AnyObject)
    
    {
//        var presentViewController = customheadercell()
//        var sharetoFacebook:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//        self.window?.rootViewController?.presentViewController(sharetoFacebook,animated:true,completion:nil)
        
//        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//        shareToFacebook.setInitialText("Hello I Posted Using Swift And Social Framework")
//        shareToFacebook.addImage(UIImage(named: "32.png"))
//        self.presentViewController(shareToFacebook, animated: true, completion: nil)
        
//            var text = "Hello sharing !!"
//            let objectsToShare = [text]
//            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
//            self.window?.rootViewController?.presentViewController(activityVC, animated: true, completion: nil)
        
//        
//        let facebookURL = NSURL(string: "fb://profile/134417203252602")!
//        checkNetwork(NSURL(string: "https://www.facebook.com/ctcapitolreport")!)
//        if UIApplication.sharedApplication().canOpenURL(facebookURL) {
//            
//            UIApplication.sharedApplication().openURL(facebookURL)
//        } else {
//            UIApplication.sharedApplication().openURL(NSURL(string: "https://www.facebook.com/ctcapitolreport")!)
//        }
//        var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
//        content.contentURL = NSURL.URLWithString("https://developers.facebook.com")

    }

}
