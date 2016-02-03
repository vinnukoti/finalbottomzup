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

    
    override func viewDidLoad()
    
    {
        GSignin = GIDSignIn()
        
        GSignin.clientID = kClientID
        
        GSignin.shouldFetchBasicProfile = true
        
        
        
        GSignin.delegate = self
        
        
        GSignin.uiDelegate = self

//        signIn = GPPSignIn.sharedInstance()
//        signIn.shouldFetchGooglePlusUser = true
//        signIn.shouldFetchGoogleUserEmail = true  // Uncomment to get the user's email
//        signIn.shouldFetchGoogleUserID = true
//        signIn.clientID = kClientID
//        // Uncomment one of these two statements for the scope you chose in the previous step
//        signIn.scopes = [ kGTLAuthScopePlusLogin ]  // "https://www.googleapis.com/auth/plus.login" scope
//        //signIn.delegate = self
//        signIn.authenticate()
//        
//        signIn.scopes.append(kGTLAuthScopePlusLogin)
//        signIn.scopes.append("profile")
//        signIn.delegate = self
//        signIn.trySilentAuthentication()
        
//        signIn.shouldFetchGooglePlusUser = true
//        signIn.shouldFetchGoogleUserEmail = true
//        signIn.shouldFetchGoogleUserID = true
//        
//        signIn.scopes.append(kGTLAuthScopePlusLogin)
//        signIn.scopes.append("profile")
//        signIn.delegate = self
//        signIn.trySilentAuthentication()
        
//        signIn = GPPSignIn.sharedInstance()
//        signIn.shouldFetchGooglePlusUser = true
//        signIn.shouldFetchGoogleUserEmail = true  // Uncomment to get the user's email
//        signIn.shouldFetchGoogleUserID = true
//        signIn.clientID = kClientID
//        // Uncomment one of these two statements for the scope you chose in the previous step
//        signIn.scopes = [ kGTLAuthScopePlusLogin ]  // "https://www.googleapis.com/auth/plus.login" scope
//        //signIn.delegate = self
//        signIn.authenticate()
//        
//        signIn.scopes.append(kGTLAuthScopePlusLogin)
//        signIn.scopes.append("profile")
//        signIn.delegate = self
//        signIn.trySilentAuthentication()
//        var str = signIn.userEmail
//        var str1 = signIn.userID


        
        super.viewDidLoad()
        
       // backgroundimage.image = UIImage(named: "Newloginbackground")
        
        
//        if Reachability.isConnectedToNetwork() {
//            println("Haz Interwebz!")
//        } else {
//            println("Oh noes! No interwebz!!!")
//        }
//        
        if CheckforInternetViewController.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            print("Internet connection FAILED")
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
        }

        
//        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
//        webviewforgif.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: false)
//        webviewforgif.userInteractionEnabled = false



    }


    
//    override func viewWillAppear(animated: Bool) {
//        var name = "Pattern~\(self.title!)"
//    var tracker = GAI.sharedInstance().defaultTracker
//    tracker.set(kGAIScreenName, value: name)
//    
//    var builder = GAIDictionaryBuilder.createScreenView()
//    tracker.send(builder.build() as [NSObject : AnyObject])
//    ViewController.self
//    }



   
    @IBAction func googlesignIn(sender: AnyObject)
    {
       // println("User Logged In With Google+")
        

   
    
        
        
        //info()
        
       // getInfo()

       // getGoogleLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(gemail)&password=\(gid)")
       // performSegueWithIdentifier("newsearch", sender: self)
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
                        let id = user["id"]as! String!
                        self.userid = id
                        println(self.userid )
                        self.emailid = dictuser
                        println(self.emailid)
                        self.getFBLoginData("http://demos.dignitasdigital.com/bottomzup/facebooklogin.php?emailid=\(self.emailid)&facebookid=\(self.userid)")
                        NSUserDefaults.standardUserDefaults().setValue(self.emailid, forKey: "username")
                        NSUserDefaults.standardUserDefaults().setValue("facebook", forKey: "password")
                        NSUserDefaults.standardUserDefaults().setValue(true, forKey: "hasLoginKey")
                        
                        let tracker = GAI.sharedInstance().defaultTracker
                        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(self.emailid)",action: "\(self.username)",label: "From facebook", value: nil).build()
                        tracker.send(eventTracker as! [NSObject : AnyObject])
                        let str = "Results"
                        var vc = self.storyboard!.instantiateViewControllerWithIdentifier(str) as! UIViewController
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dist = segue.destinationViewController as! results1 
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
    
    
    
    
    
    
    @IBAction func google(sender: GIDSignInButton)
    {
         GSignin.signIn()
    }
    
    
    
    
    
    
    
    
    
}