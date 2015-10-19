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





class tableviewclassvodka: UIViewController,UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate
{
    @IBOutlet weak var tableview1: UITableView!
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var liqvodkaname:String!


    override func viewDidLoad()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "3rdpage"), forBarMetrics: UIBarMetrics.Default)
        super.viewDidLayoutSubviews()
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
        let image = UIImage(named: "3rdpage")
        navigationItem.titleView = UIImageView(image: image)
    }
    
    func numberOfSectionsInTableView(tableview: UITableView) -> Int
    {
        
        return header1.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if header1[section].bool1 == true
        {
        return header1[section].vodkaarray.count
        }
        else
        {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("childcellvodka", forIndexPath: indexPath) as! onemoreclass2
        cell.liqbrandname.text  = header1[indexPath.section].vodkaarray[indexPath.row].liqnamebrandname
        cell.liqbrandprice.text = header1[indexPath.section].vodkaarray[indexPath.row].liqbrandprice
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 30
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellvodka") as! custmheadercell1
        headerCell.backgroundColor = UIColor.cyanColor()
        headerCell.tag = section        
        headerCell.vodkarestaurantname.text = header1[section].restnamevodka
        headerCell.vodkaavgprice.text = header1[section].avgprice
        headerCell.vodkadistance.text = header1[section].distancevodka
        
        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped1)
        headerCell.userInteractionEnabled = true
        
        
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
        view.layer.borderColor = UIColor.brownColor().CGColor
        view.layer.borderWidth = 1
    }
    

    
    @IBAction func lookfurtherforvodka(sender: AnyObject)
    {

            getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(citylat)&long=\(citylong)&km=8&records=4&query=\(liqvodkaname)")

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
                vodkaobj = Restauarantvodka()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let avg_price = bottomsUp1["avg_price"] as? Int
                    {
                        var avg_PRICE:String = toString(avg_price)
                        vodkaobj.avgprice = avg_PRICE
                    }
                    
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            vodkaobj.restnamevodka = res_name
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restvodkalat = string.doubleValue
                            println(restvodkalat)
                            
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restvodkalang = string.doubleValue
                            println(restvodkalang)
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            var OldLocation: CLLocation = CLLocation(latitude: citylat, longitude: citylong)
                            var newLocation: CLLocation = CLLocation(latitude: restvodkalat, longitude: restvodkalang)
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
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 4))
                            totalDistance1 = PartOfString(totalDistance1, 1, 4)
                            vodkaobj.distancevodka = totalDistance1 + " KMS"
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
                            vodkaobj.vodkaarray.append(liqobj2)
                        }
                    }
       
                }
                header1.append(vodkaobj)
                
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

        
        
    @IBAction func getdirections(sender: AnyObject)
    {
       
        
        UIApplication.sharedApplication().canOpenURL(NSURL(string: "comgooglemaps://")!)
        
        if (UIApplication.sharedApplication().canOpenURL(NSURL(string:"comgooglemaps://")!)) {
            UIApplication.sharedApplication().openURL(NSURL(string:
                "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)&directionsmode=driving")!)
            
        }
        else
        {
            NSLog("Can't use comgooglemaps://");
        }
    }
    }

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

