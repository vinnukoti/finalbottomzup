//
//  mapview.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 06/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit




class mapview: UIViewController,UITableViewDataSource,UITableViewDelegate
{
    @IBOutlet weak var tableviewformap: UITableView!

    var wineandbar:[mapdata] = [mapdata]()
    var wineandbarobj = mapdata()
    
   

    override func viewDidLoad()
    {
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "3rdpage"), forBarMetrics: UIBarMetrics.Default)
        self.tableviewformap.delegate = self
        self.tableviewformap.dataSource = self
        getnaerbybar("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=28.6345345&long=77.0749759&km=5&records=5")
        

        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return wineandbar.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("wineandbar", forIndexPath: indexPath) as! maplable
        cell.name.text = wineandbar[indexPath.row].mapliqname
        cell.distance.text = wineandbar[indexPath.row].mapliqdistance
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
                                println("******************\(wineandbarobj.mapliqname)")
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(distance, 1, 4))
                                distance = PartOfString(distance, 1, 4)
                                wineandbarobj.mapliqdistance = distance + " KMS"
                            }
                        }
                    }
                wineandbar.append(wineandbarobj)
                println(wineandbar.count)
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
        getfurtherdataforwineandbeer("http://demos.dignitasdigital.com/bottomzup/searchwb.php?lat=28.6345345&long=77.0749759&km=8&records=5")
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
            wineandbar = [mapdata]()
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
                            println("******************\(wineandbarobj.mapliqname)")
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(distance, 1, 4))
                            distance = PartOfString(distance, 1, 4)
                            wineandbarobj.mapliqdistance = distance + " KMS"
                        }
                    }
                }
                wineandbar.append(wineandbarobj)
                println(wineandbar.count)
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

    
}
