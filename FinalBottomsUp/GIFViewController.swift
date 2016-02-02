
//  GIFViewController.swift
//  GifImage
//
//  Created by Nikhil Srivastava on 11/16/15.
//  Copyright © 2015 Appsriv Technologies. All rights reserved.


import UIKit
import AVKit
import AVFoundation

class GIFViewController: UIViewController {


    //var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string:
            "black bubble_CLIPCHAMP_1080p.mp4")
        let player = AVPlayer(URL: url!)
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        self.addChildViewController(playerController)
        self.view.addSubview(playerController.view)
        playerController.view.frame = self.view.frame
      //  player.seekToTime(00:00:00)
        
        player.play()
        
      var image = UIImage(named: "7-beer-gifs-that-will-make-your-mouth-water-wt0")
        let filePath = NSBundle.mainBundle().pathForResource("ghostrider", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
//        webView.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        webView.userInteractionEnabled = false;
//        self.view.addSubview(webView)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.05
        self.view.addSubview(filter)        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
