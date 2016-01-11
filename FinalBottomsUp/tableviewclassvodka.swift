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



class tableviewclassvodka: UIViewController,UITableViewDataSource, UITableViewDelegate,MKMapViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate,UIWebViewDelegate
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
    var array1 = [Restauarantvodka]()
    var array2 = [Restauarantvodka]()
    var array3 = [Restauarantvodka]()

    
    let pintcheckedImage = UIImage(named: "NormalTabyellow")
    let pintunCheckedImage = UIImage(named: "NormaltabWhite")
    
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
    
    var togglevodka = false
    var toggleboolean:Bool!
    
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
    
    var newvodkaarray:[Restauarantvodka] = [Restauarantvodka]()
    
    var newtrimmedstring:String!
    
    
    var liqnamefromtableview:String!
    
    @IBOutlet weak var searchbutton: UIButton!

  //  var obj = AutoCompleteTextField()
    
    
    @IBOutlet weak var phoneview: UIView!
    
    @IBOutlet weak var locationpopupview: UIView!
    @IBOutlet weak var addressLabel: UILabel!
    
    var DynamicViewvodka=UIView()
    var newrestnamefromtagvodka:String!
    
    var one:Int!
    var two:Int!
    var countvlaues:Int!
    
    
    
    
    //var selectedliqor:String!
    
    override func viewDidLoad()
    {
         array3 = header1
         countvlaues = array3.count
        println(array3.count)
        searchbutton.setTitle("Search", forState: .Normal)
        searchbutton.titleLabel?.text = "Search"
        searchbutton.titleLabel?.textColor = UIColor.whiteColor();
        newvodkaarray = header1
        print(newvodkaarray.count)
        if togglevodka == true
        {
            togglebutton.setImage(toggleon, forState: .Normal)
            
        }
        else
        {
            togglebutton.setImage(toggleoff, forState: .Normal)
        }
        //togglefunctionality()
        Happyhours()
        
        
       // distancebutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)

        newtableviewforvodka.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        newtableviewforvodka.layer.borderWidth = 2
        newtextfieldvodka.text = "  " + selectedliqor
        
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
        
        //getdealsbutton.layer.cornerRadius = 10
        //getdealsbutton.setBackgroundImage(delasimage, forState: .Normal)
        pricebutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
        vodkasort = header1
      //  popupviewvodka.layer.cornerRadius = 20.0
        super.viewDidLayoutSubviews()
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
        mainviewvodka.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
       // popupviewvodka.addGestureRecognizer(tap)
        let tap2 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
        phoneview.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
        locationpopupview.addGestureRecognizer(tap3)
        
        self.tableview1.delegate = self
        self.tableview1.dataSource = self
       // popupviewvodka.hidden = true
        phoneview.hidden = true
        locationpopupview.hidden = true
      //  distancebutton.setTitle("DISTANCE", forState: .Normal)
       // distancebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        pricebutton.setTitle("30ML", forState: .Normal)
        pricebutton.titleLabel!.font =  UIFont(name: "MyriadPro-Regular", size:11)
        
       // var vodkadrink = getselectedlq.capitalizedString
       // searchresultsvodka.text =  vodkadrink

       // togglebutton.setImage(toggleoff, forState: .Normal)
        
        locationManager1 = CLLocationManager()
        // locationManager = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()

        citynametextfieldforvodka.textFieldWidth = citynametextfieldforvodka.frame.width
        citynametextfieldforvodka.delegate = self
        citynametextfieldforvodka.text = "  " + getselectedcityname
        
        header1 = pricesort1(header1)

        



        
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
        citynametextfieldforvodka.autoCompleteTextFont = UIFont(name: "MyriadPro-Regular", size:11)
        citynametextfieldforvodka.autoCompleteCellHeight = 35.0
        citynametextfieldforvodka.maximumAutoCompleteCount = 20
        citynametextfieldforvodka.hidesWhenSelected = true
        citynametextfieldforvodka.hidesWhenEmpty = true
        citynametextfieldforvodka.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "MyriadPro-Regular", size:11)
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
                    self!.getenteredcitylat = coordinate.latitude
                    self!.getenteredcitylong = coordinate.longitude
                    
                    if self!.iscitytextfieldhavedata == true && self!.isliqtextfieldhasdata == true
                    {
                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self!.getenteredcitylat)&long=\(self!.getenteredcitylong)&km=2&records=10&query=\(self!.trimmedString)")
                    }
                    else
                    {
                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self!.getenteredcitylat)&long=\(self!.getenteredcitylong)&km=2&records=10&query=\(self!.newtrimmedstring)")
                    }

                    
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

    
//    override func viewWillAppear(animated: Bool) {
//        togglebutton.setImage(toggleoff, forState: .Normal)
//    }
    
    @IBAction func press2revealPressed(sender: UIButton) {
        
      //  popupviewvodka.hidden = false
     //   tableview1.userInteractionEnabled = false
      //  takerestaurantname.text = "I just got a 10 % discount at \(header1[sender.tag].restnamevodka) Through Bottomz Up"
        
    }
    

    @IBAction func Press2revell(sender: UIButton, forEvent event: UIEvent)
    {
        
        self.tableview1.userInteractionEnabled = false
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            
            let imageName = "Revelpopup.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)

            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
         
            
            
            self.DynamicViewvodka=UIView(frame: CGRectMake(self.view.frame.width*0.1 + 10 ,p!.y - 180,self.view.frame.width * 0.8 - 10 ,195))
            self.DynamicViewvodka.layer.borderColor = UIColor.blackColor().CGColor
            imageView.frame = CGRect(x: 0,y: 0,width: DynamicViewvodka.frame.width,height: DynamicViewvodka.frame.height)
            
            var dynamicLabel: UILabel = UILabel()
            dynamicLabel.frame = CGRectMake(15, 10, DynamicViewvodka.frame.width - 20, 27)
            dynamicLabel.textColor = UIColor.blackColor()
            dynamicLabel.textAlignment = NSTextAlignment.Left
            dynamicLabel.text = "To avail a 10% discount on your bill,press the Avail Offer button"
            dynamicLabel.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel.numberOfLines = 2
            
            var dynamicLabel1: UILabel = UILabel()
            dynamicLabel1.frame = CGRectMake(15, 40, DynamicViewvodka.frame.width - 20, 27)
            dynamicLabel1.textColor = UIColor.blackColor()
            dynamicLabel1.textAlignment = NSTextAlignment.Left
            dynamicLabel1.text = " 1. The following post will be generated through \nyour Facebook account."
            dynamicLabel1.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel1.numberOfLines = 2
            
            var dynamicLabel2: UILabel = UILabel()
            dynamicLabel2.frame = CGRectMake(17, 70, DynamicViewvodka.frame.width - 20, 27)
            dynamicLabel2.textColor = UIColor.blackColor()
            dynamicLabel2.textAlignment = NSTextAlignment.Left
            dynamicLabel2.text = " i just got a 10% discount at \(header1[sender.tag].restnamevodka) through\n the BottomzUp App"
            newrestnamefromtagvodka = header1[sender.tag].restnamevodka
            dynamicLabel2.font = UIFont(name:"MyriadPro-Bold", size: 9)
            dynamicLabel2.numberOfLines = 2
            
            var dynamicLabel3: UILabel = UILabel()
            dynamicLabel3.frame = CGRectMake(15, 100, DynamicViewvodka.frame.width - 20, 27)
            dynamicLabel3.textColor = UIColor.blackColor()
            dynamicLabel3.textAlignment = NSTextAlignment.Left
            dynamicLabel3.text = " 2.Show this Faceboof post to the restaurant to\n avail this offer"
            dynamicLabel3.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel3.numberOfLines = 2
            
            
            
            let dunamicButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            dunamicButton.frame = CGRectMake(DynamicViewvodka.frame.width - 23,10,16,16)
            dunamicButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            dunamicButton.setBackgroundImage(image1, forState: .Normal)
            
            
            
            let imageName2 = "revelofferbutton.png"
            let image2 = UIImage(named: imageName2)
            let imageView2 = UIImageView(image: image2!)
            
            
            var button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            button.frame = CGRectMake(DynamicViewvodka.frame.width/2 - 75,120,150,60)
            button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
            button.setBackgroundImage(image2, forState: .Normal)

            self.view.addSubview(DynamicViewvodka)
            self.DynamicViewvodka.addSubview(imageView)
            self.DynamicViewvodka.addSubview(dynamicLabel)
            self.DynamicViewvodka.addSubview(dynamicLabel1)
            self.DynamicViewvodka.addSubview(dynamicLabel2)
            self.DynamicViewvodka.addSubview(dunamicButton)
            self.DynamicViewvodka.addSubview(dynamicLabel3)
            self.DynamicViewvodka.addSubview(button)
            
            
        }

    }
    
    func buttonTouched(sender:UIButton!)
    {
        print("vinayak")
        self.tableview1.userInteractionEnabled = true
        DynamicViewvodka.hidden = true
        
    }
    
    func Action(sender:UIButton)
    {
        print("vinayak")
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("i just got a 10% discount at \(newrestnamefromtagvodka) through\n the BottomzUp App")
        
        
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    @IBAction func press2Revelclosebutton(sender: UIButton)
    {
      // popupviewvodka.hidden = true
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
         cells.Hotelname.text = header1[indexPath.section].restnamevodka
            cells.address.text = header1[indexPath.section].address
            cells.happyhourstiming.text = header1[indexPath.section].vodkahappystart + header1[indexPath.section].vodkahappyend
            
        return cells
        }
        else
        {
            let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
            var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as? UITableViewCell
            if cell == nil
            {
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
            }
            
            let index = indexPath.row as Int
            cell!.textLabel!.text = autocompleteUrls[index]
            cell!.textLabel?.font = UIFont(name: "MyriadPro-Regular", size:14)
            cell!.textLabel?.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
            return cell!
 
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if tableView.tag == 1{

        }
        else
        {

        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if tableView.tag == 1{
        if (header1[indexPath.section].vodkaarray.count * 30 + 10) > 210 {
        
        return CGFloat(header1[indexPath.section].vodkaarray.count * 30 + 10)
        }
        else{
        
        return 210
            
        }
        }
        else
        {
            return 35
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if tableView.tag == 1
        {
        if header1[section].bool1 == false
        {
            if header1[section].rest_offers_happy_hour == "Yes" 
            {
               return 81
            }
            else
            {
                return 81
            }
        
        }
        else
        {
            if header1[section].rest_offers_happy_hour == "Yes"
            {
                return 0
            }
            else
            {
                return 0
            }
        }
        }
        else
        {
            return 0
        }
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
//    {
//        if let touch = touches.first as? UITouch {
//            let location = touch.locationInView(self.mainviewvodka)
//            if location.x < popupviewvodka.frame.origin.x || location.x > (popupviewvodka.frame.origin.x + popupviewvodka.frame.size.width){
//                popupviewvodka.hidden = true
//                tableview1.userInteractionEnabled = true
//            }
//            if location.y < popupviewvodka.frame.origin.y || location.y > (popupviewvodka.frame.origin.y + popupviewvodka.frame.size.height){
//                popupviewvodka.hidden = true
//                tableview1.userInteractionEnabled = true
//            }
//            
//        }
//    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if tableView.tag == 1
        {
            
            if header1[section].bool1 == false{
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellvodka") as! custmheadercell1
        headerCell.backgroundColor = UIColor.whiteColor()
        headerCell.vodkarestaurantname.text = " " + header1[section].restnamevodka
               // println(header1[section].address)
        headerCell.addressLabel.text =  " " + header1[section].address
                addressLabel.text = header1[section].address
        if header1[section].avgprice == 0
        {
            headerCell.vodkaavgprice.text = "--"
        }
         else
        {
            headerCell.vodkaavgprice.text = "\(header1[section].avgprice)"
            
        }
        
       // headerCell.vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)

        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.taprecognizerimage.addGestureRecognizer(headerTapped1)
        headerCell.taprecognizerimage.tag =  section
        headerCell.taprecognizerimage.userInteractionEnabled = true
        
        
        headerCell.mapbuttonvodkaclass.tag = section
        headerCell.mapbuttonvodkaclass.setTitle(header1[section].distancevodka, forState: UIControlState.Normal)
        headerCell.mapbuttonvodkaclass.enabled =  false
        
       // headerCell.availofferbutton.tag = section
        //headerCell.availofferbutton.enabled = false
        
        headerCell.vodkarestaurantname.font = UIFont(name: "MyriadPro-Regular", size: 11)
        headerCell.vodkaavgprice.font = UIFont(name: "MyriadPro-Regular", size: 11)
        headerCell.mapbuttonvodkaclass.titleLabel?.font = UIFont(name: "MyriadPro-Regular", size: 11)
                
             //   headerCell.Happyhourlabelbeforeexpantion.add
                
                let happyhourstiming = header1[section].vodkahappystart + " - " + header1[section].vodkahappyend
                let happyhours = "Happy Hours"
                let happyhourshappytiming =   happyhours + "  " + happyhourstiming
                let range = (happyhourshappytiming as NSString).rangeOfString(happyhours)
                let attributedString = NSMutableAttributedString(string:happyhourshappytiming)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor() , range: range)
                headerCell.Happyhourlabelbeforeexpantion.attributedText = attributedString

                

            
        if header1[section].vodkaishappy == "Yes"
        {
            headerCell.Happyhourlabelbeforeexpantion.textColor = UIColor.greenColor()
        }
        else
        {
             headerCell.Happyhourlabelbeforeexpantion.textColor = UIColor.orangeColor()
        }
                
                if header1[section].rest_offers_happy_hour == "Yes"
                {
                    headerCell.Happyhourlabelbeforeexpantion.hidden = false
                 //   headerCell.Happyhourtimingdisplaybeforeexpantion.hidden = false
                
                }
                else
                {
                    headerCell.Happyhourlabelbeforeexpantion.hidden = true
                  //  headerCell.Happyhourtimingdisplaybeforeexpantion.hidden = true
                  
                }
            
            
                
            
    //    headerCell.Happyhourtimingdisplaybeforeexpantion.text = " " + header1[section].vodkahappystart + " - " + header1[section].vodkahappyend

        if pricebuttonclicked == true
        {
             //headerCell.vodkaavgprice.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
        if distancevodkabuttonclicked == true
        {
           // headerCell.mapbuttonvodkaclass.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
                
                if header1[section].color == true
                {
                    
                   // headerCell.backgroundColor = UIColor(red: 0xcc/255,green: 0xd9/255,blue: 0xff/255,alpha: 1.0)
                   // headerCell.viewtodisplayhappyhourbeforeexpantion.backgroundColor = UIColor(red: 0xcc/255,green: 0xd9/255,blue: 0xff/255,alpha: 1.0)
                   
                }
                else
                {
                   // headerCell.backgroundColor = UIColor.whiteColor()
                }
                
          return headerCell
            }
            else
            {
              let  headerCell1 = tableView.dequeueReusableCellWithIdentifier("headercellvodkanew") as! customheadercellafterexpastionforvodka
                headerCell1.happyhourstiminglabelafterexpation.text = " " + header1[section].vodkahappystart + " - " + header1[section].vodkahappyend
                headerCell1.restnameafterexpastion.text = " " + header1[section].restnamevodka
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
                if header1[section].vodkaishappy == "Yes"
                {
                     //headerCell1.happyhourstiminglabelafterexpation.textColor = UIColor.greenColor()
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
    
    @IBAction func toggelbuttonpressed(sender: UIButton)
    {
        var array = [Restauarantvodka]()
        
        array = header1
        
        
        
        if togglevodka == false
        {
            self.array1 = header1
            togglebutton.setImage(toggleon, forState: .Normal)
            togglevodka = true
        
            for var i = array.count-1;i >= 0;i--
            {
                if array[i].vodkaishappy != "Yes"
                {
                   array.removeAtIndex(i)
                }
            }

            header1 = array
        }
        else
        {
            togglebutton.setImage(toggleoff, forState: .Normal)
            togglevodka = false

            if count == 1
            {
              header1 = self.array2
            }
            else if count == 2
            {
                header1 = self.array2
            }
            else if count == 3
            {
              header1 = self.array2
            }
            else
            {
                header1 = self.array1
           }
        }

        header1 = self.pricesort1(header1)
        tableview1.reloadData()
        
    }

    
    
    func Happyhours()
    {
        var array = [Restauarantvodka]()
        
        array = header1
        if togglevodka == true
        {
            self.array1 = header1
           // togglebutton.setImage(toggleon, forState: .Normal)
            //togglevodka = true
          //  if togglevodka == true
           // {
                for var i = array.count-1;i >= 0;i--
                {
                    if array[i].vodkaishappy != "Yes"
                    {
                        array.removeAtIndex(i)
                    }
                    
                    
                }
            //}
            header1 = array
        }
        else
        {
            self.array1 = header1
            if count == 1
            {
                header1 = self.array2
            }
            else if count == 2
            {
                header1 = self.array2
            }
            else if count == 3
            {
                header1 = self.array2
            }
            else
            {
                header1 = self.array1
            }
        }
        header1 = self.pricesort1(header1)
        tableview1.reloadData()
  
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
         
            if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
            {
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=10&query=\(liqvodkaname)")
            }
            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
            {
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getenteredcitylat)&long=\(getenteredcitylong)&km=5&records=10&query=\(liqvodkaname)")
            }
            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
            {
              getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=10&query=\(trimmedString)")
            }
            
            
            
            self.array1 = header1
        }
        
        if count == 2
        {
            if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
            {
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=10&query=\(liqvodkaname)")
            }
            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
            {
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getenteredcitylat)&long=\(getenteredcitylong)&km=7&records=10&query=\(liqvodkaname)")
            }
            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
            {
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=10&query=\(trimmedString)")
            }

            
            self.array1 = header1
        }
        if count == 3
        {
            
            let alertController = UIAlertController(title: "Do you want go back to 2 km search", message: "Press the Ok or cancel", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                self.count = 2
                
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                self.count = 0
                
                if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == false
                {
                       self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=15&query=\(self.liqvodkaname)")
                }
                else if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == true
                {
                    self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getenteredcitylat)&long=\(self.getenteredcitylong)&km=2&records=10&query=\(self.liqvodkaname)")
                }
                else if self.isliqtextfieldhasdata == true && self.iscitytextfieldhavedata == false
                {
                    self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=10&query=\(self.trimmedString)")
                }

                
             
                self.array1 = self.header1
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                
            }
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

                        var happy_hour_start2 = happy_hour_start
                        
                        getvodkaobj.vodkahappystart = happy_hour_start2

                    }
                    
                    if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                    {

                        var happy_hour_end2 = happy_hour_end
                        getvodkaobj.vodkahappyend = happy_hour_end2
       
                    }
                    
                    if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                    {
                        getvodkaobj.vodkaishappy = is_happy_hour
                  
                    }
                    
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            getvodkaobj.restnamevodka = res_name

                        }
                        if let res_place = resInfo["res_place"] as? String
                        {
                            getvodkaobj.address = res_place
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalatitude = string.doubleValue
                 
                            
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
                           // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                println(header1.count)
                array2 = header1
                println(array2.count)
                
                headfurther.append(getvodkaobj)
                println(headfurther.count)
                header1 = makecolor(header1, newvodkaarray: newvodkaarray)
                
                if count == 1
                {
                    one = header1.count
                    two = countvlaues
                }
                else if count == 2
                {
                    two = header1.count
                }
            }
            
            if countvlaues > one
            {
                
            }
            else if one > two
            {
                
            }
            else
            {
                if count == 1
                {
                    let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "No New Hotels Found", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                    
                else if count == 2
                {
                    let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "No New Hotels Found", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                else
                {
                    
                }
            }
            if togglevodka == true
            {
                
                var array = [Restauarantvodka]()
                array = header1
                for var i = array.count - 1;i>=0;i--
                {
                    if array[i].vodkaishappy != "Yes"
                    {
                        array.removeAtIndex(i)
                    }

                }
                header1 = array
            }

            header1 = pricesort1(header1)
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
           // distancebutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
        
        }
        for var i = 0; i < header1.count ; i++
        {
            header1[i].bool1 = false
            
        }
        
        tableview1.reloadData()


        
    }
    
    
    @IBAction func distancesort(sender: AnyObject)
    {
  
    }
    
    

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

           // getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=2&records=15&query=\(trimmedString)")

            selectedliqor = selectedCell1.textLabel!.text
            isliqtextfieldhasdata = true
            if iscitytextfieldhavedata == true && isliqtextfieldhasdata == true
            {
                getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getenteredcitylat)&long=\(getenteredcitylong)&km=2&records=10&query=\(trimmedString)")
            }
            else
            {
                
                getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=2&records=10&query=\(trimmedString)")
                println(trimmedString)
            }

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

                            var happy_hour_start1 = happy_hour_start
                            fstobj1.happystart = happy_hour_start1
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {

                            var happy_hour_end1 = happy_hour_end
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
                            if let res_place = resInfo["res_place"] as? String
                            {
                                fstobj1.Place = res_place
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
                                //var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                                        var pint_price = pint_price.toInt()
                                        liqobj1.pint = pint_price
                                    }
                                    if let bottle_price = one["bottle_price"] as? String
                                    {
                                        var bottle_price = bottle_price.toInt()
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

                            var happy_hour_start2 = happy_hour_start
                            vodkaobjnew.vodkahappystart = happy_hour_start2

                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {

                            var happy_hour_end2 = happy_hour_end
                            vodkaobjnew.vodkahappyend = happy_hour_end2
 
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            vodkaobjnew.vodkaishappy = is_happy_hour
               
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
                         
                            }
                            if let res_place = resInfo["res_place"] as? String
                            {
                                vodkaobjnew.address = res_place
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                getrestlatitudevodka = string.doubleValue
                                vodkaobjnew.Restaurantlatitudevodka = getrestlatitudevodka
                                
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let mySwiftString = res_long
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                getrestlongitudevodka = string.doubleValue
                                vodkaobjnew.Restaurantlongitudevodka = getrestlongitudevodka
           
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                                var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude , longitude: getdevicelongitude)
                                //var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                            }
                        }
                        headerfortableview.append(vodkaobjnew)
                        println(headerfortableview.count)
   
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
                  newvodkaarray = header1
                tableview1.reloadData()
            }
            header1 = pricesort1(header1)
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
                destination.togglebeer = togglevodka
                destination.getcitylatitude = getcitylatitude
                destination.getcitylongitude = getcitylongitude
                destination.getdevicelatitude = getdevicelatitude
                destination.getdevicelongitude = getdevicelongitude
                destination.selectedliqor = selectedliqor
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
    
    @IBAction func getdeals(sender: UIButton) {
        performSegueWithIdentifier("Dealsnearfromvodka", sender: self)
    }
    
    
    func pricesort1 (var array:[Restauarantvodka]) -> [Restauarantvodka]
    {
        for var i: Int = 0; i < array.count - 1; i++
        {
            for var j: Int = i + 1; j < array.count; j++
            {
                println(j)
                if (array[j].avgprice < array[i].avgprice && array[j].avgprice > 0)
                {
                    
                    let temp = array[j]
                    println(temp.avgprice)
                    array[j] = array[i]
                    println(array[j].avgprice)
                    array[i] = temp
                    println(array[i].avgprice)
                }
                else if (array[i].avgprice == 0 && array[j].avgprice > 0)
                {
                    let temp = array[i]
                    array[i] = array[j]
                    array[j] = temp

                }
            }
        }
        return array
        
    }
    @IBAction func backbutton(sender: UIButton)
    {
//         func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//           {
//   
//        }
        
        performSegueWithIdentifier("Back", sender: self)

    }
    
    func makecolor(header1:[Restauarantvodka],newvodkaarray:[Restauarantvodka]) -> [Restauarantvodka]
    {
        for var i = 0;i < header1.count ; i++
        {
            header1[i].color = true
            println(header1[i].color)
            print(header1.count)
            for var j = 0; j < newvodkaarray.count; j++
            {
                print(newvodkaarray.count)
                if header1[i].restnamevodka == newvodkaarray[j].restnamevodka
                {
                    println(header1[i].restnamevodka)
                    println(newvodkaarray[i].restnamevodka)
                    header1[i].color = false
                 
                }

            }
        }
        
        return header1
    }
    
    
    
    //Hides status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func phonebuttonclicked(sender: UIButton, forEvent event: UIEvent)
    {
        self.tableview1.userInteractionEnabled = false
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            phoneview.frame = CGRectMake(p!.x - 180 ,p!.y + 17,190,80)
            phoneview.hidden = false

            
            
        }
    }
    
    @IBAction func call1buttonclicked(sender: UIButton)
    {
        callNumber("8722289471")
    }
    
    @IBAction func call2buttonclicked(sender: UIButton)
    {
        callNumber("8892640540")
    }
    func callNumber(phoneNumber:String)
    {
        UIApplication.sharedApplication().openURL(NSURL(string:"tel://"+"\(phoneNumber)")!)
        
    }
    
    @IBAction func closephonepopupbuttonclicked(sender: UIButton)
    {
        self.tableview1.userInteractionEnabled = true
         phoneview.hidden = true
    }
    
    
    @IBAction func locationpopupclicked(sender: UIButton, forEvent event: UIEvent)
    {
        self.tableview1.userInteractionEnabled = false
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
             locationpopupview.frame = CGRectMake(p!.x - 150,p!.y + 17,170,80)
            locationpopupview.hidden = false

    }
}
    
    @IBAction func locationclosebuttonclicked(sender: UIButton)
    {
        self.tableview1.userInteractionEnabled = true
        locationpopupview.hidden = true
    }
    
    
    
}

    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

