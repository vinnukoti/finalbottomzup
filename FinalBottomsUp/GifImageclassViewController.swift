//
//  GifImageclassViewController.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 04/12/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class GifImageclassViewController: UIViewController
{

    @IBOutlet weak var webviewforgif: UIWebView!
    var moviePlayer : MPMoviePlayerController?

    override func viewDidLoad()
    {
        super.viewDidLoad()
//        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
//        webviewforgif.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        let timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "update", userInfo: nil, repeats: false)
//        webviewforgif.userInteractionEnabled = false
        playVideo()

        }
    
    
//    func update(){
//        //self.doFlip(self)
//        //println("vinayak")
//        performSegueWithIdentifier("LoginScreen", sender: self)
//        //        if timer.timeInterval == 5
//        //        {
//        //            performSegueWithIdentifier("LoginScreen", sender: self)
//        //        }
//    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
 
    }
    
    func playVideo() {
        let path = NSBundle.mainBundle().pathForResource("black bubble_CLIPCHAMP_1080p", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            moviePlayer!.controlStyle = MPMovieControlStyle.None
           // moviePlayer.
            
            
            self.view.addSubview(player.view)
              performSegueWithIdentifier("LoginScreen", sender: self)
        }
       
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
