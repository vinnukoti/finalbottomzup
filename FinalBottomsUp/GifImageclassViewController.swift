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
    var playernew: MPMoviePlayerController?
   
    override func viewDidLoad()
    {
        super.viewDidLoad()

//        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
//        webviewforgif.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        let timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "update", userInfo: nil, repeats: false)
//        webviewforgif.userInteractionEnabled = false
        
       // img = UIImageView(frame: self.view.frame)
     //   img.backgroundColor = UIColor.whiteColor()
      //  NSNotificationCenter.defaultCenter().addObserver(self, selector: "checkMovieStatus:", name: MPMoviePlayerLoadStateDidChangeNotification, object: nil)

        //self.view.addSubview(img)
        
        
      //  localFunc()
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

    
//    func checkMovieStatus()
//    {
//    //if moviePlayer.loadState & ([.Playable, .PlaythroughOK])
//        if (moviePlayer?.loadState != nil)
//    {
//    self.view!.addSubview(moviePlayer!.view!)
//    moviePlayer!.play()
//       
//    }

  //  }
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
 
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    func playVideo()
    {
    
        
        let path = NSBundle.mainBundle().pathForResource("black bubble_CLIPCHAMP_1080p", ofType:"mp4")
        let url = NSURL.fileURLWithPath(path!)
        moviePlayer = MPMoviePlayerController(contentURL: url)
          if let player = moviePlayer {
            playernew = player
            player.view.frame = self.view.bounds
            self.view.backgroundColor = UIColor.whiteColor()
            player.prepareToPlay()
            player.scalingMode = .AspectFill
            moviePlayer!.controlStyle = MPMovieControlStyle.None
            player.view.alpha = 0
             self.view.addSubview(player.view)
            player.play()
             var timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "update", userInfo: nil, repeats: true)
            self.view.backgroundColor = UIColor.whiteColor()
        }
    }
    
    func update() {
        playernew!.view.alpha = 1
    }

    override func viewWillAppear(animated: Bool) {
       
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("playerDidFinish:"), name: MPMoviePlayerPlaybackDidFinishNotification, object: moviePlayer)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    func playerDidFinish(sender:AnyObject)
    {
        let prefs = NSUserDefaults.standardUserDefaults()
        
        if let emailidforkey = prefs.stringForKey("emaild")
        {
            println("The user has a mailid: " + emailidforkey)
            let str = "Results"
            var vc = self.storyboard!.instantiateViewControllerWithIdentifier(str) as! results1
            //self.presentViewController(vc, animated: true, completion: nil)
            
            dispatch_async(dispatch_get_main_queue(), {
                self.presentViewController(vc, animated: true, completion: nil)
            })
            //  performSegueWithIdentifier("newidentifier", sender: self)
        }
        else
        {
            self.performSegueWithIdentifier("LoginScreen", sender: self)
            //Nothing stored in NSUserDefaults yet. Set a value.
            //prefs.setValue("Berlin", forKey: "userCity")
        }
        
        
    }
}

//import UIKit
//import MediaPlayer
//
//class VideoViewController: UIViewController {
//
//    var moviePlayer:MPMoviePlayerController!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        var url:NSURL = NSURL(string: "http://jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v")!
//
//        moviePlayer = MPMoviePlayerController(contentURL: url)
//        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 200, height: 150)
//
//        self.view.addSubview(moviePlayer.view)
//        moviePlayer.fullscreen = true
//
//        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
//
//    }
//}
