//
//  BeerRowCell.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 13/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class BeerRowCell: UITableViewCell, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var press2reveal: UIButton!
    
    @IBOutlet weak var directions: UIButton!
    
    @IBOutlet weak var address1: UILabel!
    
    @IBOutlet weak var address2: UILabel!
    
    @IBOutlet weak var distancelabelnew: UILabel!
    
    var beers: [liqclass] = [liqclass]()
    
    var restaurantName: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("beerRowChild", forIndexPath: indexPath) as! UITableViewCell
        
        var liqname = cell.viewWithTag(100) as! UILabel
        var minprice = cell.viewWithTag(200) as! UILabel
        var maxprice = cell.viewWithTag(300) as! UILabel
        //var newdistance = cell.viewWithTag(400) as! UILabel
        
        if beers.count > 0 {
        
        liqname.text = beers[indexPath.row].liqbrand
        minprice.text =  "₹ " + beers[indexPath.row].pint
        maxprice.text = "₹ " + beers[indexPath.row].Bottle
            //newdistance.text = beers[indexPath.row].distancel
        minprice.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        maxprice.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        liqname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        
      }
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return beers.count
    }

}
