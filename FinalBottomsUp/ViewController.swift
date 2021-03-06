//
//  ViewController.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 07/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
//import MapKit
import FBSDKCoreKit
import FBSDKLoginKit

import AddressBook
import MediaPlayer
import AssetsLibrary
import CoreLocation
import CoreMotion
import GoogleMaps

class ViewController: UIViewController,GPPSignInDelegate,GIDSignInDelegate, GIDSignInUIDelegate

{
    
    var uName:String!
    
    var signIn: GPPSignIn!
    
    var kClientID = "587696970048-18ifi3olkhbl3djkc2qgstlo5bp3vp9g.apps.googleusercontent.com"
    
    @IBOutlet weak var backgroundimage: UIImageView!
    var fbemail:String!
    var fbid:String!
    
    var gemail:String!
    var gid:String!

    @IBOutlet weak var FBbutton: UIButton!


    @IBOutlet weak var webviewforgif: UIWebView!
   
    @IBOutlet weak var googlesignIN: GIDSignInButton!
    
    @IBOutlet weak var gogo: UIButton!

    @IBOutlet weak var GoogleSignIN: GPPSignInButton!
   var placesClient: GMSPlacesClient?
    let totalCount = 1
    var count = 1
    var myTimer = NSTimer()
    var username:String!
    var emailid:String!
    var userid:String!
    var GSignin: GIDSignIn!
    
    
    var emailkeyvalue:String!
    var idkeyvaluew:String!

    
    override func viewDidLoad()
    
    {
        GSignin = GIDSignIn()
        
        GSignin.clientID = kClientID
        
        GSignin.shouldFetchBasicProfile = true
        
        
        
        GSignin.delegate = self
        
        
        GSignin.uiDelegate = self
        
        
//        let prefs = NSUserDefaults.standardUserDefaults()
//        
//        if let emailidforkey = prefs.stringForKey("emaild")
//        {
//            println("The user has a mailid: " + emailidforkey)
//            let str = "Results"
//            var vc = self.storyboard!.instantiateViewControllerWithIdentifier(str) as! results1
//            //self.presentViewController(vc, animated: true, completion: nil)
//            
//            dispatch_async(dispatch_get_main_queue(), {
//                self.presentViewController(vc, animated: true, completion: nil)
//            })
//          //  performSegueWithIdentifier("newidentifier", sender: self)
//        }
//        else
//        {
//            //Nothing stored in NSUserDefaults yet. Set a value.
//            //prefs.setValue("Berlin", forKey: "userCity")
//        }
        
        

        
        super.viewDidLoad()

        if CheckforInternetViewController.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }
        
        println(emailkeyvalue)


    }

    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
   
    @IBAction func googlesignIn(sender: AnyObject)
    {

    }
    
    //Autocompletion
    func placeAutocomplete() {
        let filter = GMSAutocompleteFilter()
        filter.type = GMSPlacesAutocompleteTypeFilter.City
        placesClient?.autocompleteQuery("Sydney Oper", bounds: nil, filter: filter, callback: { (results, error: NSError?) -> Void in
            if let error = error {
                println("Autocomplete error \(error)")
            }
            
            for result in results! {
                if let result = result as? GMSAutocompletePrediction {
                    println("Result \(result.attributedFullText) with placeID \(result.placeID)")
                }
            }
        })
    }

    
    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!) {
        print("\(error), \(auth)")
        
        if ((error) != nil) {
            
            print(error.localizedDescription)
            
        } else {
            
            
            print(signIn.userEmail)
            print(signIn.userID)
            getGoogleLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(signIn.userEmail)&password=\(signIn.userID)")
            performSegueWithIdentifier("newsearch", sender: self)
            
           // self.performSegueWithIdentifier("loggedIn", sender: self)
            
        }
        
    }
    
    
    func getGoogleLoginData(urlString:String)
    {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            if (error == nil)
            {
                println(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            }
         
        }
    }
    
    @IBAction func FBbuttonClicked(sender: UIButton)
    
    {




        let login = FBSDKLoginManager()
        let FBSDKResult: FBSDKLoginManagerLoginResult!
        let error: NSError!
        
        login.logInWithReadPermissions(["public_profile", "email"]){ (FBSDKResult, error) -> Void in
            if (error != nil) {
                NSLog("Process error")
            } else if (FBSDKResult.isCancelled) {
                NSLog("Cancelled")
            } else {
                NSLog("Logged in")
                
                let graph = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, email, gender, picture"])
                graph.startWithCompletionHandler({ (connection, user, error) -> Void in
                    if error == nil{
                       // self.actInd.startAnimating()
                        let dictuser = user["email"] as! String!
                        self.username = user["name"] as! String!
                        println(self.username)
                        var delimiter = " "
                        var token = self.username.componentsSeparatedByString(delimiter)
                        print (token[0])
                        self.uName = token[0]
                        println(self.uName)
                        let id = user["id"]as! String!
                        self.userid = id
                        println(self.userid )
                        self.emailid = dictuser
                        println(self.emailid)
                        
                        let prefs = NSUserDefaults.standardUserDefaults()
                        
                        //prefs.setValue("vinayak", forKey: "mmm")

                        prefs.setValue(self.emailid, forKey: "emaild")
                        self.emailkeyvalue = prefs.valueForKey("emaild") as! String
                        println(self.emailkeyvalue)
                        prefs.setValue(self.userid, forKey: "id")
                        self.idkeyvaluew = prefs.valueForKey("id") as! String
                        println(self.idkeyvaluew)
                        
                        
                    
                        
                        
                        self.getFBLoginData("http://demos.dignitasdigital.com/bottomzup/facebooklogin.php?emailid=\(self.emailid)&facebookid=\(self.userid)")
                        NSUserDefaults.standardUserDefaults().setValue(self.emailid, forKey: "username")
                        NSUserDefaults.standardUserDefaults().setValue("facebook", forKey: "password")
                        NSUserDefaults.standardUserDefaults().setValue(true, forKey: "hasLoginKey")
                        
                        let tracker = GAI.sharedInstance().defaultTracker
                        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(self.emailid)",action: "\(self.username)",label: "From facebook", value: nil).build()
                        tracker.send(eventTracker as! [NSObject : AnyObject])
                    
                            let str = "Results"
                            var vc = self.storyboard!.instantiateViewControllerWithIdentifier(str) as! results1
                            vc.uName = self.uName.capitalizedString
                            self.presentViewController(vc, animated: true, completion: nil)
                            
                        
                  
                        
                    }
                })
                
            }
        }
    }
    
    
    func didDisconnectWithError(error: NSError!)
    {
        
    }
    
    func getFBLoginData(urlString:String)
    {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            if (error == nil)
            {
                println(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
            }
           // self.returnUserData()
        }
    }
    @IBAction func gogo(sender: AnyObject)
    {
       // performSegueWithIdentifier("show", sender: self)
        performSegueWithIdentifier("newsearch", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let dist = segue.destinationViewController as! results1
        
        if segue.identifier == "newsearch"
        {
            if let destination = segue.destinationViewController as? results1
            {
                println(self.uName)
                if uName != nil
                
                {
                   destination.uName = self.uName.capitalizedString
                }
                else
                {
                    
                }
                
            }
        }
        
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        
        withError error: NSError!) {
            
            if (error == nil) {
                
                // Perform any operations on signed in user here.
                
                let userId = user.userID                  // For client-side use only!
                
                let idToken = user.authentication.idToken // Safe to send to the server
                
                let name = user.profile.name
                
                let email = user.profile.email
                
                if user.profile.hasImage == true{
                    
                    let imgURL = user.profile.imageURLWithDimension(0)
                    
                   // userimageURL = imgURL.absoluteString
                    
                }
                
                // ...
                
              //  self.actInd.startAnimating()
                
                //let dictuser = user["email"] as! String!
                
                gid = userId
                
                username = name
               
                
                var delimiter = " "
                // var newstr = "token0 token1 token2 token3"
                var token = self.username.componentsSeparatedByString(delimiter)
                print (token[0])
                self.uName = token[0]

                println(uName)
                
                
                
                emailid = email
                
                getGoogleLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(emailid)&password=\(gid)")
                performSegueWithIdentifier("newsearch", sender: self)
                
                
                
                
                
                
                //gender = user["gender"] as! String!
                
                let googleid = userId
                
                NSUserDefaults.standardUserDefaults().setValue(emailid, forKey: "username")
                
                NSUserDefaults.standardUserDefaults().setValue("google", forKey: "password")
                
                NSUserDefaults.standardUserDefaults().setValue(true, forKey: "hasLoginKey")
                
                
                
                let gurl = NSURL(string: "http://www.google.com")
                
            } else {
                
                print("\(error.localizedDescription)")
                
            }
            
    }
    
    
    
    
    
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        
        withError error: NSError!) {
            
            // Perform any operations when the user disconnects from app here.
            
            // ...
            
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.synchronize()
    }
    
    
    
    
    
    
    @IBAction func google(sender: GIDSignInButton)
    {
         GSignin.signIn()
    }
    
    
    
    
    
    
    
    
    
}