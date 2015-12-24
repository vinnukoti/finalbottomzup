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

    
    override func viewDidLoad()
    
    {
        
        super.viewDidLoad()
        
//        let filePath = NSBundle.mainBundle().pathForResource("Bubble-moving", ofType: "gif")
//        let gif = NSData(contentsOfFile: filePath!)
//        webviewforgif.loadData(gif!, MIMEType: "image/gif", textEncodingName: String(), baseURL: NSURL())
//        let timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "update", userInfo: nil, repeats: false)
//        webviewforgif.userInteractionEnabled = false



    }

    func update(){

    }



   
    @IBAction func googlesignIn(sender: AnyObject)
    {
        println("User Logged In With Google+")
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
            
            
            performSegueWithIdentifier("show", sender: self)
            
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
        var login = FBSDKLoginManager()
        var error: NSError!
        var result : FBSDKLoginManagerLoginResult!
        login.logInWithReadPermissions(["public_profile"], handler: { (result, error) in
            if ((error) != nil)
            {
                NSLog("Process error");
            } else if (result.isCancelled)
            {
                NSLog("Cancelled");
            }
            else
            {
                NSLog("Logged in");
            }
        })
        
        getFBLoginData("http://demos.dignitasdigital.com/bottomzup/login.php?emailid=\(fbemail)&password=\(fbid)")
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
            self.returnUserData()
        }
    }
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me?fields=id,name,email", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                println("Error: \(error)")
            }
                
            else
            {
                if let resultdict = result as? NSDictionary
                {
                    if let id = resultdict["id"] as? String
                    {
                        println("id : " + id)
                        self.fbid = id
                    }
                    
                    if let email = resultdict["email"] as? String
                    {
                        println("Email is : " + email)
                        self.fbemail = email
                    }
                }
            }
        })
        
         performSegueWithIdentifier("show", sender: self)
    }
    @IBAction func gogo(sender: AnyObject)
    {
       // performSegueWithIdentifier("show", sender: self)
        performSegueWithIdentifier("newsearch", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}