//
//  mapview.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 06/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation


class mapview: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var tableviewformap: UITableView!
     var doubleTapmapview = true
    
    let bottlecheckedImage = UIImage(named: "bottleenabled")
    let bottleunCheckedImage = UIImage(named: "bottle")
   

    var wineandbararray:[mapdata] = [mapdata]()
    var wineandbarobj = mapdata()
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var bool = true
    
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    
    var getrestlastmapview:Double!
    var getrestlongitmapview:Double!
    var res_lat1:Double!
    var res_long1:Double!
    
    var res_furtherlat:Double!
    var res_furtherlong:Double!
    var distnacemapsort = false
    var citylat:Double!
    var citylong:Double!
    var text:String!
    var locate:String!
    var newlocate:String!
    var lookfurtheboolean = false
    var locatiopopupview = UIView()
    let closelocationpopupbutton7kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let imagewi2kmrhradius = UIImage(named: "LookFurthe2kmrwithradius") as UIImage?
    let imagewi5kmrhradius = UIImage(named: "Lookfurther5withradius") as UIImage?
    let imagewi7kmrhradius = UIImage(named: "lookfurther7withradius") as UIImage?
    
    let imageName5 = UIImage(named: "lookfurther5") as UIImage?
    let imageName7 = UIImage(named: "lookfurther7") as UIImage?
    let imageName2 = UIImage(named: "Lookfurther2") as UIImage?
    
     let closelocationpopupbutton5kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
      let closelocationpopupbutton2kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    var searchedLocality:String!
    var searchedLiq:String!
    var searchedaLiqType:String!
    var searchedsubLocality:String!


    @IBOutlet weak var lookfurtherdefault: UIButton!
    override func viewDidLoad()
    {
        
        tableviewformap.tableFooterView = UIView()

        self.tableviewformap.delegate = self
        self.tableviewformap.dataSource = self
        println(citylat)
        println(citylong)

        println(newlocate)
        var locate1 = newlocate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        println(locate1)
        getgoogledatawineandbeer("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
        
        
        
       // distancemap.setTitle("DISTANCE", forState: .Normal)
    }
    
    
        func getgoogledatawineandbeer(urlString:String)
        {
            let url = NSURL(string: urlString)
            println(urlString)
    
    
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
    
                dispatch_async(dispatch_get_main_queue(),
                    {
    
                        self.extract_googlejsonwineandbeer(data)
                })
            }
            task.resume()
        }
    
    
        func extract_googlejsonwineandbeer(data:NSData)
        {
            var jsonError:NSError?
            if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary
            {
                if let results = json["results"] as? NSArray
                {
                    for var i = 0; i < results.count; i++
                    {
                        if let one = results[i] as? NSDictionary
                        {
                            if let geometry = one["geometry"] as? NSDictionary
                            {
                                // for var j = 0; j < geometry.count; j++
                                //  {
                                if let location = geometry["location"] as? NSDictionary
                                {
    
                                    if let lat = location["lat"] as? Double
                                    {
                                        citylat = lat
                                        println(citylat)
                                    }
                                    if let lng = location["lng"] as? Double
                                    {
                                        citylong = lng
                                        println(citylong)
                                    }
                                    
    
                                    // }
                                }
                            }
                        }
                    }
                    ApiCall()
                    
                }
                
            }
        }
    
    
    func ApiCall()
    {
        
        getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=2&records=10")
        
    }
    
    
    
    // Hides Status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return wineandbararray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 69
    }
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("wineandbar", forIndexPath: indexPath) as! maplable
        cell.name.text = wineandbararray[indexPath.row].mapliqname
        cell.name.font = UIFont(name: "MyriadPro-Regular", size: 11.0)
        cell.distance.font = UIFont(name: "MyriadPro-Regular", size: 11.0)
        cell.distance.text = wineandbararray[indexPath.row].mapliqdistance
//        if distnacemapsort == true
//        {
//        cell.distance.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
//        }
//        var tblView =  UIView(frame: CGRectZero)
//        tableView.tableFooterView = tblView
//        tableView.tableFooterView!.hidden = true
//        tableView.backgroundColor = UIColor.clearColor()
        cell.gotomap.tag = indexPath.row
        
        return cell
    }
    func getnaerbybar(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_jsongetnaerbybar(data)
            })
        }
        task.resume()
    }
    func extract_jsongetnaerbybar(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            for var index = 0; index < json.count; ++index
            {
                wineandbarobj = mapdata()
                if let bottomsUp1 = json[index] as? NSDictionary
                {
        
                        if let resInfo = bottomsUp1["shopInfo"] as? NSDictionary
                        {
                            if let res_name = resInfo["res_name"] as? String
                            {
                               wineandbarobj.mapliqname = res_name
                              //  println("******************\(wineandbarobj.mapliqname)")
                            }
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                //convert string to double
                                let string = NSString(string: res_lat)
                               res_lat1 = string.doubleValue
                                wineandbarobj.restlat = res_lat1
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let string = NSString(string: res_long)
                                res_long1 = string.doubleValue
                                wineandbarobj.restlong = res_long1
                            }
                            
                            if var distance = resInfo["distance"] as? String
                            {
                                var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                                var newLocation: CLLocation = CLLocation(latitude: res_lat1, longitude: res_long1)
                                var totalDistance: Double = 0
                                var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                                totalDistance = totalDistance + (meters / 1000)
                               // println(String(format: "%.2f KM", totalDistance))
                              //  NSLog("totalDistance: %@", String(format: "%.2f KM", totalDistance))
                                var totalDistance1 = totalDistance.description
                               // println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 4))
                                totalDistance1 = PartOfString(totalDistance1, 1, 4)
                                wineandbarobj.mapliqdistance = totalDistance1 + " KMS"
                            }
                        }
                    }
                wineandbararray.append(wineandbarobj)
                println(wineandbararray.count)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"No wine and beer shop in this area", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableviewformap.reloadData()
    }

    @IBAction func lookfurtherfoewineandbeer(sender: AnyObject)
    {
        getfurtherdataforwineandbeer("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=8&records=5")
    }
    
    func getfurtherdataforwineandbeer(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.extract_jsonfurhterforwineandbeer(data)
            })
            
        }
        task.resume()
    }
    
    func extract_jsonfurhterforwineandbeer(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            wineandbararray = [mapdata]()
            for var index = 0; index < json.count; ++index
            {
                wineandbarobj = mapdata()
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    
                    if let resInfo = bottomsUp1["shopInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            wineandbarobj.mapliqname = res_name
                           // println("******************\(wineandbarobj.mapliqname)")
                        }
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            //convert string to double
                            let string = NSString(string: res_lat)
                            res_furtherlat = string.doubleValue
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let string = NSString(string: res_long)
                            res_furtherlong = string.doubleValue
                        }
                        

                        if var distance = resInfo["distance"] as? String
                        {
                           // 28.63875
                           // 77.07380
                            var OldLocation: CLLocation = CLLocation(latitude: getcitylatitude, longitude: getcitylongitude)
                            var newLocation: CLLocation = CLLocation(latitude: res_furtherlat, longitude: res_furtherlong)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                           // println(String(format: "%.2f KM", totalDistance))
                            var totalDistance1 = totalDistance.description
                           // println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 4))
                            totalDistance1 = PartOfString(totalDistance1, 1, 4)
                            wineandbarobj.mapliqdistance = totalDistance1 + " KMS"
                        }
                    }
                }
                wineandbararray.append(wineandbarobj)
                println(wineandbararray.count)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableviewformap.reloadData()
    }
    
    
    @IBAction func distancesort(sender: AnyObject)
    
    {
//        distnacemapsort = true
//        
//        if distnacemapsort == true
//        {
//            distancemap.setBackgroundImage(bottlecheckedImage, forState: .Normal)
//        }
//    
////        func sortCards(inout elements: Array<mapdata>) -> Array<mapdata>
////        {
////            var sorted = false
////            while sorted == false
////            {
////                sorted = true
////                if elements.count > 1
////                {
////                for i in 0...elements.count - 2
////                {
////                    println(elements[i].mapliqdistance)
////                    println(elements[i+1].mapliqdistance)
////                    if elements[i].mapliqdistance > elements[i+1].mapliqdistance
////                    {
////                        sorted = false
////                        var first = elements[i]
////                        var second = elements[i + 1]
////                        println("first object before \(first.mapliqdistance)")
////                        println("second object before\(second.mapliqdistance)")
////                        elements[i] = second
////                        elements[i + 1] = first
////                        
////                        println("first object after\(elements[i].mapliqdistance)")
////                        println("second object after\(elements[i + 1].mapliqdistance)")
////                        
////                    }
////                }
////                }
////                else
////                {
////                    
////                }
////            }
////            return elements
////        }
////        var sortedarray:[mapdata] = sortCards(&wineandbararray)
////        wineandbararray = sortedarray
//        self.tableviewformap.reloadData()
//        println("sorted array is  : \(wineandbararray)")
//        doubleTapmapview = false
//        
//        else
//        {
//            func sortCards(inout elements: Array<mapdata>) -> Array<mapdata>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if elements.count > 1
//                    {
//                        for i in 0...elements.count - 2
//                        {
//                            println(elements[i].mapliqdistance)
//                            println(elements[i+1].mapliqdistance)
//                            if elements[i].mapliqdistance < elements[i+1].mapliqdistance
//                            {
//                                sorted = false
//                                var first = elements[i]
//                                var second = elements[i + 1]
//                                println("first object before \(first.mapliqdistance)")
//                                println("second object before\(second.mapliqdistance)")
//                                elements[i] = second
//                                elements[i + 1] = first
//                                
//                                println("first object after\(elements[i].mapliqdistance)")
//                                println("second object after\(elements[i + 1].mapliqdistance)")
//                                
//                            }
//                        }
//                    }
//                    else
//                    {
//                        
//                    }
//                }
//                return elements
//            }
//            var sortedarray:[mapdata] = sortCards(&wineandbararray)
//            wineandbararray = sortedarray
//            self.tableviewformap.reloadData()
//            println("sorted array is  : \(wineandbararray)")
//            doubleTapmapview = true
//
//        }
    }
    
    
//    @IBAction func gotomapvodka(sender: AnyObject)
//    {
//        
//         UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(getrestlastmapview),\(getrestlongitmapview)")!)
//        
//    }
    
    @IBAction func lookfurther(sender: UIButton, forEvent event: UIEvent)
    {
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        let buttonView = sender as UIView;
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            
            
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.locatiopopupview = UIView(frame: CGRectMake(p!.x - 38,p!.y - 270,75,230))
            
            if lookfurtheboolean == true
            {
                locatiopopupview.hidden = false
            }
            else
            {
                locatiopopupview.hidden = true
            }
            
            var tag = sender.tag
            
            switch (tag){
                
                //            case 1:
                //
                //                closelocationpopupbutton7kms.frame = CGRectMake(0,0,75,75)
                //                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton7kms.tag=7
                //                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                //
                //                closelocationpopupbutton5kms.frame = CGRectMake(0,75,75,75)
                //                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton5kms.tag=5
                //                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                //
                //                closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
                //                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton2kms.tag=2
                //                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                //
                //
                //                self.view.addSubview(locatiopopupview)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
                
            case 2:
                closelocationpopupbutton7kms.frame = CGRectMake(0,75,75,75)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,150,75,75)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                self.view.addSubview(locatiopopupview)
                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                // self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
                
                
            case 5:
                closelocationpopupbutton7kms.frame = CGRectMake(0,75,75,75)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                
                self.view.addSubview(locatiopopupview)
                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                //self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
            case 7:
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,75,75,75)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                self.view.addSubview(locatiopopupview)
                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)

                
            default: return
            }
            
            
        }
        
    }
    
    func lookfurtherfor2KMS(sender: UIButton)
    {
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
//        let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
//        selectedliqor = trimmedString1
        
        var tag = sender.tag
        
        switch(tag){
            
            
            
            
        case 2:
            //call 2km api
           // countfurther = 1
//            println(liqFromresult)
//            println(liqtypeFromresult)
            
    
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=2&records=10")
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
   
            
        case 5:
       
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=5&records=10")
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
         
            
        case 7:
      
      
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=7&records=10")
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
         
            
        default: return
            
        }
        
        
        self.locatiopopupview.hidden = true
        
    }
    
    
    func lookfurtherfor5KMS(sender: UIButton)
    {
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        
        var tag = sender.tag
        
        switch(tag){
        case 2:
            //call 2km api
     
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=2&records=10")
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
       
            
        case 5:
           
      
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=5&records=10")
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
     
            
        case 7:
   
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=7&records=10")
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
       
            
        default: return
            
        }
        
        
        self.locatiopopupview.hidden = true
    }
    
    func lookfurtherfor7KMS(sender: UIButton)
    {
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
 
        
        
        var tag = sender.tag
        
        switch(tag){
        case 2:
            //call 2km api
   
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=2&records=10")
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
       
            
        case 5:
      
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=5&records=10")
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
           
            
        case 7:
   
            getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(citylat)&long=\(citylong)&km=7&records=10")
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
         
            
        default: return
            
        }
        self.locatiopopupview.hidden = true
    }

    @IBAction func gotomap(sender: UIButton)
    {
        println(wineandbararray[sender.tag].restlat)
        println(wineandbararray[sender.tag].restlong)
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(wineandbararray[sender.tag].restlat),\(wineandbararray[sender.tag].restlong)")!)
    }
    
    @IBAction func backbutton(sender: UIButton)
    {
      //  performSegueWithIdentifier("backtopreviousview", sender: self)
        
        self.dismissViewControllerAnimated(true, completion: {});
        
       // navigationController!.popViewControllerAnimated(true)
    }

}



































