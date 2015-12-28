//
//  childcellfordealsnearyou.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 28/12/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class childcellfordealsnearyou: UITableViewCell,UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var HotelName: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var subtableviewforDealsnearyou: UITableView!
    @IBOutlet weak var arrowupbutton: UIButton!
    
 

    override func awakeFromNib()
    {
        super.awakeFromNib()
        subtableviewforDealsnearyou.delegate = self
        subtableviewforDealsnearyou.dataSource = self
        subtableviewforDealsnearyou.tableFooterView = UIView()
    }

    override func setSelected(selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RowsinDelasnearyou", forIndexPath: indexPath) as! UITableViewCell
        
     
        cell.backgroundColor = UIColor(red: 233/255.0, green: 210/255.0, blue: 165/255.0, alpha: 1.0)
        subtableviewforDealsnearyou.backgroundColor = UIColor(red: 233/255.0, green: 210/255.0, blue: 165/255.0, alpha: 1.0)
        
        
       var other = cell.viewWithTag(100) as! UILabel
       var price = cell.viewWithTag(200) as! UILabel
        
        other.text = "10 Shots of Vodka/ 100 Piper Whiskey + Pizza"
        price.text = "999"

        
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 16
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    

}
