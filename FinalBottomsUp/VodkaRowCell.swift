//
//  VodkaRowCell.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 13/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class VodkaRowCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var press2reveal: UIButton!
    
    
    @IBOutlet weak var directions: UIButton!
    
    
    @IBOutlet weak var address1: UILabel!
    
    
    @IBOutlet weak var address2: UILabel!
    
    var liquors: [liqvodka] = [liqvodka]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("liquorRowChild", forIndexPath: indexPath) as! UITableViewCell
        
        var liqname = cell.viewWithTag(100) as! UILabel
        var price = cell.viewWithTag(200) as! UILabel
        
        
        if liquors.count > 0 {
            
            liqname.text = liquors[indexPath.row].liqnamebrandname
            price.text =  "₹ " + liquors[indexPath.row].liqbrandprice
            
            price.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
            
            liqname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)

            
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60   
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return liquors.count
    }

}
