//
//  AppDelegate.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 07/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleMaps
import Fabric
import Crashlytics



var fontsizenew:CGFloat!

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?
    var reachability:Reachability?
   
   static var fontsize:Int!
    static var timesCalled = 0
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        
        
        
        var screenHeight: CGFloat = UIScreen.mainScreen().bounds.size.height
        var screenWidth: CGFloat = UIScreen.mainScreen().bounds.size.width
        if screenHeight < screenWidth
        {
            screenHeight = screenWidth
        }
        if screenHeight > 480 && screenHeight < 667
        {
           
          fontsizenew = 11
            println(fontsizenew)
            NSLog("iPhone 5/5s")
        }
        else if screenHeight > 480 && screenHeight < 736
        {
            fontsizenew = 13
            println(fontsizenew)
            NSLog("iPhone 6")
        }
        else if screenHeight > 480
        {
            fontsizenew = 16
            NSLog("iPhone 6 Plus")
        }
        else
        {
            fontsizenew = 8
            NSLog("iPhone 4/4s")
        }
        

        
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height
//        
//        if screenWidth <= 320
//        {
//            
//        }
//        else
//        {
//            
//        }
//        
//        println(screenWidth)
//        println(screenHeight)
        

        
        
//        var configureError: NSError?
//        GGLContext.sharedInstance().configureWithError(&configureError)
//        assert(configureError == nil, "Error configuring Google services: \(configureError)")
//        
//        GIDSignIn.sharedInstance().delegate = self
//        
//        return true


       // GIDSignIn.sharedInstance().clientID = kClientID
        var gai = GAI.sharedInstance()
        gai.trackUncaughtExceptions = true  // report uncaught exceptions
        gai.logger.logLevel = GAILogLevel.Verbose  // remove before app release
        

        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().logger.logLevel = GAILogLevel.Verbose
        GAI.sharedInstance().trackerWithTrackingId("UA-73017985-1")
        

        
//        var tracker2:GAITracker = GAI.sharedInstance().defaultTracker as GAITracker
//        tracker2.set(kGAIScreenName, value:"Home Screen")
        


        NSNotificationCenter.defaultCenter().addObserver(self, selector: "CheckforReachability:", name: kReachabilityChangedNotification, object: nil)
        self.reachability = Reachability.reachabilityForInternetConnection()
        self.reachability!.startNotifier()
    
         //    GMSServices.provideAPIKey("AIzaSyBvSmi0fvOIfFosTmK4khDP6oLaO43kasY")
             Fabric.with([Crashlytics.self()])
        
               // NSThread.sleepForTimeInterval(1)

        
        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        
        
    }
    
        func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool
        {
    
    
    
            if url == FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
            {
               return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    
            }
    
            else
            {
                return GPPURLHandler.handleURL(url, sourceApplication: sourceApplication, annotation: annotation)
    
            }
            
         
            
        }
    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool
//    {
//        
//        
//        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
//        
//    }
    
    func applicationDidBecomeActive(application: UIApplication)
    {
//        GiFHUD.setGif("bubbles (1).gif")
//        GiFHUD.show()
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(4 * Double(NSEC_PER_SEC)))
//        dispatch_after(delay, dispatch_get_main_queue(), {
//            GiFHUD.dismiss()
//        })

        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBSDKAppEvents.activateApp()
    }

    

    func applicationWillResignActive(application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication)
    {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationWillTerminate(application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func CheckforReachability(notification:NSNotification)
    {
        var remotehostStatus = self.reachability!.currentReachabilityStatus()
        
        if remotehostStatus.value == NotReachable.value
        {
                        let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                        alert.show()
        }
        else
        {
            
        }
    }
    
    


}






















