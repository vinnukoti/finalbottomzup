//
//  tableviewclassvodka.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 08/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social
import FBSDKShareKit



class tableviewclassvodka: UIViewController,UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
    @IBOutlet weak var tableview1: UITableView!
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var vodkasort = [Restauarantvodka]()
    var headfurther:[Restauarantvodka] = [Restauarantvodka]()
    var head1:[Restaurant] = [Restaurant]()
    var headerfortableview:[Restauarantvodka] = [Restauarantvodka]()
    var liqvodkaname:String!
    var bool = false
    var getrestlatitudevodka:Double!
    var getrestlongitudevodka:Double!
    
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    var getselectedcityname:String!
    
    
    var getcitylatitufrombeerscreen:Double!
    var getcitylongitudefrombeerscreen:Double!
    
    
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var getvodkalatitude:Double!
    var getvodkalongitude:Double!
    var takegetselectedcitynale:String!
    
    let bottlecheckedImage = UIImage(named: "bottleenabled")
    let bottleunCheckedImage = UIImage(named: "bottle")
    
    let pintcheckedImage = UIImage(named: "pintenabled")
    let pintunCheckedImage = UIImage(named: "pint")
    
    @IBOutlet weak var popupviewvodka: UIView!

    @IBOutlet weak var distancebutton: UIButton!
    @IBOutlet weak var pricebutton: UIButton!

    @IBOutlet var mainviewvodka: UIView!
    
    var pricebuttonclicked = false
    var distancevodkabuttonclicked = false

    @IBOutlet weak var takerestaurantname: UILabel!
  //  @IBOutlet weak var takerestaurantname1: UILabel!
    
    let toggleoff = UIImage(named: "toggleoff")
    let toggleon = UIImage(named: "toggleon")

    
    @IBOutlet weak var togglebutton: UIButton!
    //var getselectedlq:String!
    
    var toggle = false
    
    var getvodkaobj = Restauarantvodka()
     var getvodkaobj1 = Restauarantvodka()
    
    var changecolorvodka = false
    
    let delasimage = UIImage(named: "Deals")
    

    @IBOutlet weak var getdealsbutton: UIButton!
    @IBOutlet weak var citynametextfieldforvodka: AutoCompleteTextField2!
    var locationManager1: CLLocationManager!
    var currentlocationname:String!
    var iscitytextfieldhavedata = false
    private var connection:NSURLConnection?
    private let googleMapsKey = "AIzaSyC8fGPXIWXTKJNvkBvKszetkDYbqh5AtC0"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
    var getenteredcitylat:Double!
    var getenteredcitylong:Double!
    private var responseData:NSMutableData?
    @IBOutlet weak var newtableviewforvodka: UITableView!
  
    @IBOutlet weak var newtextfieldvodka: UITextField!
    var variable:String!
    var arar = [String]()
    var newarar =  [String]()
    var autocompleteUrls: [String]!
    var liqnamefromtextfield:String!
    var trimmedString:String!
    var selectedliqor:String!
    var isliqtextfieldhasdata = false
    var check:String!
    var fstobj1 = Restaurant()
    var vodkaobjnew = Restauarantvodka()
    var restlat:Double!
    var restlong:Double!
    
    var getliqnamefromresult:String!
    
    var count = 0
    

  //  var obj = AutoCompleteTextField()
    
    
    //var selectedliqor:String!
    
    override func viewDidLoad()
    {
        
       // obj.autoCompleteTableView?.tag == 3
        newtableviewforvodka.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        newtableviewforvodka.layer.borderWidth = 2
        newtextfieldvodka.text = selectedliqor
        
        println(getcitylongitude)
        
        newtableviewforvodka.delegate = self
        newtableviewforvodka.dataSource = self
        newtextfieldvodka.delegate = self
       
        newtableviewforvodka.hidden = true
        
        newtableviewforvodka.tag = 0
        tableview1.tag = 1
        newtextfieldvodka.tag = 2
        
        autocompleteUrls = [String]()
        configureTextField()
        handleTextFieldInterfaces()
        
        getdealsbutton.layer.cornerRadius = 10
        getdealsbutton.setBackgroundImage(delasimage, forState: .Normal)
       // println(header1.count)
        pricebutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
        vodkasort = header1
        popupviewvodka.layer.cornerRadius = 20.0
        super.viewDidLayoutSubviews()
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
        mainviewvodka.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
        popupviewvodka.addGestureRecognizer(tap)
        
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
        popupviewvodka.hidden = true
        distancebutton.setTitle("DISTANCE", forState: .Normal)
        distancebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        pricebutton.setTitle("30ML", forState: .Normal)
        pricebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        
       // var vodkadrink = getselectedlq.capitalizedString
       // searchresultsvodka.text =  vodkadrink

        togglebutton.setImage(toggleoff, forState: .Normal)
        
        locationManager1 = CLLocationManager()
        // locationManager = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()

        citynametextfieldforvodka.textFieldWidth = citynametextfieldforvodka.frame.width
        citynametextfieldforvodka.delegate = self
        citynametextfieldforvodka.text = getselectedcityname
        
        func swapNumbers(index1 :Int,index2: Int)
        {
            let temp = vodkasort[index1]
            println(temp)
            vodkasort[index1] = vodkasort[index2]
            println(vodkasort[index1])
            vodkasort[index2] = temp
            println(vodkasort[index2])
        }
        
        for var ind: Int = 0; ind < vodkasort.count - 1; ++ind
        {
            for var jIndex: Int = ind + 1; jIndex < vodkasort.count; ++jIndex
            {
                println(jIndex)
                if vodkasort[jIndex].avgprice < vodkasort[ind].avgprice
                {
                    // println(inputArr[jIndex].maxp)
                    // println(inputArr[jIndex + 1].maxp)
                    //swapNumbers(jIndex, ind)
                    //println(swapNumbers(jIndex, jIndex+1))
                    //println(inputArr[jIndex + 1].maxp)
                    let temp = vodkasort[jIndex]
                    //println(temp)
                    vodkasort[jIndex] = vodkasort[ind]
                    //println(inputArr[index1])
                    vodkasort[ind] = temp
                }
            }
        }
        
        //  println(inputArr.first)
        // println(inputArr.last)
        header1 = vodkasort
         self.tableview1.reloadData()


        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userLocation:CLLocation = locations[0] as! CLLocation
        self.locationManager1.stopUpdatingLocation()
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        //Do What ever you want with it
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {
            placemarks, error in
            
            let placeArray = placemarks as? [CLPlacemark]
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placeArray?[0]
            
            // Street address
            if let street = placeMark.addressDictionary["Thoroughfare"] as? NSString {
                println(street)
                self.currentlocationname = street as String
                
                self.citynametextfieldforvodka.text = street as String
                
            }
            
        })
    }
    
    
    
    
    private func configureTextField()
    {
        citynametextfieldforvodka.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        citynametextfieldforvodka.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        citynametextfieldforvodka.autoCompleteCellHeight = 35.0
        citynametextfieldforvodka.maximumAutoCompleteCount = 20
        citynametextfieldforvodka.hidesWhenSelected = true
        citynametextfieldforvodka.hidesWhenEmpty = true
        citynametextfieldforvodka.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        citynametextfieldforvodka.autoCompleteAttributes = attributes
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
        citynametextfieldforvodka.onTextChange = {[weak self] text in
            if !text.isEmpty{
                if self!.connection != nil
                {
                    self!.connection!.cancel()
                    self!.connection = nil
                }
                let urlString = "\(self!.baseURLString)?key=\(self!.googleMapsKey)&input=\(text)"
                let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
                if url != nil{
                    let urlRequest = NSURLRequest(URL: url!)
                    self!.connection = NSURLConnection(request: urlRequest, delegate: self)
                }
            }
        }
        citynametextfieldforvodka.onSelect = {[weak self] text, indexpath in
            self!.citynametextfieldforvodka.text = text;self!.iscitytextfieldhavedata = true;self!.view.endEditing(true);self!.getselectedcityname = text
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil
                {
                    let coordinate = placemark!.location.coordinate
                    //                    self!.citylat = coordinate.latitude
                    //                    self!.citylong = coordinate.longitude
                    self!.getenteredcitylat = coordinate.latitude
                    self!.getenteredcitylong = coordinate.longitude
                    
                }
            })
        }
    }
    
    //MARK: NSURLConnectionDelegate
    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse)
    {
        responseData = NSMutableData()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData)
    {
        responseData?.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection)
    {
        if responseData != nil
        {
            var error:NSError?
            if let result = NSJSONSerialization.JSONObjectWithData(responseData!, options: nil, error: &error) as? NSDictionary
            {
                let status = result["status"] as? String
                if status == "OK"
                {
                    if let predictions = result["predictions"] as? NSArray
                    {
                        var locations = [String]()
                        for dict in predictions as! [NSDictionary]
                        {
                            locations.append(dict["description"] as! String)
                        }
                        self.citynametextfieldforvodka.autoCompleteStrings = locations
                    }
                }
                else{
                    self.citynametextfieldforvodka.autoCompleteStrings = nil
                }
            }
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        println("Error: \(error.localizedDescription)")
    }

    
    override func viewWillAppear(animated: Bool) {
        togglebutton.setImage(toggleoff, forState: .Normal)
    }
    
    @IBAction func press2revealPressed(sender: UIButton) {
        
        popupviewvodka.hidden = false
        tableview1.userInteractionEnabled = false
        takerestaurantname.text = "I just got a 10 % discount at \(header1[sender.tag].restnamevodka) Through Bottomz Up"
        
    }

    @IBAction func toggelbuttonpressed(sender: UIButton)
    {
        
        if toggle == false
        {
        togglebutton.setImage(toggleon, forState: .Normal)
            toggle = true
        }
        else{
            togglebutton.setImage(toggleoff, forState: .Normal)
            toggle = false

        }
    }
    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
      // popupviewvodka.hidden = true
    }
    func handleFrontTap1(gestureRecognizer: UITapGestureRecognizer)
    {
        //popupviewvodka.hidden = false
    }
    
    @IBAction func sharetofacebookVodka(sender: AnyObject)
    {
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant  through the BottomzUp App")
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    func numberOfSectionsInTableView(tableview: UITableView) -> Int
    {
        if tableview.tag == 1{
        
        return header1.count
        }
        
        else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 1{
        if header1[section].bool1 == true
        {
        return 1
        }
        else
        {
            return 0
        }
        }
        else
        {
            return autocompleteUrls.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if tableView.tag == 1
        {
        let cells = tableView.dequeueReusableCellWithIdentifier("vodkaChildCell", forIndexPath: indexPath) as! VodkaRowCell
        cells.liquors = [liqvodka]()
        cells.liquors = header1[indexPath.section].vodkaarray
        cells.press2reveal.tag = indexPath.section
        //cells.directions.setTitle(header1[indexPath.section].distancevodka, forState: UIControlState.Normal)
        cells.distancenewvodkalabel.text = header1[indexPath.section].distancevodka
        cells.tableView.reloadData()
         cells.arrowup.tag = indexPath.section
        return cells
        }
        else
        {
//            newtextfieldvodka.layer.masksToBounds = true
//            newtextfieldvodka.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
//            newtextfieldvodka.layer.borderWidth = 2.0
            
            let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
            var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as? UITableViewCell
            if cell == nil
            {
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
            }
            
            let index = indexPath.row as Int
            cell!.textLabel!.text = autocompleteUrls[index]
            cell!.textLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
            cell!.textLabel?.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
            return cell!
 
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if tableView.tag == 1{
            cell.layer.borderColor = UIColor.lightGrayColor().CGColor
            cell.layer.borderWidth = 1
        }
        else
        {
            //            cell.layer.borderColor = UIColor.lightGrayColor().CGColor
            //            cell.layer.borderWidth = 1
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if tableView.tag == 1{
        if (header1[indexPath.section].vodkaarray.count * 30 + 10) > 187 {
        
        return CGFloat(header1[indexPath.section].vodkaarray.count * 30 + 10)
        }
        else{
        
        return 187
            
        }
        }
        else
        {
            return 35
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if tableView.tag == 1{
        if header1[section].bool1 == false{
        return 125
        }
        else {
            return 110
        }
        }
        else
        {
            return 0
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        if let touch = touches.first as? UITouch {
            let location = touch.locationInView(self.mainviewvodka)
            if location.x < popupviewvodka.frame.origin.x || location.x > (popupviewvodka.frame.origin.x + popupviewvodka.frame.size.width){
                popupviewvodka.hidden = true
                tableview1.userInteractionEnabled = true
            }
            if location.y < popupviewvodka.frame.origin.y || location.y > (popupviewvodka.frame.origin.y + popupviewvodka.frame.size.height){
                popupviewvodka.hidden = true
                tableview1.userInteractionEnabled = true
            }
            
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if tableView.tag == 1
        {
            
            if header1[section].bool1 == false{
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellvodka") as! custmheadercell1
        headerCell.backgroundColor = UIColor.whiteColor()
        headerCell.vodkarestaurantname.text = header1[section].restnamevodka
        headerCell.vodkaavgprice.text = "₹ " + "\(header1[section].avgprice)"
        headerCell.vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)

        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.taprecognizerimage.addGestureRecognizer(headerTapped1)
        headerCell.taprecognizerimage.tag =  section
        headerCell.taprecognizerimage.userInteractionEnabled = true
        
        
        headerCell.mapbuttonvodkaclass.tag = section
        headerCell.mapbuttonvodkaclass.setTitle(header1[section].distancevodka, forState: UIControlState.Normal)
        headerCell.mapbuttonvodkaclass.enabled =  false
        
        headerCell.availofferbutton.tag = section
        //headerCell.availofferbutton.enabled = false
        
        headerCell.vodkarestaurantname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.vodkaavgprice.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.mapbuttonvodkaclass.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
            
        headerCell.viewtodisplayhappyhourbeforeexpantion.layer.borderWidth = 1
        headerCell.viewtodisplayhappyhourbeforeexpantion.layer.borderColor = UIColor.lightGrayColor().CGColor
        headerCell.viewtodisplayhappyhourbeforeexpantion.layer.cornerRadius = 20
            
        if header1[section].vodkaishappy == "Yes"
        {
         headerCell.Happyhourtimingdisplaybeforeexpantion.textColor = UIColor.greenColor()
        }
        else
        {
            headerCell.Happyhourtimingdisplaybeforeexpantion.textColor = UIColor.blackColor()
        }
                
                if header1[section].rest_offers_happy_hour == "Yes"
                {
                    headerCell.Happyhourlabelbeforeexpantion.hidden = false
                    headerCell.Happyhourlabelbeforeexpantion.hidden = false
                    headerCell.viewtodisplayhappyhourbeforeexpantion.hidden = false
                }
                else
                {
                    headerCell.Happyhourlabelbeforeexpantion.hidden = true
                    headerCell.Happyhourlabelbeforeexpantion.hidden = true
                    headerCell.viewtodisplayhappyhourbeforeexpantion.hidden = true
                }
            
            
                
            
        headerCell.Happyhourtimingdisplaybeforeexpantion.text = header1[section].vodkahappystart + " - " + header1[section].vodkahappyend

        if pricebuttonclicked == true
        {
             headerCell.vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
        if distancevodkabuttonclicked == true
        {
            headerCell.mapbuttonvodkaclass.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }

      
          return headerCell
            }
            else
            {
              let  headerCell1 = tableView.dequeueReusableCellWithIdentifier("headercellvodkanew") as! customheadercellafterexpastionforvodka
                headerCell1.happyhourstiminglabelafterexpation.text = header1[section].vodkahappystart + " - " + header1[section].vodkahappyend
                headerCell1.restnameafterexpastion.text = header1[section].restnamevodka
                headerCell1.viewtodisplayhappyhoursafterexpation.layer.borderWidth = 1
                headerCell1.viewtodisplayhappyhoursafterexpation.layer.borderColor = UIColor.lightGrayColor().CGColor
                headerCell1.bottlelabel.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
                var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
                headerCell1.viewtodisplayhappyhoursafterexpation.addGestureRecognizer(headerTapped1)
                headerCell1.viewtodisplayhappyhoursafterexpation.tag =  section
                headerCell1.viewtodisplayhappyhoursafterexpation.userInteractionEnabled = true

                
                if header1[section].rest_offers_happy_hour == "Yes"
                {
                    headerCell1.happyhourslabelafteexaption.hidden = false
                    headerCell1.happyhourstiminglabelafterexpation.hidden = false
                }
                else
                {
                    headerCell1.happyhourslabelafteexaption.hidden = true
                    headerCell1.happyhourstiminglabelafterexpation.hidden = true
                }

                
                return headerCell1
            }
        }
        else
        {
            return nil
        }
        
        
        
    }
    
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        println("Section: \(gestureRecognizer.view!.tag)")
        if header1[gestureRecognizer.view!.tag].bool1 == false
        {
            header1[gestureRecognizer.view!.tag].bool1 = true
        }
        else
        {
            header1[gestureRecognizer.view!.tag].bool1 = false
        }
        self.tableview1.reloadData()
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {

    }
    
    @IBAction func lookfurtherforvodka(sender: AnyObject)
    {
        changecolorvodka = true
       // vodkasort = header1
       // self.tableview1.reloadData()
        header1 = vodkasort
        count = count + 1
        if count == 1
        {
            getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=4&query=\(liqvodkaname)")
        }
        
        if count == 2
        {
            getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=4&query=\(liqvodkaname)")
        }
        if count == 3
        {
            count = 0
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "You want to go back for 2 KM Search", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=2&records=4&query=\(liqvodkaname)")
            

        }

    }
    
        func getbardatafurtherforvodka(urlString:String)
        {
            let url = NSURL(string: urlString)
            
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
                
                dispatch_async(dispatch_get_main_queue(), {
                    
                    self.extract_jsonfurhterforvodka(data)
                })
                
            }
            task.resume()
        }
    func extract_jsonfurhterforvodka(data:NSData)
    {
        var jsonError:NSError?
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
           header1 = [Restauarantvodka]()
           
            headfurther = [Restauarantvodka]()
         
            
            for var index = 0; index < json.count; ++index
            {
                getvodkaobj = Restauarantvodka()
                getvodkaobj1 = Restauarantvodka()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                    {
                        getvodkaobj.rest_offers_happy_hour = rest_offers_happy_hour1
                    }
                    if let avg_price = bottomsUp1["alcohol_min_price"] as? Int
                    {
                        //var avg_price2:String = toString(avg_price)
                        getvodkaobj.avgprice = avg_price
                        //vodkasendobj.avgprice = avg_price2
                        
                    }
                    if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                    {
                        
                        //                            func PartOfString(s: String, start: Int, length: Int) -> String
                        //                            {
                        //                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                        //                            }
                        //                            println("SUBSTRING    " + PartOfString(happy_hour_start, 1, 5))
                        // var happy_hour_start2 = PartOfString(happy_hour_start, 1, 5)
                        var happy_hour_start2 = happy_hour_start
                        
                        getvodkaobj.vodkahappystart = happy_hour_start2
                        //vodkasendobj.vodkahappystart = happy_hour_start2
                    }
                    
                    if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                    {
                        
                        //                            func PartOfString(s: String, start: Int, length: Int) -> String
                        //                            {
                        //                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                        //                            }
                        //                            println("SUBSTRING    " + PartOfString(happy_hour_end, 1, 5))
                        // var happy_hour_end2 = PartOfString(happy_hour_end, 1, 5)
                        var happy_hour_end2 = happy_hour_end
                        getvodkaobj.vodkahappyend = happy_hour_end2
                        //vodkasendobj.vodkahappyend = happy_hour_end2
                    }
                    
                    if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                    {
                        getvodkaobj.vodkaishappy = is_happy_hour
                        // vodkasendobj.vodkaishappy = is_happy_hour
                    }
                    
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                           getvodkaobj.restnamevodka = res_name
                            //getvodkaobj1.restnamevodka = res_name
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalatitude = string.doubleValue
                           // println(restvodkalat)
                            
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalongitude = string.doubleValue
                            println(getvodkalongitude)
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                            var newLocation: CLLocation = CLLocation(latitude: getvodkalatitude, longitude: getvodkalongitude)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                            println(String(format: "%.2f Km.", totalDistance))
                            NSLog("totalDistance: %@", String(format: "%.2f Km.", totalDistance))
                            totalDistance = Double(round(10*totalDistance)/10)
                            var totalDistance1 = totalDistance.description
                            println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                           // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                            getvodkaobj.distancevodka = totalDistance1 + " Km."
                            getvodkaobj1.distancevodka = totalDistance1 + " Km."
                        }
                    }
                    if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                    {
                        for var i = 0; i < resLiqInfo.count; ++i
                        {
                            var liqobj2 = liqvodka()
                            if let one = resLiqInfo[i] as? NSDictionary
                            {
                                if let res_liq_brand_price = one["res_liq_brand_price"] as? String
                                {
                                    liqobj2.liqbrandprice = res_liq_brand_price
                                }
                                
                                if let res_liq_brand_name = one["liq_brand_name"] as? String
                                {
                                    liqobj2.liqnamebrandname = res_liq_brand_name
                                }
                            }
                           getvodkaobj.vodkaarray.append(liqobj2)
                            getvodkaobj1.vodkasendarray.append(liqobj2)
                        }
                    }
       
                }
      
                 header1.append(getvodkaobj)
                headfurther.append(getvodkaobj)
               // println(headfurther)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableview1.reloadData()
    }
    
    @IBAction func pricesort(sender: AnyObject)
    {
        vodkasort = header1
        pricebuttonclicked = true
        distancevodkabuttonclicked = false
        
        if pricebuttonclicked == true
        {
            pricebutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            distancebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
        
        }
        for var i = 0; i < header1.count ; i++
        {
            header1[i].bool1 = false
            
        }
        
        tableview1.reloadData()
        
      
//            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].avgprice > cards[i+1].avgprice
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.avgprice)")
//                            println("second object before\(second.avgprice)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].avgprice)")
//                            println("second object after\(cards[i + 1].avgprice)")
//                        }
//                    }
//                    }
//                    else
//                    {
//                        
//                    }
//                }
//                return cards
//            }
//            var sortedarray:[Restauarantvodka] = sortCards(&header1)
        
        
        func swapNumbers(index1 :Int,index2: Int)
        {
            let temp = vodkasort[index1]
            println(temp)
            vodkasort[index1] = vodkasort[index2]
            println(vodkasort[index1])
            vodkasort[index2] = temp
            println(vodkasort[index2])
        }
        
        for var ind: Int = 0; ind < vodkasort.count - 1; ++ind
        {
            for var jIndex: Int = ind + 1; jIndex < vodkasort.count; ++jIndex
            {
                println(jIndex)
                if vodkasort[jIndex].avgprice < vodkasort[ind].avgprice
                {
                    // println(inputArr[jIndex].maxp)
                    // println(inputArr[jIndex + 1].maxp)
                    //swapNumbers(jIndex, ind)
                    //println(swapNumbers(jIndex, jIndex+1))
                    //println(inputArr[jIndex + 1].maxp)
                    let temp = vodkasort[jIndex]
                    //println(temp)
                    vodkasort[jIndex] = vodkasort[ind]
                    //println(inputArr[index1])
                    vodkasort[ind] = temp
                }
            }
        }
        
        //  println(inputArr.first)
        // println(inputArr.last)
        header1 = vodkasort

        
        
        
        
        
           // header1 = sortedarray
            self.tableview1.reloadData()
            println("sorted array is  : \(header1.count)")
        
        
//        else
//        {
//            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].avgprice < cards[i+1].avgprice
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.avgprice)")
//                            println("second object before\(second.avgprice)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].avgprice)")
//                            println("second object after\(cards[i + 1].avgprice)")
//                        }
//                    }
//                    }
//                    else
//                    {
//                        
//                    }
//                }
//                return cards
//            }
//            var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//            header1 = sortedarray1
//            self.tableview1.reloadData()
//            println("sorted array is  : \(header1)")
//            doubleTap = true
//        }

        
    }
    
    
    @IBAction func distancesort(sender: AnyObject)
    {
        
//        pricebuttonclicked = false
//        distancevodkabuttonclicked = true
//        
//
//
//        if distancevodkabuttonclicked == true
//        {
//            pricebutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
//            distancebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
//            
//        }
//        
//        
//      
////            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
////            {
////                var sorted = false
////                while sorted == false
////                {
////                    sorted = true
////                    if cards.count > 1
////                    {
////                    for i in 0...cards.count - 2
////                    {
////                        if cards[i].distancevodka > cards[i+1].distancevodka
////                        {
////                            sorted = false
////                            var first = cards[i]
////                            var second = cards[i + 1]
////                            println("first object before \(first.distancevodka)")
////                            println("second object before\(second.distancevodka)")
////                            cards[i] = second
////                            cards[i + 1] = first
////                            println("first object after\(cards[i].distancevodka)")
////                            println("second object after\(cards[i + 1].distancevodka)")
////                        }
////                    }
////                    }
////                    else
////                    {
////                        
////                    }
////                }
////                return cards
////            }
//            //var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//           // header1 = sortedarray1
//            self.tableview1.reloadData()
//     
//            println("sorted array is  : \(header1)")
//     
        
//        else
//        {
//            func sortCards(inout cards: Array<Restauarantvodka>) -> Array<Restauarantvodka>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].distancevodka < cards[i+1].distancevodka
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.distancevodka)")
//                            println("second object before\(second.distancevodka)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].distancevodka)")
//                            println("second object after\(cards[i + 1].distancevodka)")
//                        }
//                    }
//                    }
//                }
//                return cards
//            }
//            var sortedarray1:[Restauarantvodka] = sortCards(&header1)
//            header1 = sortedarray1
//            self.tableview1.reloadData()
//            println("sorted array is  : \(header1)")
//            doubleTap = true
//        }
//        
  
    }
    
    
//    @IBAction func gotoMap(sender: AnyObject)
//    {
//         UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(header1[sender.tag].Restaurantlatitudevodka),\(header1[sender.tag].Restaurantlongitudevodka)")!)
//    }
    @IBAction func gotomap(sender: AnyObject) {
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(header1[sender.tag].Restaurantlatitudevodka),\(header1[sender.tag].Restaurantlongitudevodka)")!)
    }
    
    @IBAction func getDiscountforvodka(sender: AnyObject)
    {
//        popupviewvodka.hidden = false
//        takerestaurantname.text = "I just got a 10 % discount at \(header1[sender.tag].restnamevodka) Through Bottomz Up"
    }
    func textFieldDidBeginEditing(textField: UITextField)
    {
       // if newtextfieldvodka.tag == 2{
//            var obj = AutoCompleteTextField()
//            obj.autoCompleteTableView?.hidden = true
        
        
        
        if textField.tag == 2{
            textField.selectAll(self)
            textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        
            
    
    }
    
    func textFieldDidChange(textField: UITextField)
    {
        
        if self.newtextfieldvodka.text != nil && self.newtextfieldvodka.text != ""
        {
            
            var s = self.newtextfieldvodka.text
            variable = s
            variable.startIndex
            let trimmedString1 = variable.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            
            let url = NSURL(string: "http://demos.dignitasdigital.com/bottomzup/liquors.php?find=\(trimmedString1)")
            loadData(url!, completion: didLoadData)
            
        }
        
    }
    
    
    func loadData(url: NSURL, completion: ([String]) -> Void){
        let session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            
            if error != nil {
                
            } else {
                
                var error : NSError?
                
                if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSArray{
                    for var index = 0; index < json.count; ++index
                    {
                        if let bottomsUp = json[index] as? NSDictionary
                        {
                            if let liquors = bottomsUp["liquors"] as? String
                            {
                                self.arar.append(liquors)
                                self.newarar = self.removeDuplicates(self.arar)
                                
                            }
                        }
                    }
                }
                
                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
                dispatch_async(dispatch_get_global_queue(priority, 0))
                    {
                        dispatch_async(dispatch_get_main_queue()) {
                            completion(self.newarar)
                        }
                }
                
            }
        }
        
        task.resume()
    }
    
    func didLoadData(arrData: [String])
    {
        var substring = self.newtextfieldvodka.text
        //substring.lowercaseString
        searchAutocompleteEntriesWithSubstring(substring)
        
        //self.newtextfieldtableview.reloadData()
        
        self.newtableviewforvodka.reloadData()
        self.newtableviewforvodka!.hidden = false
        
    }
    
    func removeDuplicates(array: [String]) -> [String]
    {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array
        {
            if encountered.contains(value)
            {
                
            }
            else
            {
                encountered.insert(value)
                result.append(value)
            }
        }
        return result
    }

    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepCapacity: false)
        
        var usubstring = substring
        
        for curString in newarar
        {
            var ucurstring = curString
            
            var myString: NSString! = ucurstring as NSString
            var substringRange: NSRange! = myString.rangeOfString(usubstring.capitalizedString)
            
            if (substringRange.location == 0)
            {
                autocompleteUrls.append(ucurstring)
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if tableView.tag == 0
        {
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            newtextfieldvodka.text = selectedCell1.textLabel?.text
            liqnamefromtextfield = newtextfieldvodka.text
            trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)

            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=2&records=15&query=\(trimmedString)")

            selectedliqor = selectedCell1.textLabel!.text
            isliqtextfieldhasdata = true
            self.view.endEditing(true)
            tableView.hidden = true
        }
    }
    
    func getbardata(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_json(data)
            })
        }
        task.resume()
    }
    func extract_json(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            head1 = [Restaurant]()
            headerfortableview = [Restauarantvodka]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
                vodkaobjnew = Restauarantvodka()
                //vodkasendobj = Restauarantvodka()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let liquor_type = bottomsUp1["liquor_type"] as? String
                    {
                        check = liquor_type
                        println("check  \(check)")
                    }
                    
                    if check == "Beer"{
                        if let pint_avg_price = bottomsUp1["pint_min_price"] as? Int
                        {
                            //var pint_avg_price2:String = toString(pint_avg_price)
                            fstobj1.minp = pint_avg_price
                        }
                        if let bottle_avg_price = bottomsUp1["bottle_min_price"] as? Int
                        {
                            //var bottle_avg_price2:String = toString(bottle_avg_price)
                            fstobj1.maxp = bottle_avg_price
                        }
                        
                        if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_start, 1, 5))
                            var happy_hour_start1 = PartOfString(happy_hour_start, 1, 5)
                            
                            
                            fstobj1.happystart = happy_hour_start1
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_end, 1, 5))
                            var happy_hour_end1 = PartOfString(happy_hour_end, 1, 5)
                            fstobj1.happyend = happy_hour_end1
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            fstobj1.ishappy = is_happy_hour
                        }
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            fstobj1.rest_offers_happy_hour = rest_offers_happy_hour1
                        }
                        if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                        {
                            if let res_name = resInfo["res_name"] as? String
                            {
                                fstobj1.restname = res_name
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                //convert String to Double
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restlat = string.doubleValue
                                fstobj1.Restaurantlatitude = restlat
                                //println(fstobj1.Restaurantlatitude)
                                //println(restlat)
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let mySwiftString = res_long
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restlong = string.doubleValue
                                fstobj1.Restaurantlongitude = restlong
                                //println(fstobj1.Restaurantlongitude)
                                // println(restlong)
                                
                                
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                                var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                                var newLocation: CLLocation = CLLocation(latitude: restlat, longitude: restlong)
                                var totalDistance: Double = 0
                                var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                                totalDistance = totalDistance + (meters / 1000)
                                println(String(format: "%.2f Km.", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f Km.", totalDistance))
                                totalDistance = Double(round(10*totalDistance)/10)
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                               // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                
                                
                                fstobj1.distance = totalDistance1 + "Km."
                                //println(fstobj1.distance)
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
                        head1.append(fstobj1)
                    }
                        
                    else
                    {
                        if let avg_price = bottomsUp1["alcohol_min_price"] as? Int
                        {
                            //var avg_price2:String = toString(avg_price)
                            vodkaobjnew.avgprice = avg_price
                            println(avg_price)
                            //vodkasendobj.avgprice = avg_price2
                            
                        }
                        if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                        {
                            
//                            func PartOfString(s: String, start: Int, length: Int) -> String
//                            {
//                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
//                            }
//                            println("SUBSTRING    " + PartOfString(happy_hour_start, 1, 5))
                            //var happy_hour_start2 = PartOfString(happy_hour_start, 1, 5)
                            var happy_hour_start2 = happy_hour_start
                            vodkaobjnew.vodkahappystart = happy_hour_start2
                            //vodkasendobj.vodkahappystart = happy_hour_start2
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {
                            
//                            func PartOfString(s: String, start: Int, length: Int) -> String
//                            {
//                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
//                            }
//                            println("SUBSTRING    " + PartOfString(happy_hour_end, 1, 5))
                           // var happy_hour_end2 = PartOfString(happy_hour_end, 1, 5)
                            var happy_hour_end2 = happy_hour_end
                            vodkaobjnew.vodkahappyend = happy_hour_end2
                            //vodkasendobj.vodkahappyend = happy_hour_end2
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            vodkaobjnew.vodkaishappy = is_happy_hour
                            // vodkasendobj.vodkaishappy = is_happy_hour
                        }
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            vodkaobjnew.rest_offers_happy_hour = rest_offers_happy_hour1
                        }
                        
                        if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                        {
                            if let res_name = resInfo["res_name"] as? String
                            {
                                vodkaobjnew.restnamevodka = res_name
                                //vodkasendobj.restnamevodka = res_name
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                getrestlatitudevodka = string.doubleValue
                                vodkaobjnew.Restaurantlatitudevodka = getrestlatitudevodka
                                // vodkasendobj.Restaurantlatitudevodka = restvodkalat
                                // println(restvodkalat)
                                
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let mySwiftString = res_long
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                getrestlongitudevodka = string.doubleValue
                                vodkaobjnew.Restaurantlongitudevodka = getrestlongitudevodka
                                //vodkasendobj.Restaurantlongitudevodka = restvodkalang
                                //// println(restvodkalang)
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                                var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude , longitude: getdevicelongitude)
                                var newLocation: CLLocation = CLLocation(latitude: getrestlatitudevodka, longitude: getrestlongitudevodka)
                                var totalDistance: Double = 0
                                var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                                totalDistance = totalDistance + (meters / 1000)
                                println(String(format: "%.2f Km.", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f Km.", totalDistance))
                                totalDistance = Double(round(10*totalDistance)/10)
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                               // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                vodkaobjnew.distancevodka = totalDistance1 + "Km."
                                //vodkasendobj.distancevodka = totalDistance1 + "KM"
                            }
                        }
                        
                        if let resLiqInfo = bottomsUp1["resLiqInfo"] as? NSArray
                        {
                            for var i = 0; i < resLiqInfo.count; ++i
                            {
                                var liqobj2 = liqvodka()
                                if let one = resLiqInfo[i] as? NSDictionary
                                {
                                    
                                    if let res_liq_brand_name = one["liq_brand_name"] as? String
                                    {
                                        liqobj2.liqnamebrandname = res_liq_brand_name
                                    }
                                    if let res_liq_brand_price = one["res_liq_brand_price"] as? String
                                    {
                                        liqobj2.liqbrandprice = res_liq_brand_price
                                    }
                                    
                                }
                                vodkaobjnew.vodkaarray.append(liqobj2)
                                //vodkasendobj.vodkasendarray.append(liqobj2)
                            }
                        }
                        headerfortableview.append(vodkaobjnew)
                        println(headerfortableview.count)
                        // headervodka.append(vodkasendobj)
                        // println("header \(vodkaobj)")
                    }
                }
            }
            if check == "Beer"
            {
                
                self.performSegueWithIdentifier("gotobeersegue", sender: self)
            }
            else
            {
                header1 = headerfortableview
                tableview1.reloadData()
                //self.performSegueWithIdentifier("gotobeersegue", sender: self)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotobeersegue"
        {
            if let destination = segue.destinationViewController as? tableviewclass
            {
                destination.liqvodkaname = newtextfieldvodka.text
                var liqvodkaname = newtextfieldvodka.text
                let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                 destination.liqvodkaname = trimmedString
                destination.head = head1
                destination.getcitylatitude = getcitylatitude
                destination.getcitylongitude = getcitylongitude
                destination.getdevicelatitude = getdevicelatitude
                destination.getdevicelongitude = getdevicelongitude
                destination.selectedliqor = selectedliqor
              /// destination.getvodkalatitude = restlat
               // destination.getvodkalongitude = restlong
                destination.getselectedcityname = getselectedcityname
                
                destination.getcitylatitudefromvodka = getcitylatitude
                destination.getcitylongitudefromvodka = getcitylongitude
                
                
                
            }
        }
    }

    @IBAction func arrowup(sender: UIButton)
    {
        if header1[sender.tag].bool1 == true
        {
            header1[sender.tag].bool1 = false
        }
        
        tableview1.reloadData()
    }
    
}

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

