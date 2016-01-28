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

class ViewController: UIViewController

{
    
    var fbemail:String!
    var fbid:String!
    
    var gemail:String!
    var gid:String!

    @IBOutlet weak var FBbutton: UIButton!


    @IBOutlet weak var webviewforgif: UIWebView!
   
    
    @IBOutlet weak var gogo: UIButton!

   var placesClient: GMSPlacesClient?
    let totalCount = 1
    var count = 1
    var myTimer = NSTimer()
    var username:String!
    var emailid:String!
    var userid:String!

    
    override func viewDidLoad()
    
    {
        
        super.viewDidLoad()
        
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

    func update(){

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
        let signIn = GPPSignIn.sharedInstance()
        signIn.shouldFetchGooglePlusUser = true
        signIn.shouldFetchGoogleUserEmail = true  // Uncomment to get the user's email
        signIn.shouldFetchGoogleUserID = true
        signIn.clientID = "587696970048-18ifi3olkhbl3djkc2qgstlo5bp3vp9g.apps.googleusercontent.com"
        // Uncomment one of these two statements for the scope you chose in the previous step
        signIn.scopes = [ kGTLAuthScopePlusLogin ]  // "https://www.googleapis.com/auth/plus.login" scope
        //signIn.delegate = self
        signIn.authenticate()
     
        getGoogleLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(gemail)&password=\(gid)")
        
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


    func finishedWithAuth(auth: GTMOAuth2Authentication!, error: NSError!)
    {
        if (GPPSignIn.sharedInstance().userID != nil)
        {
            let user = GPPSignIn.sharedInstance().googlePlusUser
            let signin = GPPSignIn.sharedInstance()
            // println("user name: " + user.name.JSONString() + "\nemail: ")
                 gemail = signin.userEmail
                 println("email ID is : " + gemail)
      
                gid = user.identifier
                println("User ID is: " + user.identifier)
            
       
            
        }
        
        if gemail != nil && gid != nil
        {
            println(gemail)
            println(gid)
          
            performSegueWithIdentifier("newsearch", sender: self)
            
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
        
//        var login = FBSDKLoginManager()
//        var error: NSError!
//        var result : FBSDKLoginManagerLoginResult!
//        login.logInWithReadPermissions(["public_profile"], handler: { (result, error) in
//            if ((error) != nil)
//            {
//                NSLog("Process error");
//            } else if (result.isCancelled)
//            {
//                NSLog("Cancelled");
//            }
//            else
//            {
//          
//               // self.returnUserData()
//                NSLog("Logged in");
//            }
//        })
        
       // getFBLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(fbemail)&password=\(fbid)")
        
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
                        let arr = user["picture"] as! NSDictionary
                        let dict = arr["data"] as! NSDictionary
                        //userimageURL = dict["url"] as! String!
                       // gender = user["gender"] as! String!
                        let fbid = user["id"] as! String!
                        NSUserDefaults.standardUserDefaults().setValue(self.emailid, forKey: "username")
                        NSUserDefaults.standardUserDefaults().setValue("facebook", forKey: "password")
                        NSUserDefaults.standardUserDefaults().setValue(true, forKey: "hasLoginKey")
                        
                        let tracker = GAI.sharedInstance().defaultTracker
                        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(self.emailid)",action: "\(self.username)",label: "From facebook", value: nil).build()
                        tracker.send(eventTracker as! [NSObject : AnyObject])
                        
//                        let gurl = NSURL(string: "http://www.google.com")
//                        if (self.isConnectedToNetwork(gurl!) == true){
//                            self.post(["source":"IOS", "devicetype": "Iphone", "deviceid": deviceTok, "fbid":fbid, "username":username, "emailaddress":emailid, "gender":gender, "profilepicture":userimageURL, "password": "facebook"], url: "http://myish.com:3000/api/sociallogin")
//                        }
                        
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
    
    
//    func returnUserData()
//    {
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me?fields=id,name,email", parameters: nil)
//        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
//            
//            if ((error) != nil)
//            {
//                // Process error
//                println("Error: \(error)")
//            }
//                
//            else
//            {
//                if let resultdict = result as? NSDictionary
//                {
////                    if let id = resultdict["id"] as? String
////                    {
////                        println("id : " + id)
////                        self.fbid = id
////                    }
////                    
////                    if let email = resultdict["email"] as? String
////                    {
////                        println("Email is : " + email)
////                        self.fbemail = email
////                    }
//                    
//                    if let id: NSString = result.valueForKey("id") as? NSString
//                    {
//                        println("ID is: \(id)")
//                     //   self.returnUserProfileImage(id)
//                    } else
//                    {
//                        println("ID es null")
//                    }
//                    
//              
//
//                }
//                
//       
//            }
//        })
//        
//
//         performSegueWithIdentifier("newsearch", sender: self)
//    
//}
    
    
    
//    func returnUserData1()
//    {
//        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
//        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
//            
//            if ((error) != nil)
//            {
//                // Process error
//                println("Error: \(error)")
//            }
//            else
//            {
//                println("fetched user: \(result)")
//                
//                if let id: NSString = result.valueForKey("id") as? NSString {
//                    println("ID is: \(id)")
//                    returnUserProfileImage(id)
//                } else {
//                    println("ID es null")
//                }
//                
//                
//            }
//        })
//    }
    @IBAction func gogo(sender: AnyObject)
    {
       // performSegueWithIdentifier("show", sender: self)
        performSegueWithIdentifier("newsearch", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}