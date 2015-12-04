//
//  GifImageclassViewController.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 04/12/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class GifImageclassViewController: UIViewController
{

    @IBOutlet weak var webviewforgif: UIWebView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        webviewforgif.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        let timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "update", userInfo: nil, repeats: false)
        webviewforgif.userInteractionEnabled = false
        


        }
    
    
    func update(){
        //self.doFlip(self)
        //println("vinayak")
        performSegueWithIdentifier("LoginScreen", sender: self)
        //        if timer.timeInterval == 5
        //        {
        //            performSegueWithIdentifier("LoginScreen", sender: self)
        //        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
