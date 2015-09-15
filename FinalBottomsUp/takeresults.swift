//
//  takeresults.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit




class takeresults: UIViewController
{
    
    @IBOutlet weak var tview: UITableView!
    
    var Hotelnames = [""]
    var Distance = [""]
    
   
    

    override func viewDidLoad()
    {
        
         getbardata("http://demos.dignitasdigital.com/bottomzup/nearby.php?lat=28.6376279&long=77.0696547&km=5&records=4")
        
        
//        arrayForBool = ["0","0","0"]
//        
//        sectionTitleArray = ["Pool A","Pool B","Pool C"]
//        
//        var tmp1 : NSArray = ["New Zealand","Australia","Bangladesh","Sri Lanka"]
//        var string1 = sectionTitleArray .objectAtIndex(0) as? String
//        [sectionContentDict .setValue(tmp1, forKey:string1! )]
//        
//        var tmp2 : NSArray = ["India","South Africa","UAE","Pakistan"]
//        string1 = sectionTitleArray .objectAtIndex(1) as? String
//        [sectionContentDict .setValue(tmp2, forKey:string1! )]
//        
//        
//        var tmp3 : NSArray = ["India","South Africa","UAE","Pakistan"]
//        string1 = sectionTitleArray .objectAtIndex(2) as? String
//        [sectionContentDict .setValue(tmp3, forKey:string1! )]
//
//        
//        
//        self.tview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//
//      
    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int
//    {
//        return Hotelnames.count
//    }
  
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        
//        if(arrayForBool .objectAtIndex(section).boolValue == true)
//        {
//            var tps = sectionTitleArray.objectAtIndex(section) as! String
//            var count1 = (sectionContentDict.valueForKey(tps)) as! NSArray
//            return count1.count
//        }
//        return 0;
//    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
//    {
//        return "ABC"
//    }
    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
//    {
//        
//        return 50
//    }
    
//    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
//    {
//        return 1
//    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        if(arrayForBool .objectAtIndex(indexPath.section).boolValue == true)
//        {
//            return 100
//        }
//        
//        return 3;
//    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
//    {
//        
//        let headerView = UIView(frame: CGRectMake(0, 0, tableView.frame.size.width, 40))
//        headerView.backgroundColor = UIColor.grayColor()
//        headerView.tag = section
//        
//        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
//        headerString.text = sectionTitleArray.objectAtIndex(section) as? String
//        headerView .addSubview(headerString)
//        
//        let headerTapped = UITapGestureRecognizer (target: self, action:"sectionHeaderTapped:")
//        headerView .addGestureRecognizer(headerTapped)
//        
//        return headerView
//    }
    
//    func sectionHeaderTapped(recognizer: UITapGestureRecognizer)
//    {
//        println("Tapping working")
//        println(recognizer.view?.tag)
//        
//        var indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection:(recognizer.view?.tag as Int!)!)
//        if (indexPath.row == 0) {
//            
//            var collapsed = arrayForBool .objectAtIndex(indexPath.section).boolValue
//            collapsed       = !collapsed;
//            
//            arrayForBool .replaceObjectAtIndex(indexPath.section, withObject: collapsed)
//            //reload specific section animated
//            var range = NSMakeRange(indexPath.section, 1)
//            var sectionToReload = NSIndexSet(indexesInRange: range)
//            self.tview.reloadSections(sectionToReload, withRowAnimation:UITableViewRowAnimation.Fade)
//        }
//        
//    }
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        
//        let CellIdentifier = "Cell"
//        var cell :UITableViewCell
//        cell = self.tview.dequeueReusableCellWithIdentifier(CellIdentifier) as! UITableViewCell
//        
//        var manyCells : Bool = arrayForBool .objectAtIndex(indexPath.section).boolValue
//        
//        if (!manyCells) {
//              //cell.textLabel?.text = "click to enlarge"
//        }
//        else
//        {
//            var content = sectionContentDict .valueForKey(sectionTitleArray.objectAtIndex(indexPath.section) as! String) as! NSArray
//            cell.textLabel?.text = content .objectAtIndex(indexPath.row) as? String
//            cell.backgroundColor = UIColor .greenColor()
//        }
//        
//        return cell
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
                    Hotelnames.append(res_name)
                    
                    }
                    
                    if let distance = resInfo["distance"] as? String
                    {
                        println(distance)
                        Distance.append(distance)
                    }
                }
            }
        }
    }
}

    

    
    
    

