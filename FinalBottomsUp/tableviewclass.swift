//
//  tableviewclass.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class tableviewclass: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableview: UITableView!
    var liqname:String!
    var head:[Restaurant] = [Restaurant]()
    var appsriv:[Restaurant] = [Restaurant]()
    var fstobj = Restaurant()
    var latitude:Double!
    var longitude:Double!
    
    override func viewDidLoad()
    {
        super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        println(latitude)
        println(longitude)
        println(head)

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
     
        return head.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return head[section].amp.count
        
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {

        let cell = tableView.dequeueReusableCellWithIdentifier("childcellnew", forIndexPath: indexPath) as! onemoreclass1
        cell.liqname.text = head[indexPath.section].amp[indexPath.row].liqbrand
        cell.micprice.text = head[indexPath.section].amp[indexPath.row].pint
        cell.maxprice.text = head[indexPath.section].amp[indexPath.row].Bottle
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
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        headerCell.backgroundColor = UIColor.cyanColor()
        
        headerCell.headercellname.text = head[section].restname
        headerCell.headercellmin.text = head[section].minp
        headerCell.headercellmax.text = head[section].maxp
        headerCell.headercelldist.text = head[section].distance
        return headerCell
    }
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        view.layer.borderColor = UIColor.brownColor().CGColor
        view.layer.borderWidth = 1
    }

    @IBAction func lookfurther(sender: AnyObject)
    {
         println("latitude is \(lat)")
         println("longitude is\(long)")
        if trim == true
        {
        getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(lat)&long=\(long)&km=8&records=4&query=\(trimmedString)")
            trim = false
        }
        else
        {
            getbardatafurther("http://demos.dignitasdigital.com/bottomzup/nearby.php?lat=28.63875&long=77.07380&km=8&records=8")
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
                        
                        if var distance = resInfo["distance"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(distance, 1, 2))
                            distance = PartOfString(distance, 1, 2)
                            fstobj1.distance = distance + "KMS"
                            
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
            println("vinayak count\( appsriv.count)")
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
        
    }
}













































