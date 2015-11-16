//
//  tableviewclassvodka.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 08/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social
import FBSDKShareKit



class tableviewclassvodka: UIViewController,UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate
{
    @IBOutlet weak var tableview1: UITableView!
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var liqvodkaname:String!
    var bool = false
    
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var getvodkalatitude:Double!
    var getvodkalongitude:Double!
    
    let bottlecheckedImage = UIImage(named: "bottleenabled")
    let bottleunCheckedImage = UIImage(named: "bottle")
    
    let pintcheckedImage = UIImage(named: "pintenabled")
    let pintunCheckedImage = UIImage(named: "pint")
    
    @IBOutlet weak var popupviewvodka: UIView!

    @IBOutlet weak var distancebutton: UIButton!
    @IBOutlet weak var pricebutton: UIButton!

    @IBOutlet var mainviewvodka: UIView!
    
    var pricebuttonclicked = false
    var distancevodkabuttonclicked = false

    @IBOutlet weak var searchresultsvodka: UILabel!
    @IBOutlet weak var takerestaurantname: UILabel!
    @IBOutlet weak var takerestaurantname1: UILabel!
    
    let toggleoff = UIImage(named: "toggleoff")
    let toggleon = UIImage(named: "toggleon")

    
    @IBOutlet weak var togglebutton: UIButton!
    var getselectedlq:String!
    
    var toggle = false
    
    var getvodkaobj = Restauarantvodka()
    
    
    
    
    
    
    
    override func viewDidLoad()
    {
 
//        tableview1.layer.masksToBounds = true
//        tableview1.layer.borderColor = UIColor(red: 0x00/255,green: 0x00/255,blue: 0x000/255,alpha: 1.0).CGColor
//        tableview1.layer.borderWidth = 1.0
        
        super.viewDidLayoutSubviews()
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
        popupviewvodka.addGestureRecognizer(tap)
        
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
        popupviewvodka.hidden = true
        distancebutton.setTitle("DISTANCE", forState: .Normal)
        distancebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        pricebutton.setTitle("30ML", forState: .Normal)
        pricebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        
        var vodkadrink = getselectedlq.capitalizedString
        searchresultsvodka.text =  vodkadrink
        
        //togglebutton.backgroundColor = UIColor.grayColor()
        //togglebutton.imageView?.image = toggleoff
        togglebutton.setImage(toggleoff, forState: .Normal)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //togglebutton.imageView?.image = toggleoff
        togglebutton.setImage(toggleoff, forState: .Normal)
    }
    
    @IBAction func press2revealPressed(sender: UIButton) {
        
        popupviewvodka.hidden = false
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        
        popupviewvodka.hidden = true
        //tableview.hidden = true
    }

    @IBAction func toggelbuttonpressed(sender: UIButton)
    {
        
        if toggle == false
        {
        togglebutton.setImage(toggleon, forState: .Normal)
            toggle = true
        }
        else{
            togglebutton.setImage(toggleoff, forState: .Normal)
            toggle = false

        }
        
      //  toggle = false
    }
    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
        
        popupviewvodka.hidden = false
        // popupview.hidden = true
    }
    
    @IBAction func sharetofacebookVodka(sender: AnyObject)
    {
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant  through the BottomzUp App")
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    func numberOfSectionsInTableView(tableview: UITableView) -> Int
    {
        
        return header1.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if header1[section].bool1 == true
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

        
        let cells = tableView.dequeueReusableCellWithIdentifier("vodkaChildCell", forIndexPath: indexPath) as! VodkaRowCell
        cells.liquors = [liqvodka]()
        cells.liquors = header1[indexPath.section].vodkaarray
        cells.press2reveal.tag = indexPath.section
        cells.directions.setTitle(header1[indexPath.section].distancevodka, forState: UIControlState.Normal)
        cells.tableView.reloadData()
        
        return cells
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.layer.borderColor = UIColor.brownColor().CGColor
        cell.layer.borderWidth = 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if (header1[indexPath.section].vodkaarray.count * 60) > 210 {
        
        return CGFloat(header1[indexPath.section].vodkaarray.count * 60)
        }
        else{
        
        return 210
            
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if header1[section].bool1 == false{
        return 85
        }
        else {
            return 60
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
     
        
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellvodka") as! custmheadercell1
      
            headerCell.backgroundColor = UIColor.whiteColor()
        
    
        headerCell.tag = section        
        headerCell.vodkarestaurantname.text = header1[section].restnamevodka
        headerCell.vodkaavgprice.text = "₹ " + header1[section].avgprice
        headerCell.happyhourslabelvodka.text = header1[section].vodkahappystart + "PM  - " + header1[section].vodkahappyend + "PM"
        //headerCell.vodkadistance.text = header1[section].distancevodka
        
        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped1)
        headerCell.userInteractionEnabled = true
        
        headerCell.mapbuttonvodkaclass.tag = section
        headerCell.mapbuttonvodkaclass.setTitle(header1[section].distancevodka, forState: UIControlState.Normal)
        
        headerCell.availofferbutton.tag = section
        
        headerCell.vodkarestaurantname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.vodkaavgprice.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.mapbuttonvodkaclass.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        
        
        if pricebuttonclicked == true
        {
             headerCell.vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
        if distancevodkabuttonclicked == true
        {
            headerCell.mapbuttonvodkaclass.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
//        let happyhoursimage = UIImage(named: "Happyhoursround image")
//        let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: headerCell.happyhourslabelvodka.frame.size.width, height: headerCell.happyhourslabelvodka.frame.size.height))
//        myImageView.image = happyhoursimage
//        
//        headerCell.happyhourslabelvodka.addSubview(myImageView)
        headerCell.happyhourslabelvodka.layer.cornerRadius = 10
        headerCell.happyhourslabelvodka.layer.borderColor = UIColor.greenColor().CGColor
        headerCell.happyhourslabelvodka.layer.borderWidth = 1
        //Code to remove empty cells in UITableview
//        var tblView =  UIView(frame: CGRectZero)
//        tableView.tableFooterView = tblView
//        tableView.tableFooterView!.hidden = true
//        tableView.backgroundColor = UIColor.clearColor()
        
        if header1[section].bool1 == false
        {
            // headerCell.headercellname.hidden = false
            headerCell.vodkaavgprice.hidden = false
            headerCell.vodkaavgprice.hidden = false
            headerCell.mapbuttonvodkaclass.hidden = false
//            headerCell.availofferbuttonbeer.hidden = false
//            headerCell.happyhourslabelbeer.hidden = false
            headerCell.arrowimage.image = UIImage(named: "arrow")
           //  headerCell.vodkarestaurantname.hidden = true
            
           
            
        }
            
        else
        {
            // headerCell.headercellname.hidden = true
            headerCell.vodkaavgprice.text = ""
            headerCell.vodkaavgprice.text = ""
            headerCell.mapbuttonvodkaclass.setTitle("", forState: UIControlState.Normal)
             headerCell.happyhourslabelvodka.hidden = true
            headerCell.arrowimage.hidden = true
            headerCell.happyhourslabelvodka.hidden = true
            headerCell.availofferbutton.hidden = true
            // headerCell.layer.borderColor = UIColor.clearColor()
            headerCell.childvodkarestaurantname.text = header1[section].restnamevodka
            let happyhoursimage = UIImage(named: "Restauranttab")
            let myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width:headerCell.childvodkarestaurantname.frame.width,height: headerCell.childvodkarestaurantname.frame.height))
            headerCell.vodkaresturantnameimage.image = happyhoursimage
            headerCell.childvodkarestaurantname.addSubview(myImageView)
            headerCell.vodkarestaurantname.hidden = true

            
        }

        
        
        return headerCell
    }
    
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        println("Section: \(gestureRecognizer.view!.tag)")
        if header1[gestureRecognizer.view!.tag].bool1 == false
        {
            header1[gestureRecognizer.view!.tag].bool1 = true
        }
        else
        {
            header1[gestureRecognizer.view!.tag].bool1 = false
        }
        self.tableview1.reloadData()
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
//        view.layer.borderColor = UIColor.brownColor().CGColor
//        view.layer.borderWidth = 1
    }
    

    
    @IBAction func lookfurtherforvodka(sender: AnyObject)
    {
        
            getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=28.63875&long=77.07380&km=8&records=4&query=\(liqvodkaname)")

    }
    
        func getbardatafurtherforvodka(urlString:String)
        {
            let url = NSURL(string: urlString)
            
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.extract_jsonfurhterforvodka(data)
                })
                
            }
            task.resume()
        }
    func extract_jsonfurhterforvodka(data:NSData)
    {
        var jsonError:NSError?
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            header1 = [Restauarantvodka]()
            
            for var index = 0; index < json.count; ++index
            {
                getvodkaobj = Restauarantvodka()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let avg_price = bottomsUp1["avg_price"] as? Int
                    {
                        var avg_PRICE:String = toString(avg_price)
                        getvodkaobj.avgprice = avg_PRICE
                    }
                    
                    if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                    {
                        getvodkaobj.vodkahappystart = happy_hour_start
                    }
                    
                    if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                    {
                        getvodkaobj.vodkahappyend = happy_hour_end
                    }
                    
                    if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                    {
                        getvodkaobj.vodkaishappy = is_happy_hour
                    }

                    
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            getvodkaobj.restnamevodka = res_name
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalatitude = string.doubleValue
                           // println(restvodkalat)
                            
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalongitude = string.doubleValue
                            println(getvodkalongitude)
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                            var newLocation: CLLocation = CLLocation(latitude: getvodkalatitude, longitude: getvodkalongitude)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                            println(String(format: "%.2f KM", totalDistance))
                            NSLog("totalDistance: %@", String(format: "%.2f KM", totalDistance))
                            var totalDistance1 = totalDistance.description
                            println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                            totalDistance1 = PartOfString(totalDistance1, 1, 3)
                            getvodkaobj.distancevodka = totalDistance1 + " KMS"
                        }
                    }
                    if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                    {
                        for var i = 0; i < resLiqInfo.count; ++i
                        {
                            var liqobj2 = liqvodka()
                            if let one = resLiqInfo[i] as? NSDictionary
                            {
                                if let res_liq_brand_price = one["res_liq_brand_price"] as? String
                                {
                                    liqobj2.liqbrandprice = res_liq_brand_price
                                }
                                
                                if let res_liq_brand_name = one["liq_brand_name"] as? String
                                {
                                    liqobj2.liqnamebrandname = res_liq_brand_name
                                }
                            }
                            getvodkaobj.vodkaarray.append(liqobj2)
                        }
                    }
       
                }
                header1.append(getvodkaobj)
                
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableview1.reloadData()
    }
//    @IBAction func getdirections(sender: AnyObject)
//    {
//       
//        
//        UIApplication.sharedApplication().canOpenURL(NSURL(string: "comgooglemaps://")!)
//        
//        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
//            UIApplication.sharedApplication().openURL(NSURL(string:
//                "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")!)
//            
//        }
//        else
//        {
//            NSLog("Can't use comgooglemaps://");
//        }
//    }
//    
    
    @IBAction func pricesort(sender: AnyObject)
    {
        
        pricebuttonclicked = true
        distancevodkabuttonclicked = false
        
        if pricebuttonclicked == true
        {
            pricebutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            distancebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
        
        }
      
            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
            {
                var sorted = false
                while sorted == false
                {
                    sorted = true
                    if cards.count > 1
                    {
                    for i in 0...cards.count - 2
                    {
                        if cards[i].avgprice < cards[i+1].avgprice
                        {
                            sorted = false
                            var first = cards[i]
                            var second = cards[i + 1]
                            println("first object before \(first.avgprice)")
                            println("second object before\(second.avgprice)")
                            cards[i] = second
                            cards[i + 1] = first
                            println("first object after\(cards[i].avgprice)")
                            println("second object after\(cards[i + 1].avgprice)")
                        }
                    }
                    }
                    else
                    {
                        
                    }
                }
                return cards
            }
            var sortedarray:[Restauarantvodka] = sortCards(&header1)
            header1 = sortedarray
            self.tableview1.reloadData()
            println("sorted array is  : \(header1)")
        
        
//        else
//        {
//            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].avgprice < cards[i+1].avgprice
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.avgprice)")
//                            println("second object before\(second.avgprice)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].avgprice)")
//                            println("second object after\(cards[i + 1].avgprice)")
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
//            var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//            header1 = sortedarray1
//            self.tableview1.reloadData()
//            println("sorted array is  : \(header1)")
//            doubleTap = true
//        }

        
    }
    
    
    @IBAction func distancesort(sender: AnyObject)
    {
        
//        pricebuttonclicked = false
//        distancevodkabuttonclicked = true
//        
//
//
//        if distancevodkabuttonclicked == true
//        {
//            pricebutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
//            distancebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
//            
//        }
//        
//        
//      
////            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
////            {
////                var sorted = false
////                while sorted == false
////                {
////                    sorted = true
////                    if cards.count > 1
////                    {
////                    for i in 0...cards.count - 2
////                    {
////                        if cards[i].distancevodka > cards[i+1].distancevodka
////                        {
////                            sorted = false
////                            var first = cards[i]
////                            var second = cards[i + 1]
////                            println("first object before \(first.distancevodka)")
////                            println("second object before\(second.distancevodka)")
////                            cards[i] = second
////                            cards[i + 1] = first
////                            println("first object after\(cards[i].distancevodka)")
////                            println("second object after\(cards[i + 1].distancevodka)")
////                        }
////                    }
////                    }
////                    else
////                    {
////                        
////                    }
////                }
////                return cards
////            }
//            //var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//           // header1 = sortedarray1
//            self.tableview1.reloadData()
//     
//            println("sorted array is  : \(header1)")
//     
        
//        else
//        {
//            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].distancevodka < cards[i+1].distancevodka
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.distancevodka)")
//                            println("second object before\(second.distancevodka)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].distancevodka)")
//                            println("second object after\(cards[i + 1].distancevodka)")
//                        }
//                    }
//                    }
//                }
//                return cards
//            }
//            var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//            header1 = sortedarray1
//            self.tableview1.reloadData()
//            println("sorted array is  : \(header1)")
//            doubleTap = true
//        }
//        

        
        
    }
    
    
    @IBAction func gotoMap(sender: AnyObject)
    {
         UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(header1[sender.tag].Restaurantlatitudevodka),\(header1[sender.tag].Restaurantlongitudevodka)")!)
    }
    
    @IBAction func getDiscountforvodka(sender: AnyObject)
    {
        popupviewvodka.hidden = false
        takerestaurantname.text = "I just got a 10 % discount at "
        takerestaurantname1.text = "\(header1[sender.tag].restnamevodka) Through Bottomz Up"
        
    }
    
}

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

