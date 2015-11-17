//
//  tableviewclass.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social
import FBSDKShareKit


class tableviewclass: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var getfstobj1 = Restaurant()
   // var getfstobj2 = Restaurant()
    
    

    
    
    var pintbuttonclicked = false
    var bottlebuttonclicked = false
    var locationbuttonclicked = false
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var pintbutton: UIButton!
    @IBOutlet weak var bottlebutton: UIButton!
    @IBOutlet weak var locationbutton: UIButton!
    
    @IBOutlet weak var selectedliqname: UILabel!
    @IBOutlet weak var resturantnamelable: UILabel!
    @IBOutlet weak var restaurantnamelable2: UILabel!
    
    let pintcheckedImage = UIImage(named: "pintenabled")
    let pintunCheckedImage = UIImage(named: "pint")
    
    let bottlecheckedImage = UIImage(named: "bottleenabled")
    let bottleunCheckedImage = UIImage(named: "bottle")
    
    let locationcheckedImage = UIImage(named: "locationenabled")
    let locationunCheckedImage = UIImage(named: "location")
    
    var liqname:String!
    var head:[Restaurant] = [Restaurant]()
    var headfurther:[Restaurant] = [Restaurant]()
    
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var resobjr = Restaurant()
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    
    var getResturantlatitude:[Double] = [Double]()
    var getRestuarantlongitude:[Double] = [Double]()
    
    var getrestlatitudebeer:Double!
    var getrestlongitudebeer:Double!
    
    var getselectedliq:String!
    
    @IBOutlet weak var togglebuttonbeer: UIButton!
    let toggleoff = UIImage(named: "toggleoff")
    let toggleon = UIImage(named: "toggleon")
    
    var changecolor = false
    
    var toggle = false
    
    
    override func viewDidLoad()
    {
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
        popupview.addGestureRecognizer(tap1)
        popupview.hidden = true
        super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        pintbutton.setTitle("PINT", forState: .Normal)
        pintbutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        bottlebutton.setTitle("BOTTLE", forState: .Normal)
        bottlebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        locationbutton.setTitle("DISTANCE", forState: .Normal)
        locationbutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        
        var drink = getselectedliq.capitalizedString
        selectedliqname.text =  drink
        togglebuttonbeer.setImage(toggleoff, forState: .Normal)
        
    }
    
    @IBAction func togglebuttonbeerpressed(sender: UIButton)
    {
        if toggle == false
        {
            togglebuttonbeer.setImage(toggleon, forState: .Normal)
            toggle = true
        }
        else{
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
            toggle = false
            
        }
        
    }
    
    
    @IBAction func press2revealPressed(sender: UIButton) {
        
        popupview.hidden = false
        
    }
    
    // Resign Firstresponder of UITableview
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
        popupview.hidden = true
        
    }
    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
        
        popupview.hidden = false
    }
    @IBAction func shareonfacebook(sender: AnyObject)
    {
        //      var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        //        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        //        content.contentURL = NSURL(string: "www.google.com")
        //        content.contentTitle = "Bottomz Up"
        //        content.contentDescription = "I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App"
        
        //var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        
        //shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
        //content.contentURL =  NSURL(string: DOWNLOAD_LINK_APPSTORE)
        //content.contentTitle = "My Custom Title"
        //content.contentDescription = "My Custom Description"
        // content.imageURL = NSURL(string: FB_IMAGE_LINK)
        // Share Dialog
        // FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
        ////
        //        shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App")
        //        self.presentViewController(shareToFacebook, animated: true, completion: nil)
        //
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        //       shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
        //        self.presentViewController(shareToFacebook, animated: true, completion: nil)
        
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)
        {
            
            //            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            //            facebookSheet.setInitialText("Vea Software! :D")
            //            self.presentViewController(facebookSheet, animated: true, completion: nil)
            
            var text: String = "I just got a 10% discount at  \(head[sender.tag].restname) through the BottomzUp App"
            var url: NSURL = NSURL(string: "http://bottomzup.com")!
            var controller: UIActivityViewController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
            self.presentViewController(controller, animated: true, completion: nil)
            
        }
        else
        {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        //
        //        var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        //        content.contentURL = NSURL(string:"https://developers.facebook.com")
        
        //        var text: String = "How to add Facebook and Twitter sharing to an iOS app"
        //        var url: NSURL = NSURL(string: "http://roadfiresoftware.com/2014/02/how-to-add-facebook-and-twitter-sharing-to-an-ios-app/")!
        //        var controller: UIActivityViewController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        //        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return head.count
    }
    
    @IBAction func getdiscount1(sender: AnyObject)
    {
        popupview.hidden = false
        resturantnamelable.text = "I just got a 10% discount at"
        restaurantnamelable2.text = "\(head[sender.tag].restname) through the BottomzUp App"
        
    }
    @IBAction func gotomap(sender: AnyObject)
    {
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if head[section].bool == true
        {
            return 1
        }
        else
        {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cells = tableView.dequeueReusableCellWithIdentifier("tableChildCell", forIndexPath: indexPath) as! BeerRowCell
        cells.beers = [liqclass]()
        cells.beers = head[indexPath.section].amp
        cells.press2reveal.tag = indexPath.section
      //  cells.directions.setTitle(head[indexPath.section].distance, forState: UIControlState.Normal)
        cells.distancelabelnew.text = head[indexPath.section].distance
        cells.tableView.reloadData()
        
        return cells
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        cell.layer.borderColor = UIColor.brownColor().CGColor
        cell.layer.borderWidth = 1
        //         cell.layer.addBorder(UIRectEdge.Right, color: UIColor.blackColor(), thickness: 0.9)
        //        cell.layer.addBorder(UIRectEdge.Left, color: UIColor.blackColor(), thickness: 0.9)
        // cell.layer.addBorder(UIRectEdge.Top, color: UIColor.blackColor(), thickness: 0.9)
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if ((head[indexPath.section].amp.count * 60) + 10) > 210 {
            
            return CGFloat((head[indexPath.section].amp.count * 60) + 10)
        }
        else{
            
            return 210
            
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if head[section].bool == false
        {
            
            return 86
            
        }
        else{
            return 60
        }
        
    }
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        
        
        headerCell.tag = section
        headerCell.backgroundColor = UIColor.whiteColor()
        headerCell.headercellname.text = head[section].restname
        headerCell.headercellmin.text = "₹ " + head[section].minp
        headerCell.headercellmax.text = "₹ " + head[section].maxp
        headerCell.happyhourslabelbeer.text = "Happy Hours " + head[section].happystart + "PM  - " + head[section].happyend + "PM"
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped)
        headerCell.userInteractionEnabled = true
        headerCell.mapbutton.tag = section
        headerCell.mapbutton.setTitle(head[section].distance, forState: UIControlState.Normal)
        headerCell.availofferbuttonbeer.tag = section
        headerCell.headercellname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmin.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmax.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        
        
        if head[section].bool == false
        {
            headerCell.headercellmin.hidden = false
            headerCell.headercellmax.hidden = false
            headerCell.mapbutton.hidden = false
            headerCell.availofferbuttonbeer.hidden = false
            headerCell.happyhourslabelbeer.hidden = false
            headerCell.arrowimage.image = UIImage(named: "arrow")
       }
        else
        {
            headerCell.headercellmin.text = ""
            headerCell.headercellmax.text = ""
            headerCell.mapbutton.setTitle("", forState: UIControlState.Normal)
            headerCell.availofferbuttonbeer.hidden = true
            headerCell.happyhourslabelbeer.hidden = true
            headerCell.arrowimage.hidden = true
            headerCell.headercellnamechild.text = head[section].restname
            headerCell.headercellname.hidden = true
            let happyhoursimage = UIImage(named: "Restauranttab")
            let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width:headerCell.headercellnamechild.frame.width,height: headerCell.headercellnamechild.frame.height))
            headerCell.setheadercellnamechildimaghe.image = happyhoursimage
            headerCell.headercellnamechild.addSubview(myImageView)
        }
        //Giving Font family style to a UIButton
        headerCell.mapbutton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        if head[section].happyend == "yes"
        {
            headerCell.happyhourslabelbeer.layer.cornerRadius = 10
            headerCell.happyhourslabelbeer.layer.borderColor = UIColor.greenColor().CGColor
            headerCell.happyhourslabelbeer.layer.borderWidth = 1
        }
        else
        {
            headerCell.happyhourslabelbeer.layer.cornerRadius = 10
            headerCell.happyhourslabelbeer.layer.borderColor = UIColor.redColor().CGColor
            headerCell.happyhourslabelbeer.layer.borderWidth = 1
        }
        
        if pintbuttonclicked == true
        {
            headerCell.headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        if bottlebuttonclicked == true
        {
            headerCell.headercellmax.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
        if locationbuttonclicked == true
        {
            headerCell.mapbutton.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }

        return headerCell
    }
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        var section = gestureRecognizer.view!.tag
        println(section)
        println("Section: \(gestureRecognizer.view!.tag)")
        
        if head[gestureRecognizer.view!.tag].bool == false
        {
            head[gestureRecognizer.view!.tag].bool = true
            
        }
        else
        {
            head[gestureRecognizer.view!.tag].bool = false
        }
        self.tableview.reloadData()
        
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        //        view.layer.borderColor = UIColor.whiteColor().CGColor
        //        view.layer.borderWidth = 1
        //        view.layer.addBorder(UIRectEdge.Right, color: UIColor.blackColor(), thickness: 0.9)
        //        view.layer.addBorder(UIRectEdge.Left, color: UIColor.blackColor(), thickness: 0.9)
        //       view.layer.addBorder(UIRectEdge.Top, color: UIColor.blackColor(), thickness: 0.9)
        //   let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: headercellname.frame.width, height: headercellname.frame.height))
    }
    
    
    @IBAction func lookfurther(sender: AnyObject)
    {
        //         println("latitude is \(citylat)")
        //         println("longitude is\(citylong)")
        
        //28.63875
        //77.07380
        changecolor = true
        getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=8&records=4&query=\(liqname)")
        
        
    }
    
    func getbardatafurther(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.extract_jsonfurhter(data)
            })
            
        }
        task.resume()
    }
    
    func extract_jsonfurhter(data:NSData)
    {
        var jsonError:NSError?
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            head = [Restaurant]()
            
            for var index = 0; index < json.count; ++index
            {
                getfstobj1 = Restaurant()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            getfstobj1.restname = res_name
                        }
                        
                        
                        if let happy_hour_startbeer = bottomsUp1["happy_hour_start"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_startbeer, 1, 3))
                            var happy_hour_startbeer1 = PartOfString(happy_hour_startbeer, 1, 3)
                            getfstobj1.happystart = happy_hour_startbeer1
                        }
                        
                        if let happy_hour_endbeer = bottomsUp1["happy_hour_end"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_endbeer, 1, 3))
                            var happy_hour_endbeer1 = PartOfString(happy_hour_endbeer, 1, 3)
                            
                            getfstobj1.happyend = happy_hour_endbeer1
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            getfstobj1.ishappy = is_happy_hour
                        }
                        
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            //convert String to Double
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getrestlatitudebeer = string.doubleValue
                            //println(restlat)
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getrestlongitudebeer = string.doubleValue
                            //println(restlong)
                            
                            
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            
                            var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                            var newLocation: CLLocation = CLLocation(latitude: getrestlatitudebeer, longitude: getrestlongitudebeer)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                            println(String(format: "%.2f KM", totalDistance))
                            NSLog("totalDistance: %@", String(format: "%.2f KMS", totalDistance))
                            var totalDistance1 = totalDistance.description
                            println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                            totalDistance1 = PartOfString(totalDistance1, 1, 3)
                            
                            
                            getfstobj1.distance = totalDistance1 + "KMS"
                            // println(fstobj1.distance)
                        }
                    }
                    if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                    {
                        for var i = 0; i < resLiqInfo.count; ++i
                        {
                            var liqobj1 = liqclass()
                            if let one = resLiqInfo[i] as? NSDictionary
                            {
                                
                                if let res_liq_brand_name = one["liq_brand_name"] as? String
                                {
                                    liqobj1.liqbrand = res_liq_brand_name
                                }
                                if let pint_price = one["pint_price"] as? String
                                {
                                    liqobj1.pint = pint_price
                                    
                                }
                                if let bottle_price = one["bottle_price"] as? String
                                {
                                    liqobj1.Bottle = bottle_price
                                    
                                }
                            }
                            getfstobj1.amp.append(liqobj1)
                        }
                    }
                    if let pint_avg_price = bottomsUp1["pint_avg_price"] as? Int
                    {
                        var pint_avg_price1:String = toString(pint_avg_price)
                        getfstobj1.minp = pint_avg_price1
                    }
                    if let bottle_avg_price = bottomsUp1["bottle_avg_price"] as? Int
                    {
                        var bottle_avg_price1:String = toString(bottle_avg_price)
                        getfstobj1.maxp = bottle_avg_price1
                    }
                }
                head.append(getfstobj1)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableview.reloadData()
        
    }
    
    @IBAction func pintsort(sender: AnyObject)
        
    {
        bottlebuttonclicked = false
        locationbuttonclicked = false
        pintbuttonclicked = true
        
        if pintbuttonclicked == true
        {
            //pintbutton.setImage(checkedImage, forState: .Normal)
            pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
            locationbutton.setBackgroundImage(locationunCheckedImage, forState: .Normal)
        }
        
        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        {
            var sorted = false
            while sorted == false
            {
                sorted = true
                if cards.count > 1
                {
                    for i in 0...cards.count - 2
                    {
                        if cards[i].minp < cards[i+1].minp
                        {
                            sorted = false
                            var first = cards[i]
                            var second = cards[i + 1]
                            println("first object before \(first.minp)")
                            println("second object before\(second.minp)")
                            cards[i] = second
                            cards[i + 1] = first
                            println("first object after\(cards[i].minp)")
                            println("second object after\(cards[i + 1].minp)")
                        }
                    }
                }
                else
                {
                    
                }
            }
            return cards
        }
        var sortedarray:[Restaurant] = sortCards(&head)
        head = sortedarray
        self.tableview.reloadData()
        
        println("sorted array is  : \(head)")
        
        
        
        //        else
        //        {
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].minp < cards[i+1].minp
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.minp)")
        //                            println("second object before\(second.minp)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //                            println("first object after\(cards[i].minp)")
        //                            println("second object after\(cards[i + 1].minp)")
        //                        }
        //                    }
        //                    }
        //                    else
        //                    {
        //
        //                    }
        //                }
        //                return cards
        //            }
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
        
    }
    
    @IBAction func bottolesort(sender: AnyObject)
        
    {
        pintbuttonclicked = false
        locationbuttonclicked = false
        bottlebuttonclicked = true
        
        if bottlebuttonclicked == true
        {
            pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
            locationbutton.setBackgroundImage(locationunCheckedImage, forState: .Normal)
            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
            {
                var sorted = false
                while sorted == false
                {
                    sorted = true
                    if cards.count > 1
                    {
                        for i in 0...cards.count - 2
                        {
                            if cards[i].maxp > cards[i+1].maxp
                            {
                                sorted = false
                                var first = cards[i]
                                var second = cards[i + 1]
                                println("first object before \(first.maxp)")
                                println("second object before\(second.maxp)")
                                cards[i] = second
                                cards[i + 1] = first
                                
                                println("first object after\(cards[i].maxp)")
                                println("second object after\(cards[i + 1].maxp)")
                                
                            }
                        }
                    }
                    else
                    {
                        
                    }
                }
                return cards
            }
            var sortedarray:[Restaurant] = sortCards(&head)
            head = sortedarray
            self.tableview.reloadData()
            
            println("sorted array is  : \(head)")
            
        }
        
        
        //        else
        //        {
        //
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].maxp < cards[i+1].maxp
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.maxp)")
        //                            println("second object before\(second.maxp)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //
        //                            println("first object after\(cards[i].maxp)")
        //                            println("second object after\(cards[i + 1].maxp)")
        //
        //                        }
        //                    }
        //                    }
        //                    else
        //                    {
        //
        //                    }
        //                }
        //                return cards
        //            }
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
        
    }
    
    
    @IBAction func locationsort(sender: AnyObject)
    {
        //        pintbuttonclicked = false
        //        bottlebuttonclicked = false
        //        locationbuttonclicked = true
        //
        //        if locationbuttonclicked == true
        //        {
        //            pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
        //            bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
        //            locationbutton.setBackgroundImage(locationcheckedImage, forState: .Normal)
        //        }
        //
        ////        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        ////        {
        ////            var sorted = false
        ////            while sorted == false
        ////            {
        ////                sorted = true
        ////                if cards.count > 1
        ////                {
        ////                for i in 0...cards.count - 2
        ////                {
        ////                    if cards[i].distance > cards[i+1].distance
        ////                    {
        ////                        sorted = false
        ////                        var first = cards[i]
        ////                        var second = cards[i + 1]
        ////                        println("first object before \(first.distance)")
        ////                        println("second object before\(second.distance)")
        ////                        cards[i] = second
        ////                        cards[i + 1] = first
        ////
        ////                        println("first object after\(cards[i].distance)")
        ////                        println("second object after\(cards[i + 1].distance)")
        ////
        ////                    }
        ////                }
        ////                }
        ////                else
        ////                {
        ////
        ////                }
        ////            }
        ////            return cards
        ////            }
        ////            var sortedarray:[Restaurant] = sortCards(&head)
        ////            head = sortedarray
        //            self.tableview.reloadData()
        //
        //            println("sorted array is  : \(head)")
        //
        //        else
        //        {
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].distance < cards[i+1].distance
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.distance)")
        //                            println("second object before\(second.distance)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //                            
        //                            println("first object after\(cards[i].distance)")
        //                            println("second object after\(cards[i + 1].distance)")
        //                            
        //                        }
        //                    }
        //                    }
        //                    else
        //                    {
        //                        
        //                    }
        //                }
        //                return cards
        //            }
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
    }
    
    
    @IBAction func getDirections(sender: UIButton)
    {
        
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
        
    }
    
    
}













































