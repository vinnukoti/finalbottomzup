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
    
    @IBOutlet weak var pintbutton: UIButton!
    var liqname:String!
    var head:[Restaurant] = [Restaurant]()
    var latitude:Double!
    var longitude:Double!
    
    //@IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad()
    {
        if Reachability.isConnectedToNetwork() == true
        {
            println("Internet connection OK")
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No internet Connection", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "3rdpage"), forBarMetrics: UIBarMetrics.Default)
       // self.navigationController?.navigationBar.backItem?.hidesBackButton = true
        //navBar.backgroundImageForBarMetrics(UIBarMetrics.Default)
        
        var backButton = UIBarButtonItem(title: "Home", style: .Plain, target: self, action: "goBack")
//        
//        navigationItem.rightBarButtonItem = backButton
//         navigationItem.leftBarButtonItem = nil
        
//        pintbutton.backgroundColor = UIColor.clearColor()
//        pintbutton.layer.cornerRadius = 115
//        pintbutton.layer.borderWidth = 1
//        pintbutton.layer.borderColor = UIColor.blackColor().CGColor
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
     
        return head.count
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
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        headerCell.tag = section
        headerCell.backgroundColor = UIColor.cyanColor()
        headerCell.headercellname.text = head[section].restname
        headerCell.headercellmin.text = head[section].minp
        headerCell.headercellmax.text = head[section].maxp
        headerCell.headercelldist.text = head[section].distance
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped)
        headerCell.userInteractionEnabled = true
        return headerCell
    }
    
    
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
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
        view.layer.borderColor = UIColor.brownColor().CGColor
        view.layer.borderWidth = 1
    }

    @IBAction func lookfurther(sender: AnyObject)
    {
         println("latitude is \(citylat)")
         println("longitude is\(citylong)")
        if trim == true
        {
        getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(citylat)&long=\(citylong)&km=8&records=4&query=\(liqname)")
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
        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant> {
            var sorted = false
            while sorted == false {
                sorted = true
                for i in 0...cards.count - 2 {
                    if cards[i].minp > cards[i+1].minp {
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
            return cards
        }
        var sortedarray:[Restaurant] = sortCards(&head)
        head = sortedarray
        self.tableview.reloadData()
        println("sorted array is  : \(head)")
    }
    
    @IBAction func bottolesort(sender: AnyObject)
        
    {
        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant> {
            var sorted = false
            while sorted == false {
                sorted = true
                for i in 0...cards.count - 2 {
                    if cards[i].maxp > cards[i+1].maxp {
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
            return cards
        }
        var sortedarray:[Restaurant] = sortCards(&head)
        head = sortedarray
        self.tableview.reloadData()
        println("sorted array is  : \(head)")
    }
    
    
    @IBAction func locationsort(sender: AnyObject)
    {
        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant> {
            var sorted = false
            while sorted == false {
                sorted = true
                for i in 0...cards.count - 2 {
                    if cards[i].distance > cards[i+1].distance {
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
            return cards
        }
        var sortedarray:[Restaurant] = sortCards(&head)
        head = sortedarray
        self.tableview.reloadData()
        println("sorted array is  : \(head)")
        
    }
    
    
    
    
    

}













































