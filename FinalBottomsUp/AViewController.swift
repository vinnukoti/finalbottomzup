//
//  AViewController.swift
//  GifImage
//
//  Created by Nikhil Srivastava on 11/24/15.
//  Copyright © 2015 Appsriv Technologies. All rights reserved.
//
import UIKit
import AVKit
import AVFoundation

class AViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
//    var blurView: UIVisualEffectView!
//    var vibrancyView: UIVisualEffectView!
   // @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
        let gif = NSData(contentsOfFile: filePath!)
        
        //let webViewBG = UIWebView(frame: self.view.frame)
        webView.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
        webView.userInteractionEnabled = false
        //self.view.addSubview(webView)
        //self.view.addSubview(webView)
        
        let filter = UIView()
        filter.frame = self.view.frame
        filter.backgroundColor = UIColor.blackColor()
        filter.alpha = 0.05
        self.view.addSubview(filter)
        
        
        //self.view.addSubview(button)
        let timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: "update", userInfo: nil, repeats: false)
        //sleep(2)
        //storyboard?.instantiateViewControllerWithIdentifier("postAnimationView")
        //performSegueWithIdentifier("postAnimationView", sender: self)
        
    }
    
   func doFlip(sender:AnyObject?) {
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        let fromvc = self
        let tovc = ViewController()
       // tovc.webView.frame = self.view.bounds
    
        
        // must have both as children before we can transition between them
        self.addChildViewController(tovc) // "will" called for us
        // note: when we call remove, we must call "will" (with nil) beforehand
        fromvc.willMoveToParentViewController(nil)
        // then perform the transition
        self.transitionFromViewController(fromvc,
            toViewController:tovc,
            duration:0.4,
            options: UIViewAnimationOptions.TransitionCrossDissolve,
            animations: {
                //self.constrainInPanel(tovc.view) // *
            },
            completion:{
                _ in
                // finally, finish up
                // note: when we call add, we must call "did" afterwards
                tovc.didMoveToParentViewController(self)
                fromvc.removeFromParentViewController() // "did" called for us
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
        })
    }
    
//    func constrainInPanel(v:UIView) {
//        print("constrain")
//        v.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activateConstraints([
//            NSLayoutConstraint.constraintsWithVisualFormat("H:|[v]|", options:[], metrics:nil, views:["v":v]),
//            NSLayoutConstraint.constraintsWithVisualFormat("V:|[v]|", options:[], metrics:nil, views:["v":v])
//            ].flatten().map{$0})
//    }
    
    
    func update(){
        self.doFlip(self)
        //performSegueWithIdentifier("rollview", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! ViewController
        
        //        let url = NSURL(string: "movie")
        //        destination.player = AVPlayer(URL: url!)
    }
    
    
}
