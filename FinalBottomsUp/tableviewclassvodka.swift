//
//  tableviewclassvodka.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 08/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit





class tableviewclassvodka: UIViewController,UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var tableview1: UITableView!
    var header1:[Restauarantvodka] = [Restauarantvodka]()

    override func viewDidLoad()
    {
        super.viewDidLayoutSubviews()
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableview: UITableView) -> Int
    {
        
        return header1.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        return header1[section].vodkaarray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("childcellvodka", forIndexPath: indexPath) as! onemoreclass2
        cell.liqbrandname.text  = header1[indexPath.section].vodkaarray[indexPath.row].liqnamebrandname
        cell.liqbrandprice.text = header1[indexPath.section].vodkaarray[indexPath.row].liqbrandprice
      
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
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellvodka") as! custmheadercell1
        headerCell.backgroundColor = UIColor.cyanColor()

        
        headerCell.vodkarestaurantname.text = header1[section].restnamevodka
        headerCell.vodkaavgprice.text = header1[section].avgprice
        headerCell.vodkadistance.text = header1[section].distancevodka
        return headerCell
    }
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        view.layer.borderColor = UIColor.brownColor().CGColor
        view.layer.borderWidth = 1
    }
}
