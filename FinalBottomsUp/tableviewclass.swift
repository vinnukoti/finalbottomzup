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
var latitude:Double!
var longitude:Double!
var doubleTap = true

var arrowimage = false



class tableviewclass: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    var pintbuttonclicked = false
    var bottlebuttonclicked = false
    var locationbuttonclicked = false
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var pintbutton: UIButton!
    
    @IBOutlet weak var bottlebutton: UIButton!
    @IBOutlet weak var locationbutton: UIButton!
    
    @IBOutlet weak var pintdisplayname: UILabel!
    @IBOutlet weak var bottledisplaylable: UILabel!
    @IBOutlet weak var locationdisplaylable: UILabel!

    @IBOutlet weak var resturantnamelable: UILabel!
    @IBOutlet weak var restaurantnamelable2: UILabel!
    let checkedImage = UIImage(named: "pint")
    let unCheckedImage = UIImage(named: "bottle")

    var liqname:String!
    var head:[Restaurant] = [Restaurant]()
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var booleanhidelable = false
    var selectedrestaurant = false
      var resobjr = Restaurant()
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    
    var getResturantlatitude:[Double] = [Double]()
    var getRestuarantlongitude:[Double] = [Double]()
    var sectiontapped:Int!
    
    
    override func viewDidLoad()
    {
        
       // println(getResturantlatitude)
//        let tap = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
//        mainview.addGestureRecognizer(tap)
  
        
//        self.pintbutton.setImage(UIImage(named: "pintimage"), forState: UIControlState.Normal)
//        self.pintbutton.setBackgroundImage(UIImage(named: "bottle"), forState: UIControlState.Normal)
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
        popupview.addGestureRecognizer(tap1)
        popupview.hidden = true
        super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        pintdisplayname.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
        bottledisplaylable.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
        locationdisplaylable.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
     }

    
    // Resign Firstresponder of UITableview
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
          popupview.hidden = true
        //tableview.hidden = true
    }
    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
    
        popupview.hidden = false
           // popupview.hidden = true
    }
    @IBAction func shareonfacebook(sender: AnyObject)
    {
       var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "www.google.com")
        content.contentTitle = "Bottomz Up"
        content.contentDescription = "I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App"
        
        //var content: FBSDKShareLinkContent = FBSDKShareLinkContent()

        //shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
        //content.contentURL =  NSURL(string: DOWNLOAD_LINK_APPSTORE)
        //content.contentTitle = "My Custom Title"
        //content.contentDescription = "My Custom Description"
       // content.imageURL = NSURL(string: FB_IMAGE_LINK)
        // Share Dialog
       // FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
////
        shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App")
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
//        
//        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//       shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
//        self.presentViewController(shareToFacebook, animated: true, completion: nil)
//
//        
////        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)
////        {
////            
////            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
////            facebookSheet.setInitialText("Vea Software! :D")
////            self.presentViewController(facebookSheet, animated: true, completion: nil)
////
////        }
////        else
////        {
////            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
////            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
////            self.presentViewController(alert, animated: true, completion: nil)
////    }
//        
//        var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
//        content.contentURL = NSURL(string:"https://developers.facebook.com")
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
     
        return head.count
    }
    
    @IBAction func getdiscount1(sender: AnyObject)
    {
       
        //selectedrestaurant = true
        popupview.hidden = false
         resturantnamelable.text = "I just got a 10% discount at"
        restaurantnamelable2.text = "Aangan Restaurant \(resobjr.restname) through the BottomzUp App"

    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if head[section].bool == true
        {
             return head[section].amp.count
        }
        else
        {
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("childcellnew", forIndexPath: indexPath) as! onemoreclass1
        cell.liqname.text = head[indexPath.section].amp[indexPath.row].liqbrand
        cell.micprice.text =  "₹ " + head[indexPath.section].amp[indexPath.row].pint
        cell.maxprice.text = "₹ " + head[indexPath.section].amp[indexPath.row].Bottle
        
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 65
    }
    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 55
//    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 65
        
        
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {

        var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        headerCell.tag = section
        //headerCell.backgroundColor = UIColor.cyanColor()
        headerCell.backgroundColor = UIColor.whiteColor()
    
        headerCell.headercellname.text = head[section].restname
        headerCell.headercellmin.text = "₹ " + head[section].minp
        headerCell.headercellmax.text = "₹ " + head[section].maxp
        //headerCell.headercelldist.text = head[section].distance
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped)
        headerCell.userInteractionEnabled = true
        headerCell.mapbutton.tag = section
        headerCell.mapbutton.setTitle(head[section].distance, forState: UIControlState.Normal)

        //Remove all empty cell is UITableview
        var tblView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = tblView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
        
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
        //arrowimage = true
        booleanhidelable = true
        selectedrestaurant = false
        var section = gestureRecognizer.view!.tag
        println(section)
        sectiontapped = section
        println("Section: \(gestureRecognizer.view!.tag)")
       
        if head[gestureRecognizer.view!.tag].bool == false
        {
            head[gestureRecognizer.view!.tag].bool = true
//            if head[gestureRecognizer.view!.tag].bool == true
//            {
//               arrowimage = true
//            }
        }
        else
        {
            head[gestureRecognizer.view!.tag].bool = false
//            if head[gestureRecognizer.view!.tag].bool == false
//            {
//                arrowimage = false
//            }
            
        }
        self.tableview.reloadData()
       
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        view.layer.borderColor = UIColor.brownColor().CGColor
        view.layer.borderWidth = 1
    }

    @IBAction func lookfurther(sender: AnyObject)
    {
//         println("latitude is \(citylat)")
//         println("longitude is\(citylong)")
        if trim == true
        {
            //28.63875
            //77.07380
        getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=8&records=4&query=\(liqname)")
            trim = false
        }
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
                fstobj1 = Restaurant()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            fstobj1.restname = res_name
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            //convert String to Double
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restlat = string.doubleValue
                            println(restlat)
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restlong = string.doubleValue
                            println(restlong)
                            
                            
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            
                            var OldLocation: CLLocation = CLLocation(latitude: getcitylatitude, longitude: getcitylongitude)
                            var newLocation: CLLocation = CLLocation(latitude: restlat, longitude: restlong)
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
                            
                            
                            fstobj1.distance = totalDistance1 + "KMS"
                            println(fstobj1.distance)
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
                            fstobj1.amp.append(liqobj1)
                    }
                }
                    if let pint_avg_price = bottomsUp1["pint_avg_price"] as? Int
                    {
                        var pint_avg_price1:String = toString(pint_avg_price)
                        fstobj1.minp = pint_avg_price1
                    }
                    if let bottle_avg_price = bottomsUp1["bottle_avg_price"] as? Int
                    {
                        var bottle_avg_price1:String = toString(bottle_avg_price)
                        fstobj1.maxp = bottle_avg_price1
                    }
            }
                head.append(fstobj1)
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
            pintbutton.setImage(checkedImage, forState: .Normal)
            bottlebutton.setImage(unCheckedImage, forState: .Normal)
            locationbutton.setImage(unCheckedImage, forState: .Normal)
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
                        if cards[i].minp > cards[i+1].minp
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
            doubleTap = false
            
        
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
            pintbutton.setImage(unCheckedImage, forState: .Normal)
            bottlebutton.setImage(checkedImage, forState: .Normal)
            locationbutton.setImage(unCheckedImage, forState: .Normal)
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
            doubleTap = false
        
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
        pintbuttonclicked = false
        bottlebuttonclicked = false
        locationbuttonclicked = true
        
        if locationbuttonclicked == true
        {
            pintbutton.setImage(unCheckedImage, forState: .Normal)
            bottlebutton.setImage(unCheckedImage, forState: .Normal)
            locationbutton.setImage(checkedImage, forState: .Normal)
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
                    if cards[i].distance > cards[i+1].distance
                    {
                        sorted = false
                        var first = cards[i]
                        var second = cards[i + 1]
                        println("first object before \(first.distance)")
                        println("second object before\(second.distance)")
                        cards[i] = second
                        cards[i + 1] = first
                        
                        println("first object after\(cards[i].distance)")
                        println("second object after\(cards[i + 1].distance)")
                        
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
            doubleTap = false
        
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

       UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=26.63875,76.07380&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
        
    }
    

}













































