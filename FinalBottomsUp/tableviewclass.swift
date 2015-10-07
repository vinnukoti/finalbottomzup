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
        println("Button clicked")
        
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
       // println("Trimmed string is" + trimmedString)
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
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSArray
        
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
                            println("swasthik restname name\(fstobj1.restname)")
                            
                        }
                        
                        if var distance = resInfo["distance"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(distance, 1, 2))
                            distance = PartOfString(distance, 1, 2)
                            fstobj1.distance = distance + "KMS "
                            
                        }
                    }
                    if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                    {
                        for var i = 0; i < resLiqInfo.count; ++i
                        {
                            var liqobj1 = liqclass()
                            if let one = resLiqInfo[i] as? NSDictionary
                            {
                                if let liq_name = one ["liq_name"] as? String
                                {
                                    liqobj1.liqname = liq_name
                                    
                                    println(liqobj1.liqname)
                                }
                                if let res_liq_brand_price = one["res_liq_brand_price"] as? String
                                {
                                    liqobj1.pint = res_liq_brand_price
                                    liqobj1.Bottle = res_liq_brand_price
                                    fstobj1.maxp = res_liq_brand_price + " RS"
                                    fstobj1.minp = res_liq_brand_price + " RS"
                                    println("========" + liqobj1.pint)
                                    println(" **********  \(fstobj1) ")
                                }
                                if let res_liq_brand_name = one["liq_brand_name"] as? String
                                {
                                    liqobj1.liqbrand = res_liq_brand_name
                                    println(liqobj1.liqbrand)
                                }
                            }
                            fstobj1.amp.append(liqobj1)
                            println("swasthik \(liqobj1)")
                        }
                    }
                    
                    println("swasthik \(fstobj1)")
                }
                head.append(fstobj1)
                println("Apprive \(fstobj1)")
                println("swasthik \(fstobj1)")
            }
            println("vinayak count\( appsriv.count)")
        
        self.tableview.reloadData()
    }
    
    
    @IBAction func pintsort(sender: AnyObject)
    {
        
    }
}













































