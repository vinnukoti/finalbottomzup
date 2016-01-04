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
      //  localFunc()
        

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
    
    func playVideo()
    {
    
        let path = NSBundle.mainBundle().pathForResource("black bubble_CLIPCHAMP_1080p", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
        if let player = moviePlayer {
            player.view.frame = self.view.bounds
           // player.prepareToPlay()
            player.scalingMode = .AspectFill
            moviePlayer!.controlStyle = MPMovieControlStyle.None
            println(player.duration)
             player.play()
            self.view.addSubview(player.view)
            

            
        }
        
        

    }
    


    override func viewWillAppear(animated: Bool) {
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("playerDidFinish:"), name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func playerDidFinish(sender:AnyObject)
    {
        
        self.performSegueWithIdentifier("LoginScreen", sender: self)
    }
    
    

}
