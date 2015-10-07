//
//  TableController.swift
//  uitableview_load_data_from_json


import UIKit

class TableController: UIViewController
{

    
    var TableData:Array< String > = Array < String >()
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData1("http://demos.dignitasdigital.com/bottomzup/nearby.php?lat=28.6376279&long=77.0696547&km=5&records=4")
    }
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return TableData.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("mycell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = TableData[indexPath.row]
        return cell
    }
    
    
    func getWeatherData1(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                
                
                self.extract_json(data)
                
            })
            
        }
        task.resume()
    }
    
    func extract_json(data:NSData)
    {
        var jsonError:NSError?
        let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSArray
        
        for var index = 0; index < json.count; ++index
        {
            if let bottomsUp1 = json[index] as? NSDictionary
            {
                if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                {
                    if let res_name = resInfo["res_name"] as? String
                    {
              
                        TableData.append(res_name)
                        
                    }
                    
                    if let distance = resInfo["distance"] as? String
                    {
                        TableData.append(distance)
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
                              TableData.append(res_liq_brand_price)
                            }
                        }
                    }
                }
                
            }
        }
        do_table_refresh();
    }
    
    
    
    func do_table_refresh()
    {
        dispatch_async(dispatch_get_main_queue(),
            {
           // self.tableView.reloadData()
            return
        })
    }

}
