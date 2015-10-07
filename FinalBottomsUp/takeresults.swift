//
//  takeresults.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit




class takeresults: UIViewController,UITableViewDelegate, UITableViewDataSource
{
    
   
    @IBOutlet weak var teamview: UITableView!
    
   // var Hotelnames = [String]()
     var repositories = [String]()
    
    //var Hotelnames = ["vinayak"]
   // var Distance = ["vinayak"]
    
   
    

    override func viewDidLoad()
    {
        
       teamview.dataSource = self
       teamview.delegate = self
       getbardata("http://demos.dignitasdigital.com/bottomzup/nearby.php?lat=28.6376279&long=77.0696547&km=5&records=4")
        
//        let reposURL = NSURL(string: "https://api.github.com/search/repositories?q=learn+swift+language:swift&sort=stars&order=desc")
//        // 2
//        if let JSONData = NSData(contentsOfURL: reposURL!) {
//            // 3
//            if let json = NSJSONSerialization.JSONObjectWithData(JSONData, options: nil, error: nil) as? NSDictionary {
//                // 4
//                if let reposArray = json["items"] as? [NSDictionary] {
//                    // 5
//                    for item in reposArray {
//                        repositories.append(Repository(json: item))
//                    }
//                }
//            }
//        }
//    }
    
    
    }
    
    
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return repositories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = repositories[indexPath.row]
        return cell
    }

    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return Hotelnames.count
//    }
//  
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//
//        
//       return Hotelnames.count
//    }
//
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        
//       let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell") as UITableViewCell
//        
//        var v = Hotelnames[indexPath.row]
//        cell.textLabel?.text = v
//        
//        
//        return cell
//
//    
//    }
    
    
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        
//        let autoCompleteRowIdentifier = "mycell"
//        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as? UITableViewCell
//        if let tempo1 = cell
//        {
//            
//            let index = indexPath.row as Int
//            cell!.textLabel!.text = Hotelnames[index]
//            return cell!
//        }
//            
//        else
//        {
//            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
//        }
//        return cell!
//    }

    
    
    func getbardata(urlString:String)
    {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            if (error == nil)
            {
               // println(NSString(data: data!, encoding: NSUTF8StringEncoding)!)
               self.setLabels(data)
            }
        }
    }


    func setLabels(weatherData: NSData)
    {
        var jsonError:NSError?
        let json = NSJSONSerialization.JSONObjectWithData(weatherData, options: nil, error: &jsonError) as! NSArray
        
        for var index = 0; index < json.count; ++index
        {
            if let bottomsUp1 = json[index] as? NSDictionary
            {
                if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                {
                  if let res_name = resInfo["res_name"] as? String
                  {
                    println(res_name)
                    repositories.append(res_name)
                    println(repositories)
                    
                    
                    }
                    
                    if let distance = resInfo["distance"] as? String
                    {
                        println(distance)
                        repositories.append(distance)
                    }
                }
                
                
                if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                
                {
                    for var i = 0; i < resLiqInfo.count; ++i
                    {
                        if let one = resLiqInfo[i] as? NSDictionary
                        {
                            if let res_liq_brand_price = one["res_liq_brand_price"] as? String
                            {
                                println(res_liq_brand_price)
                                repositories.append(res_liq_brand_price)
                            }
                        }
                    }
                }             
                
            }
        }
    }

}




    
    
    

