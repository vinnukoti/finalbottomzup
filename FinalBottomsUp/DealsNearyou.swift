//
//  DealsNearyou.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 24/12/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class DealsNearyou: UIViewController,UITableViewDataSource, UITableViewDelegate

{
    
    var SectionHeader:[Dealsnearyouclass] = [Dealsnearyouclass]()
    
    @IBOutlet weak var tableviewdealsnearyou: UITableView!
    
   var obj = Dealsnearyouclass()
    var obj1 = Dealsnearyouclass()
    var obj2 = Dealsnearyouclass()
    var obj3 = Dealsnearyouclass()
    var obj4 = Dealsnearyouclass()
    var obj5 = Dealsnearyouclass()
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableviewdealsnearyou.delegate = self
        tableviewdealsnearyou.dataSource = self
        obj.bool = false
        obj.hotelName = "Vinayak"
        obj.address = "Rajori Garden"
        obj.otherThing = "2 Beers + 2 Pizza"
        SectionHeader.append(obj)
        obj1.bool = false
        obj1.hotelName = "Vinayak"
        obj3.address = "Rajori Garden"
        obj4.otherThing = "2 Beers + 2 Pizza"
        SectionHeader.append(obj1)
        obj2.bool = false
        obj2.hotelName = "Vinayak"
        obj2.address = "Rajori Garden"
        obj2.otherThing = "2 Beers + 2 Pizza"
        SectionHeader.append(obj2)
        obj3.bool = false
        obj3.hotelName = "Vinayak"
        obj3.address = "Rajori Garden"
        obj3.otherThing = "2 Beers + 2 Pizza"
        SectionHeader.append(obj3)
        obj4.bool = false
        obj4.hotelName = "Vinayak"
        obj4.address = "Rajori Garden"
        obj4.otherThing = "2 Beers + 2 Pizza"
        SectionHeader.append(obj4)
        obj5.bool = false
        obj5.hotelName = "Vinayak"
        obj5.address = "Rajori Garden"
        obj5.otherThing = "2 Beers + 2 Pizza"
         SectionHeader.append(obj5)
        
        print(SectionHeader.count)


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }
    
    
    // Number of sections for tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        
        return 6
    }
    
    
    // Number of Rows in sections for tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    
        if SectionHeader[section].bool == true
        {
            return 1
            
        }
        
        else
        {
            return 0
        }
 
    }
    
    // Childcell for tableview
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
       
         let cell = tableView.dequeueReusableCellWithIdentifier("childcellforDealsnearyou", forIndexPath: indexPath) as! childcellfordealsnearyou
        
        cell.HotelName.text = "Mela"
        cell.address.text = "Rajori Garden"
        
        cell.arrowupbutton.tag = indexPath.section

        
        
        
        

       // cell.textLabel?.text = "Vinayak"
        return cell
    }
    
    
    // Height for child of a tableview
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
    }
    
    
    //Section header for tableview as a View
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        var  sectionheaderCellforDealsnearyou = tableView.dequeueReusableCellWithIdentifier("SectionheaderforDealsNearyou") as! sectionheaderforDelasnearyouTableViewCell
        
//        if SectionHeader[section].bool == true
//        {
//            sectionheaderCellforDealsnearyou.hidden = true
//        }
        
        sectionheaderCellforDealsnearyou.Hotelname.text = "Veggies"
        sectionheaderCellforDealsnearyou.address.text = "Rajori Garden"
        sectionheaderCellforDealsnearyou.otherthing.text = "A Bucket of 4 Kingfisher"
        sectionheaderCellforDealsnearyou.Numbers.text = "+2"
       // var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
      // headerTapped.view!.tag = section
      //  sectionheaderCellforDealsnearyou.userInteractionEnabled = true
      //////  sectionheaderCellforDealsnearyou.addGestureRecognizer(headerTapped)
       //headerTapped.view!.tag = section
        //sectionheaderCellforDealsnearyou.tag = section
        //sectionheaderCellforDealsnearyou.userInteractionEnabled = true
        
        let tapGestureRecognizer1 = UITapGestureRecognizer(target:self, action:Selector("Tapped:"))
        sectionheaderCellforDealsnearyou.imagefortaprecognizer.userInteractionEnabled = true
        sectionheaderCellforDealsnearyou.imagefortaprecognizer.addGestureRecognizer(tapGestureRecognizer1)
        tapGestureRecognizer1.view!.tag = section
//
        
        
//        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "Tapped:")
//        sectionheaderCellforDealsnearyou.imagefortaprecognizer.addGestureRecognizer(headerTapped)
//        sectionheaderCellforDealsnearyou.imagefortaprecognizer.tag = section
//        sectionheaderCellforDealsnearyou.imagefortaprecognizer.userInteractionEnabled = true
        
        
        
        return sectionheaderCellforDealsnearyou
    }
    
    
    func Tapped(img: AnyObject)
    {
        
       var section = img.view!!.tag
        println(img.view!!.tag)
        
        if SectionHeader[section].bool == false
        {
            SectionHeader[section].bool = true
        }
        
        else
        {
            SectionHeader[section].bool = false
        }
        
        
        self.tableviewdealsnearyou.reloadData()
        
    }
    
    
    
    //Hides Status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
//    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
//    {
//        var section = gestureRecognizer.view!.tag
//        println(section)
//        println("Section: \(gestureRecognizer.view!.tag)")
//        
//        if SectionHeader[section].bool == false
//        {
//            SectionHeader[section].bool = true
//            
//        }
//        else
//        {
//            SectionHeader[section].bool = false
//        }
//
//       self.tableviewdealsnearyou.reloadData()
//        
//    }
    
    // Height for section header
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if SectionHeader[section].bool == true
        {
            return 0
        }
        else
        {
            return 87
        }
        
    }
    
    
    
    // Function to collide cell when child cell is clicked
    @IBAction func arrowupbutton(sender: UIButton)
    {
        if SectionHeader[sender.tag].bool == true
        {
            SectionHeader[sender.tag].bool = false
        }
        self.tableviewdealsnearyou.reloadData()
        
    }
    


 
    @IBAction func backbutton(sender: UIButton)
    
    {
        
        performSegueWithIdentifier("back", sender: self)
    }

}
