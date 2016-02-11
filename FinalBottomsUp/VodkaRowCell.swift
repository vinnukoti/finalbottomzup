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
    
    @IBOutlet weak var distancenewvodkalabel: UILabel!
    @IBOutlet weak var arrowup: UIButton!
    
    @IBOutlet weak var Hotelname: UILabel!
    
    @IBOutlet weak var address: UILabel!
    
    @IBOutlet weak var happyhours: UILabel!

    @IBOutlet weak var happyhourstiming: UILabel!
    
    @IBOutlet weak var locationicon: UIButton!
    
    
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
        tableView.userInteractionEnabled = false
        
        let cell = tableView.dequeueReusableCellWithIdentifier("liquorRowChild", forIndexPath: indexPath) as! UITableViewCell
        cell.backgroundColor = UIColor(red: 233/255.0, green: 210/255.0, blue: 165/255.0, alpha: 1.0)
         self.tableView.backgroundColor = UIColor(red: 233/255.0, green: 210/255.0, blue: 165/255.0, alpha: 1.0)
        
        var liqname = cell.viewWithTag(100) as! UILabel
        var price = cell.viewWithTag(200) as! UILabel
        
        
        if liquors.count > 0 {
            
            liqname.text = liquors[indexPath.row].liqnamebrandname
            price.text = liquors[indexPath.row].liqbrandprice
            
            price.font = UIFont(name: "MyriadPro-Regular", size: fontsizenew)
            
            liqname.font = UIFont(name: "MyriadPro-Regular", size: fontsizenew)

            
        }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 16
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return liquors.count
    }

}
