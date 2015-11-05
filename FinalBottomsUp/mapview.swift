//
//  mapview.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 06/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation

var res_lat1:Double!
var res_long1:Double!

var res_furtherlat:Double!
var res_furtherlong:Double!

var distnacemapsort = false



class mapview: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var tableviewformap: UITableView!
     var doubleTapmapview = true
    
    let checkedImage = UIImage(named: "pint")
    let unCheckedImage = UIImage(named: "bottle")
   

    var wineandbararray:[mapdata] = [mapdata]()
    var wineandbarobj = mapdata()
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var bool = true
    
    var getcitylatitude:Double!
    var getcitylongitude:Double!
   
  
    @IBOutlet weak var distancemap: UIButton!

    @IBOutlet weak var distnacedisplaylable: UILabel!
    
    @IBOutlet weak var REsturantdisplaylable: UILabel!
    override func viewDidLoad()
    {
        distancemap.titleLabel!.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
        distancemap.setTitle("DISTANCE", forState: UIControlState.Normal)
        //distancemap.titleLabel?.text = "DISTANCE"
        distnacedisplaylable.hidden = true
        distnacedisplaylable.font = UIFont(name: "HelveticaNeue-Bold", size: 11.0)
        REsturantdisplaylable.font = UIFont(name: "HelveticaNeue-Bold", size: 15.0)
        distancemap.setBackgroundImage(unCheckedImage, forState: UIControlState.Normal)
        //distancemap.setImage(unCheckedImage, forState: .Normal)
        self.tableviewformap.delegate = self
        self.tableviewformap.dataSource = self
        getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=5")
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return wineandbararray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("wineandbar", forIndexPath: indexPath) as! maplable
        cell.name.text = wineandbararray[indexPath.row].mapliqname
        cell.name.font = UIFont(name: "HelveticaNeue", size: 11.0)
        cell.distance.font = UIFont(name: "HelveticaNeue", size: 11.0)
        cell.distance.text = wineandbararray[indexPath.row].mapliqdistance
        if distnacemapsort == true
        {
        cell.distance.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        var tblView =  UIView(frame: CGRectZero)
        tableView.tableFooterView = tblView
        tableView.tableFooterView!.hidden = true
        tableView.backgroundColor = UIColor.clearColor()
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
                                
                                
                              
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let string = NSString(string: res_long)
                                res_long1 = string.doubleValue
                            }
                            
                            if var distance = resInfo["distance"] as? String
                            {
                                var OldLocation: CLLocation = CLLocation(latitude: getcitylatitude, longitude: getcitylongitude)
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
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
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
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableviewformap.reloadData()
    }
    
    
    @IBAction func distancesort(sender: AnyObject)
    
    {
        distnacemapsort = true
        
        if distnacemapsort == true
        {
            distancemap.setBackgroundImage(checkedImage, forState: .Normal)
        }
    
    
        func sortCards(inout elements: Array<mapdata>) -> Array<mapdata>
        {
            var sorted = false
            while sorted == false
            {
                sorted = true
                if elements.count > 1
                {
                for i in 0...elements.count - 2
                {
                    println(elements[i].mapliqdistance)
                    println(elements[i+1].mapliqdistance)
                    if elements[i].mapliqdistance > elements[i+1].mapliqdistance
                    {
                        sorted = false
                        var first = elements[i]
                        var second = elements[i + 1]
                        println("first object before \(first.mapliqdistance)")
                        println("second object before\(second.mapliqdistance)")
                        elements[i] = second
                        elements[i + 1] = first
                        
                        println("first object after\(elements[i].mapliqdistance)")
                        println("second object after\(elements[i + 1].mapliqdistance)")
                        
                    }
                }
                }
                else
                {
                    
                }
            }
            return elements
        }
        var sortedarray:[mapdata] = sortCards(&wineandbararray)
        wineandbararray = sortedarray
        self.tableviewformap.reloadData()
        println("sorted array is  : \(wineandbararray)")
        doubleTapmapview = false
        
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
    
    
    @IBAction func gotomapvodka(sender: AnyObject)
    {
        
         UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(restlat),\(restlong)")!)
        
    }
    
}


































