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

var status:Bool!

var fbemail:String!
var fbid:String!

var gemail:String!
var gid:String!








class ViewController: UIViewController,GPPSignInDelegate

{
    @IBOutlet weak var FBbutton: UIButton!

   
    
    @IBOutlet weak var gogo: UIButton!

   var placesClient: GMSPlacesClient?
    
    override func viewDidLoad()
    
    {
        super.viewDidLoad()
        placesClient = GMSPlacesClient()
    }
   
    @IBAction func googlesignIn(sender: AnyObject) {
    
  
     
        
        println("User Logged In With Google+")
        
        let signIn = GPPSignIn.sharedInstance()
        signIn.shouldFetchGooglePlusUser = true
        signIn.shouldFetchGoogleUserEmail = true  // Uncomment to get the user's email
        signIn.shouldFetchGoogleUserID = true
        signIn.clientID = "131909898152-1euo6vg42c2je2dul8r6khqo6nkjllfs.apps.googleusercontent.com"
        // Uncomment one of these two statements for the scope you chose in the previous step
        signIn.scopes = [ kGTLAuthScopePlusLogin ]  // "https://www.googleapis.com/auth/plus.login" scope
        signIn.delegate = self
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
            
            if (user.emails != nil)
            {
                
               
                gemail = signin.userEmail
                 println("email ID is : " + gemail)
            }
            else
            {
                print("no email")
            }
            
            if (user.identifier != nil)
            {
                
                gid = user.identifier
                println("User ID is: " + user.identifier)
                
            }
            else
            {
                println("User ID is nil")
            }
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
                        fbid = id
                    }
                    
                    if let email = resultdict["email"] as? String
                    {
                        println("Email is : " + email)
                        fbemail = email
                    }
                }
            }
        })
        
        if fbemail != nil && fbid != nil
        {
            
            
            performSegueWithIdentifier("show", sender: self)
            
        }

   
        
        
    }
    @IBAction func gogo(sender: AnyObject)
    {
        performSegueWithIdentifier("show", sender: self)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}