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
    
    var PleaseWaitlabel1 = UILabel()
    var actInd1 : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
    @IBOutlet weak var sortbyfont: UILabel!
    @IBOutlet weak var happyhoursfont: UILabel!
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
    

    @IBOutlet weak var pricebutton: UIButton!

    @IBOutlet var mainviewvodka: UIView!
    
    var pricebuttonclicked = false
    var distancevodkabuttonclicked = false
    
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
    

   
 //   @IBOutlet weak var citynametextfieldforvodka: AutoCompleteTextField2!
    var locationManager1: CLLocationManager!
    var currentlocationname:String!
    var iscitytextfieldhavedata = false
    private var connection:NSURLConnection?
    private let googleMapsKey = "AIzaSyC8fGPXIWXTKJNvkBvKszetkDYbqh5AtC0"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
    var getenteredcitylat:Double!
    var getenteredcitylong:Double!
    private var responseData:NSMutableData?
    //@IBOutlet weak var newtableviewforvodka: UITableView!
  
  //  @IBOutlet weak var newtextfieldvodka: UITextField!
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
    var fstobj2 = Restauarantcocktail()
    var vodkaobjnew = Restauarantvodka()
    var restlat:Double!
    var restlong:Double!
    
    var getliqnamefromresult:String!
    
    var count = 0
    
    var newvodkaarray:[Restauarantvodka] = [Restauarantvodka]()
    
    var newtrimmedstring:String!
    
    
    var liqnamefromtableview:String!

    
    var DynamicViewvodka=UIView()
     var addresslabel: UILabel = UILabel()
    var newrestnamefromtagvodka:String!
     var newaddress:String!
    
    var one:Int!
    var two:Int!
   // var countvlaues:Int!
    
    var lookfurtheboolean = false
    let closelocationpopupbutton5kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let closelocationpopupbutton7kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let closelocationpopupbutton2kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let imagewi2kmrhradius = UIImage(named: "LookFurthe2kmrwithradius") as UIImage?
    let imagewi5kmrhradius = UIImage(named: "Lookfurther5withradius") as UIImage?
    let imagewi7kmrhradius = UIImage(named: "lookfurther7withradius") as UIImage?
    
    let imageName5 = UIImage(named: "lookfurther5") as UIImage?
    let imageName7 = UIImage(named: "lookfurther7") as UIImage?
    let imageName2 = UIImage(named: "Lookfurther2") as UIImage?
    
    @IBOutlet weak var lookfurtherdefault: UIButton!
    
    
    var showdropdownview=UIView()
    var newtextfieldtableviewcity = AutoCompleteTextField2()
    let locationdisplaybutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
      var newtextfieldtableview = UITextField()
    var liqdropdowntableview: UITableView  =   UITableView()
    
    
    @IBOutlet weak var citynamedisplaybutton: UIButton!
    
    @IBOutlet weak var liqnamedisplaybutton: UIButton!
    
    @IBOutlet weak var dealsnearyou: UIButton!
    var space = " "
    var near = "Near"
    var beerTypefromtextfield:String!
    
    
    
    var locationnamefromtextfield:String!
    var liqtypefromTextfield:String!
    var localityfromtextfield1:String!
    
    var citylat:Double!
    var citylong:Double!
    
    var localityFromtextfield:String!
    
    
    var citylatitudefFomresult:Double!
    var citylongitudeFromresult:Double!
    var liqtypeFromresult:String!
    var liqFromresult:String!
    var hstart = "00:00 - 00:00"
    
    var liqplacedisplaylabel = UILabel()
    var beerdropdowntableview = UITableView()
    var beerTypedropdowntableview = UITableView()
    var dropdowntextfield = UITextField()
    var citydropdowntextfield = UITextField()
    var citydropdowntableview = UITableView()
     var search   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    var liqTypes: [String] = ["Beer", "Rum", "Whiskey","Vodka","Cocktail"]
    var liqTypes1:[String] = [String]()
     var items: [String] = ["Delhi", "Gurgaon", "Noida"]
    

    var restlatitude: Double!
    var restlongitude: Double!
    
    @IBOutlet weak var shadowimage: UIImageView!
    
    var head3:[Restauarantcocktail] = [Restauarantcocktail]()
    
    var devicelatitude:Double!
    var devicelongitude:Double!
    
    var actInd2 : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
    var PleaseWaitlabel2 = UILabel()
    
    override func viewDidLoad()
  
    {
         println(liqtypeFromresult)
         println(liqFromresult)
        
        self.happyhoursfont.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        self.sortbyfont.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "TableviewTapped:")
        tableview1.addGestureRecognizer(headerTapped)
        beerdropdowntableview.hidden = true
        beerTypedropdowntableview.hidden = true
        citydropdowntableview.hidden = true
        
        var tracker2:GAITracker = GAI.sharedInstance().defaultTracker as GAITracker
        tracker2.set(kGAIScreenName, value:"Vodka Screen")
        
        citynamedisplaybutton.setTitle(liqtypefromTextfield + space + near + space + locationnamefromtextfield, forState: .Normal)
        citynamedisplaybutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        

        citynamedisplaybutton.layer.cornerRadius = 10
        dealsnearyou.hidden = true
       // lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
         array3 = header1
        // countvlaues = array3.count
        println(array3.count)
      ///  searchbutton.setTitle("Search", forState: .Normal)
     // searchbutton.titleLabel?.text = "Search"
       // searchbutton.titleLabel?.textColor = UIColor.whiteColor();
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

        liqdropdowntableview.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        liqdropdowntableview.layer.borderWidth = 2
        newtextfieldtableview.text = "  " + selectedliqor
        liqnamedisplaybutton.setTitle("\(selectedliqor)", forState: .Normal)
        locationdisplaybutton.setTitle("\(getselectedcityname)", forState: .Normal)
        
        println(getcitylongitude)
        
        liqdropdowntableview.delegate = self
        liqdropdowntableview.dataSource = self
        newtextfieldtableview.delegate = self
       
        liqdropdowntableview.hidden = true
        
        liqdropdowntableview.tag = 0
        tableview1.tag = 1
        newtextfieldtableview.tag = 2
         newtextfieldtableviewcity.tag = 3

        
        autocompleteUrls = [String]()
        configureTextField()
        handleTextFieldInterfaces()
        
        //getdealsbutton.layer.cornerRadius = 10
        //getdealsbutton.setBackgroundImage(delasimage, forState: .Normal)
        pricebutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
        vodkasort = header1
      //  popupviewvodka.layer.cornerRadius = 20.0
        super.viewDidLayoutSubviews()
//        let tap = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap:"))
//        mainviewvodka.addGestureRecognizer(tap)
//        
//        let tap1 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
//       // popupviewvodka.addGestureRecognizer(tap)
//        let tap2 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
//      //  phoneview.addGestureRecognizer(tap2)
//        let tap3 = UITapGestureRecognizer(target: self, action: Selector("handleFrontTap1:"))
    //    locationpopupview.addGestureRecognizer(tap3)
        
        self.tableview1.delegate = self
        self.tableview1.dataSource = self

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

        newtextfieldtableviewcity.textFieldWidth = newtextfieldtableviewcity.frame.width
        newtextfieldtableviewcity.delegate = self
        newtextfieldtableviewcity.text = getselectedcityname
        
        header1 = pricesort1(header1)

        



        
    }
    
    func TableviewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        //locationp.hidden = true
        DynamicViewvodka.hidden = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
       // locatiopopupview.hidden = true
        DynamicViewvodka.hidden = true
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
//            if let street = placeMark.addressDictionary["Thoroughfare"] as? NSString {
//                println(street)
//                self.currentlocationname = street as String
//                
//                self.newtextfieldtableviewcity.text = street as String
//                
//            }
            if let p: AnyObject = placemarks?.last {
                
                //Unwrapping Optional Strings.
                let roadno = p.subThoroughfare ?? ""
                
                //Checking if subThoroughfare exists.
                if(p.subThoroughfare != nil) {
                    
                    //Unwrapping Optional Strings.
                    let thoroughfare = p.thoroughfare ?? ""
                    let subLocality = p.subLocality ?? ""
                    let locality = p.locality ?? ""
                    let administrativeArea = p.administrativeArea ?? ""
                    let postalCode = p.postalCode ?? ""
                    let country = p.country ?? ""
                    
                    let address = " \(roadno) \r \(thoroughfare) \r \(subLocality) \r \(locality) \(administrativeArea) \(postalCode) \r \(country)"
                    print(address)
                    
                    //Assigning the address to the address label on the map.
                    // self.addressLabel.text = " \(roadno) \r \(thoroughfare) \r \(subLocality) \r \(locality) \(administrativeArea) \(postalCode) \r \(country)"
                    self.newtextfieldtableviewcity.text = subLocality + ", " +  locality
                }
            }

            
        })
    }
    private func configureTextField()
    {
        newtextfieldtableviewcity.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        newtextfieldtableviewcity.autoCompleteTextFont = UIFont(name: "MyriadPro-Regular", size:11)
        newtextfieldtableviewcity.autoCompleteCellHeight = 35.0
        newtextfieldtableviewcity.maximumAutoCompleteCount = 20
        newtextfieldtableviewcity.hidesWhenSelected = true
        newtextfieldtableviewcity.hidesWhenEmpty = true
        newtextfieldtableviewcity.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "MyriadPro-Regular", size:11)
        newtextfieldtableviewcity.autoCompleteAttributes = attributes
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
        newtextfieldtableviewcity.onTextChange = {[weak self] text in
            if !text.isEmpty{
                if self!.connection != nil
                {
                    self!.connection!.cancel()
                    self!.connection = nil
                }
                let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyC45IqTyfdeO5SzyLDGAVWiwADSSv70S6g&input={\(self!.citydropdowntextfield.text)}\(text)&types=(regions)&components=country:IN"
                let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
                if url != nil{
                    let urlRequest = NSURLRequest(URL: url!)
                    self!.connection = NSURLConnection(request: urlRequest, delegate: self)
                }
            }
        }
        newtextfieldtableviewcity.onSelect = {[weak self] text, indexpath in
            println(text)
            self!.newtextfieldtableviewcity.text = text;
            self!.locationnamefromtextfield = self!.newtextfieldtableviewcity.text
            self!.iscitytextfieldhavedata = true;
            self!.liqtypefromTextfield = self!.newtextfieldtableview.text
            self!.liqFromresult = self!.newtextfieldtableview.text
            
           // self!.onselect()
            //self!.citynamedisplaybutton.setTitle(self!.newtextfieldtableview.text + self!.space + self!.near + self!.space + self!.newtextfieldtableviewcity.text, forState: .Normal)
            
            
            self!.view.endEditing(true);self!.getselectedcityname = text
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil
                {
                    let coordinate = placemark!.location.coordinate
                    self!.getenteredcitylat = coordinate.latitude
                    self!.getenteredcitylong = coordinate.longitude
                    println(self!.getenteredcitylat)
                    println(self!.getenteredcitylong)
                    
//                    var text = self!.newtextfieldtableviewcity.text
//                    var locate = self!.localityFromtextfield + text
//                    
//                    
//                    println(locate)
//                    var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//                    println(locate1)
//                    
//                       self!.getgoogledata("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
                    


                    
                }
            })
        }
    }
    
    func onselect()
    {
        var text1 = self.newtextfieldtableviewcity.text
        var locate = self.localityFromtextfield + text1
        
        println(self.newtextfieldtableviewcity.text)
        println(self.localityFromtextfield)
        
        
        println(locate)
        var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        println(locate1)
        
        self.getgoogledata("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
        
    }
    
    func getgoogledata(urlString:String)
    {
        let url = NSURL(string: urlString)
        println(urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_googlejson(data)
            })
        }
        task.resume()
    }
    func getgoogledata1(urlString:String)
    {
        let url = NSURL(string: urlString)
        println(urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_googlejson1(data)
            })
        }
        task.resume()
    }
    
    
    
    func extract_googlejson(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary
        {
            if let results = json["results"] as? NSArray
            {
                for var i = 0; i < results.count; i++
                {
                    if let one = results[i] as? NSDictionary
                    {
                        if let geometry = one["geometry"] as? NSDictionary
                        {
                            // for var j = 0; j < geometry.count; j++
                            //  {
                            if let location = geometry["location"] as? NSDictionary
                            {
                                
                                if let lat = location["lat"] as? Double
                                {
                                    citylat = lat
                                    citylatitudefFomresult = lat
                                    println(citylat)
                                }
                                if let lng = location["lng"] as? Double
                                {
                                    citylong = lng
                                    citylongitudeFromresult = lng
                                    println(citylong)
                                }
                                
                                
                                
                             
                            }
                        }
                    }
                }
                
                ApiCall()
                
            }
            
        }
    }
    
    func extract_googlejson1(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary
        {
            if let results = json["results"] as? NSArray
            {
                for var i = 0; i < results.count; i++
                {
                    if let one = results[i] as? NSDictionary
                    {
                        if let geometry = one["geometry"] as? NSDictionary
                        {
                            // for var j = 0; j < geometry.count; j++
                            //  {
                            if let location = geometry["location"] as? NSDictionary
                            {
                                
                                if let lat = location["lat"] as? Double
                                {
                                    citylat = lat
                                    citylatitudefFomresult = lat
                                    println(citylat)
                                }
                                if let lng = location["lng"] as? Double
                                {
                                    citylong = lng
                                    citylongitudeFromresult = lng
                                    println(citylong)
                                }
                                
                                ApiCall1()
                                
                                // }
                            }
                        }
                    }
                }
                
            }
            
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
                        for var i = 0; i < locations.count ;i++
                        {
                            var newlaocations = locations[i]
                            var fullNameArr = split(newlaocations) {$0 == ","}
                            
//                            if fullNameArr.count > 1
//                            {
                               var firstName: String = fullNameArr[0]
//                               // var lastName: String = fullNameArr[1]
                               locations[i] = firstName
//
//                            }
//                            else
//                            {
//                                 var firstName: String = fullNameArr[0]
//                                 locations[i] = firstName
//                                
//                            }

                          
                            
                        }
                        self.newtextfieldtableviewcity.autoCompleteStrings = locations
                    }
                }
                else{
                    self.newtextfieldtableviewcity.autoCompleteStrings = nil
                }
            }
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        println("Error: \(error.localizedDescription)")
    }

    
    override func viewWillAppear(animated: Bool) {
        //resignFirstResponder()
        
    }
    
    @IBAction func press2revealPressed(sender: UIButton) {
        
      //  popupviewvodka.hidden = false
     //   tableview1.userInteractionEnabled = false
      //  takerestaurantname.text = "I just got a 10 % discount at \(header1[sender.tag].restnamevodka) Through Bottomz Up"
        
    }
    

    @IBAction func Press2revell(sender: UIButton, forEvent event: UIEvent)
    {
        
       // self.tableview1.userInteractionEnabled = false
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
        if tableview.tag == 1
        {
        
        return header1.count
        }
        else if tableview.tag == 4
        {
            return 1
        }
        else if tableview.tag == 6
        {
            return 1
        }
        else if tableview.tag == 9
        {
            return 1
        }
        
        else{
            return 1
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 1
        {
        if header1[section].bool1 == true
        {
        return 1
        }
        else
        {
            return 0
        }
        }
        else if tableView.tag == 4
        {
            return liqTypes.count
        }
            
        else if tableView.tag == 6
        {
            return liqTypes1.count
        }
            
        else if tableView.tag == 9
        {
            return items.count
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
            cells.locationicon.tag = indexPath.section
            cells.press2reveal.hidden = true
        cells.liquors = [liqvodka]()
        cells.liquors = header1[indexPath.section].vodkaarray
        cells.press2reveal.tag = indexPath.section
        //cells.directions.setTitle(header1[indexPath.section].distancevodka, forState: UIControlState.Normal)
        cells.distancenewvodkalabel.text = header1[indexPath.section].distancevodka
            cells.distancenewvodkalabel.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
        cells.tableView.reloadData()
         cells.arrowup.tag = indexPath.section
         cells.Hotelname.text = header1[indexPath.section].restnamevodka
            cells.Hotelname.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
            cells.address.text = header1[indexPath.section].restaddress
            cells.address.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
            cells.happyhours.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
            cells.happyhourstiming.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
          //  cells.addressLabel.text = header1[indexPath.section].address
            newaddress = header1[indexPath.section].restaddress
            cells.happyhourstiming.text = header1[indexPath.section].vodkahappystart + " - " + header1[indexPath.section].vodkahappyend
            if cells.happyhourstiming.text! == hstart
            {
                cells.happyhourstiming.hidden = true
                cells.happyhours.hidden = true
            }
            else
            {
                cells.happyhourstiming.hidden = false
                cells.happyhours.hidden = false
            }
           // cells.tableview1.reloadData()
        return cells
        }
        else if tableView.tag == 4
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
            cell.textLabel?.text = self.liqTypes[indexPath.row]
            cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
            cell.textLabel?.textColor = UIColor.darkGrayColor()
            
            return cell
        }
            
        else if tableView.tag == 6
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
            cell.textLabel?.text = self.liqTypes1[indexPath.row]
            cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
             cell.textLabel?.textColor = UIColor.darkGrayColor()
            
            return cell
            
        }
            
        else if tableView.tag == 9
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
             cell.textLabel?.textColor = UIColor.darkGrayColor()
            
            return cell
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
            cell!.textLabel?.font = UIFont(name: "MyriadPro-Regular", size:fontsizenew)
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
        if tableView.tag == 1
        {
            println(header1[indexPath.section].vodkaarray.count)
           return CGFloat(header1[indexPath.section].vodkaarray.count * 16 + 165)
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
               return 82
            }
            else
            {
                return 82
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
            headerCell.addressLabel.font = UIFont(name: "MyriadPro-Regular", size: fontsizenew)
            
            if header1.count >= 5
            {
                shadowimage.hidden = false
                headerCell.shadowimage.hidden = true
            }
            else if header1.count < 5
            {
               // println(section)
               // println(head.count)
                // section = section + 1
                // var nor  = head.count
                if section == header1.count - 1
                {
                    headerCell.shadowimage.hidden = false
                    shadowimage.hidden = true
                }
                else
                {
                    headerCell.shadowimage.hidden = true
                }
            }
        headerCell.vodkarestaurantname.text = header1[section].restnamevodka
               // println(header1[section].address)
        headerCell.addressLabel.text = header1[section].address
              //  addressLabel.text = header1[section].address
        if header1[section].avgprice == 0
        {
            headerCell.vodkaavgprice.text = "--"
        }
         else
        {
            headerCell.vodkaavgprice.text = "\(header1[section].avgprice)"
            
        }

        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.taprecognizerimage.addGestureRecognizer(headerTapped1)
        headerCell.taprecognizerimage.tag =  section
        headerCell.taprecognizerimage.userInteractionEnabled = true
        
        
        headerCell.mapbuttonvodkaclass.tag = section
        headerCell.mapbuttonvodkaclass.setTitle(header1[section].distancevodka, forState: UIControlState.Normal)
        headerCell.mapbuttonvodkaclass.enabled =  false
        
        headerCell.vodkarestaurantname.font = UIFont(name: "MyriadPro-Regular", size: fontsizenew)
        headerCell.vodkaavgprice.font = UIFont(name: "MyriadPro-Bold", size: fontsizenew)
        headerCell.mapbuttonvodkaclass.titleLabel?.font = UIFont(name: "MyriadPro-Regular", size: fontsizenew)
        var happyhourstiming = header1[section].vodkahappystart + " - " + header1[section].vodkahappyend
            println(happyhourstiming)
            println(hstart)
        //headerCell.Happyhourlabelbeforeexpantion.text = "Happy Hours " + happyhourstiming

         var screensize = self.view.frame.width
            
        if header1[section].vodkaishappy == "Yes"
        {
           

                
                var happyhourstiming1 = "Happy Hours " + happyhourstiming
                var myMutableString = NSMutableAttributedString()
                
                myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: fontsizenew)!])
                
                var length = myMutableString.length
                
                myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0), range: NSRange(location:11,length:length - 11))
                
                headerCell.Happyhourlabelbeforeexpantion.attributedText = myMutableString
                println(happyhourstiming1)
            
//            else
//            {
//                var happyhourstiming1 = "Happy Hours\n" + happyhourstiming
//                var myMutableString = NSMutableAttributedString()
//                
//                myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: 11.0)!])
//                var length = myMutableString.length
//                println(length)
//                myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0), range: NSRange(location:11,length:length - 11))
//                
//                println(myMutableString)
//                
//                headerCell.Happyhourlabelbeforeexpantion.attributedText = myMutableString
//                println(happyhourstiming1)
//            }

        }
        else
        {
         
       
                
                var happyhourstiming1 = "Happy Hours " + happyhourstiming
                var myMutableString = NSMutableAttributedString()
                
                myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: fontsizenew)!])
                
                myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSRange(location:0,length:myMutableString.length))
                
                headerCell.Happyhourlabelbeforeexpantion.attributedText = myMutableString
                println(happyhourstiming1)
            
//            else
//            {
//                var happyhourstiming1 = "Happy Hours\n" + happyhourstiming
//                var myMutableString = NSMutableAttributedString()
//                
//                myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: 11.0)!])
//                
//                myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSRange(location:0,length:myMutableString.length))
//                
//                headerCell.Happyhourlabelbeforeexpantion.attributedText = myMutableString
//                println(happyhourstiming1)
//            }
       }
//            else
//        {
//            headerCell.Happyhourlabelbeforeexpantion.textColor = UIColor.orangeColor()
//            }
            
                if header1[section].rest_offers_happy_hour == "Yes"
                {
                    //headerCell.Happyhourlabelbeforeexpantion.hidden = false
                 //   headerCell.Happyhourtimingdisplaybeforeexpantion.hidden = false
                   // headerCell.Happyhourlabelbeforeexpantion.hidden = false
                    if happyhourstiming == hstart
                    {
                        headerCell.Happyhourlabelbeforeexpantion.hidden = true
                    }
                    else
                    {
                        headerCell.Happyhourlabelbeforeexpantion.hidden = false
                    }
                
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
        DynamicViewvodka.hidden = true
        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Tapped Hotel",action: header1[gestureRecognizer.view!.tag].restnamevodka,label: header1[gestureRecognizer.view!.tag].restnamevodka, value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])

        
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
        if header1.count == 0
        {
            shadowimage.hidden = true
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
//    @IBAction func lookfurtherforvodka(sender: AnyObject)
//    {
//        changecolorvodka = true
//       // vodkasort = header1
//       // self.tableview1.reloadData()
//        header1 = vodkasort
//        count = count + 1
//        if count == 1
//        {
//         
//            if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
//            {
//                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=10&query=\(liqvodkaname)")
//            }
//            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
//            {
//                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getenteredcitylat)&long=\(getenteredcitylong)&km=5&records=10&query=\(liqvodkaname)")
//            }
//            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
//            {
//              getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=10&query=\(trimmedString)")
//            }
//            
//            
//            
//            self.array1 = header1
//        }
//        
//        if count == 2
//        {
//            if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
//            {
//                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=10&query=\(liqvodkaname)")
//            }
//            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
//            {
//                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getenteredcitylat)&long=\(getenteredcitylong)&km=7&records=10&query=\(liqvodkaname)")
//            }
//            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
//            {
//                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=10&query=\(trimmedString)")
//            }
//
//            
//            self.array1 = header1
//        }
//        if count == 3
//        {
//            
//            let alertController = UIAlertController(title: "Do you want go back to 2 km search", message: "Press the Ok or cancel", preferredStyle: .Alert)
//            
//            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
//                self.count = 2
//                
//            }
//            alertController.addAction(cancelAction)
//            
//            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
//                self.count = 0
//                
//                if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == false
//                {
//                       self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=15&query=\(self.liqvodkaname)")
//                }
//                else if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == true
//                {
//                    self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getenteredcitylat)&long=\(self.getenteredcitylong)&km=2&records=10&query=\(self.liqvodkaname)")
//                }
//                else if self.isliqtextfieldhasdata == true && self.iscitytextfieldhavedata == false
//                {
//                    self.getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=10&query=\(self.trimmedString)")
//                }
//
//                
//             
//                self.array1 = self.header1
//            }
//            alertController.addAction(OKAction)
//            
//            self.presentViewController(alertController, animated: true) {
//                
//            }
//        }
//
//    }
    
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
                        if let res_address = resInfo["res_address"] as? String
                        {
                            getvodkaobj.restaddress = res_address
                        }

                        if let res_locality = resInfo["res_locality"] as? String
                        {
                            getvodkaobj.address = res_locality
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalatitude = string.doubleValue
                            getvodkaobj.Restaurantlatitudevodka = getvodkalatitude
                 
                            
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getvodkalongitude = string.doubleValue
                             getvodkaobj.Restaurantlongitudevodka = getvodkalongitude
                            println(getvodkalongitude)
                        }
                        if let res_phone1 = resInfo["res_phone1"] as? String
                        {
                            getvodkaobj.Phoneone = res_phone1
                        }
                        
                        if let res_phone2 = resInfo["res_phone2"] as? String
                        {
                            getvodkaobj.Phonetwo = res_phone2
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                           // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
                            var newLocation: CLLocation = CLLocation(latitude: getvodkalatitude, longitude: getvodkalongitude)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                            println(String(format: "%.2f Km", totalDistance))
                            NSLog("totalDistance: %@", String(format: "%.2f Km", totalDistance))
                            totalDistance = Double(round(10*totalDistance)/10)
                            var totalDistance1 = totalDistance.description
                            println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                           // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                            getvodkaobj.distancevodka = totalDistance1 + " Km"
                            getvodkaobj1.distancevodka = totalDistance1 + " Km"
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
               // header1 = makecolor(header1, newvodkaarray: newvodkaarray)
                
//                if count == 1
//                {
//                    one = header1.count
//                    two = countvlaues
//                }
//                else if count == 2
//                {
//                    two = header1.count
//                }
            }
            
//            if countvlaues > one
//            {
//                
//            }
//            else if one > two
//            {
//                
//            }
//            else
//            {
//                if count == 1
//                {
//                    let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
//                    alertController.addAction(UIAlertAction(title: "No New Hotels Found", style: UIAlertActionStyle.Default,handler: nil))
//                    self.presentViewController(alertController, animated: true, completion: nil)
//                }
//                    
//                else if count == 2
//                {
//                    let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
//                    alertController.addAction(UIAlertAction(title: "No New Hotels Found", style: UIAlertActionStyle.Default,handler: nil))
//                    self.presentViewController(alertController, animated: true, completion: nil)
//                }
//                else
//                {
//                    
//                }
//            }
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
            actInd1.hidden = true
        }
        else
        {
             actInd1.hidden = true
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
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
    
    
//
//    @IBAction func gotomap(sender: AnyObject) {
//        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(header1[sender.tag].Restaurantlatitudevodka),\(header1[sender.tag].Restaurantlongitudevodka)")!)
//    }
    
    @IBAction func getDiscountforvodka(sender: AnyObject)
    {
//        popupviewvodka.hidden = false
//        takerestaurantname.text = "I just got a 10 % discount at \(header1[sender.tag].restnamevodka) Through Bottomz Up"
    }
    func textFieldDidBeginEditing(textField: UITextField)
    {

        if textField.tag == 0{
            textField.selectAll(self)
            textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        else if textField.tag == 5
        {
            newtextfieldtableview.text = "All"
            dropdowntextfield.enabled = false
            beerdropdowntableview.hidden = false
            beerTypedropdowntableview.hidden = true
            citydropdowntableview.hidden = true
            AutoCompleteTextField2.autoCompleteTableView?.hidden = true
        }
        else if textField.tag == 2
        {
            AutoCompleteTextField2.autoCompleteTableView?.hidden = true
            citydropdowntableview.hidden = true
            newtextfieldtableview.enabled = false
            
            if CheckforInternetViewController.isConnectedToNetwork() == true
            {
                
                getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(dropdowntextfield.text)")
                beerTypedropdowntableview.hidden = false
                //citydropdowntableview.hidden = true
                
                
            }
            else
            {
                
                
                let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
                beerTypedropdowntableview.hidden = true
                
            }
            
        }
        else if textField.tag == 8
        {
            AutoCompleteTextField2.autoCompleteTableView?.hidden = true
            citydropdowntextfield.enabled = false
            citydropdowntableview.hidden = false
            
        }
        
            
    
    }
    
    func getliqtypes(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_jsonbeerTypes(data)
            })
        }
        task.resume()
    }
    
    func extract_jsonbeerTypes(data:NSData)
    {
        var jsonError:NSError?
        if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSDictionary
        {
            liqTypes1 = [String]()
            if let result = json["result"] as? NSArray
            {
                for var i = 0; i < result.count; i++
                {
                    if let one = result[i] as? NSDictionary
                    {
                        if let brand_name = one["brand_name"] as? String
                        {
                            liqTypes1.append(brand_name)
                        }
                    }
                }
                
            }
        }
        self.beerTypedropdowntableview.reloadData()
    }
    
    func textFieldDidChange(textField: UITextField)
    {
        
        if self.newtextfieldtableview.text != nil && self.newtextfieldtableview.text != ""
        {
            
            var s = self.newtextfieldtableview.text
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
        var substring = self.newtextfieldtableview.text
        //substring.lowercaseString
        searchAutocompleteEntriesWithSubstring(substring)
        
        //self.newtextfieldtableview.reloadData()
        
        self.liqdropdowntableview.reloadData()
        self.liqdropdowntableview.hidden = false
        
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
        //showdropdownview.hidden = true
        if tableView.tag == 0
        {
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            newtextfieldtableview.text = selectedCell1.textLabel?.text
            liqnamefromtextfield = newtextfieldtableview.text
            locationnamefromtextfield = self.newtextfieldtableviewcity.text
            liqtypefromTextfield = self.newtextfieldtableview.text
            selectedliqor = selectedCell1.textLabel!.text
            isliqtextfieldhasdata = true
            self.liqFromresult = self.newtextfieldtableview.text
            
            

            trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            citynamedisplaybutton.setTitle(self.newtextfieldtableview.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text , forState: .Normal)
       
            

       
            
            var text = self.newtextfieldtableviewcity.text
            println(self.localityFromtextfield)
            var locate = self.localityFromtextfield + text
            println(locate)
            var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            println(locate1)
            
            self.getgoogledata1("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")

            self.view.endEditing(true)
            tableView.hidden = true
        }
        else if tableView.tag == 4
        {
            citydropdowntextfield.enabled = true
            newtextfieldtableview.enabled = true
            dropdowntextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            dropdowntextfield.text = selectedCell1.textLabel?.text
            
            beerdropdowntableview.hidden = true
        }
            
        else if tableView.tag == 6
        {
            citydropdowntextfield.enabled = true
            newtextfieldtableview.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            newtextfieldtableview.text = selectedCell1.textLabel?.text
            beerTypedropdowntableview.hidden = true
        }
            
        else if tableView.tag == 9
        {
            newtextfieldtableviewcity.text = ""
            citydropdowntextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            citydropdowntextfield.text = selectedCell1.textLabel?.text
            citydropdowntableview.hidden = true
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
             head3 = [Restauarantcocktail]()
            headerfortableview = [Restauarantvodka]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
                fstobj2 = Restauarantcocktail()
               
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
                            if let res_address = resInfo["res_address"] as? String
                            {
                                fstobj1.restaddress = res_address
                            }
                            if let res_locality = resInfo["res_locality"] as? String
                            {
                                fstobj1.Place = res_locality
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
                            if let res_phone1 = resInfo["res_phone1"] as? String
                            {
                                fstobj1.Phoneone = res_phone1
                            }
                            
                            if let res_phone2 = resInfo["res_phone2"] as? String
                            {
                                fstobj1.Phonetwo = res_phone2
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
                                println(String(format: "%.2f Km", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f Km", totalDistance))
                                totalDistance = Double(round(10*totalDistance)/10)
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                               // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                
                                
                                fstobj1.distance = totalDistance1 + " Km"
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
                    else if check == "Cocktails"
                    {
                        if let pint_avg_price = bottomsUp1["pint_min_price"] as? Int
                        {
                            
                            fstobj2.minp = pint_avg_price
                            println(pint_avg_price)
                        }
                        if let bottle_avg_price = bottomsUp1["bottle_min_price"] as? Int
                        {
                            
                            fstobj2.maxp = bottle_avg_price
                        }
                        
                        if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                        {
                            
                            var happy_hour_start1 = happy_hour_start
                            
                            fstobj2.happystart = happy_hour_start1
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {
                            
                            
                            var happy_hour_end1 = happy_hour_end
                            fstobj2.happyend = happy_hour_end1
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            fstobj2.ishappy = is_happy_hour
                        }
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            fstobj2.rest_offers_happy_hour = rest_offers_happy_hour1
                        }
                        if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                        {
                            
                            
                            if let res_name = resInfo["res_name"] as? String
                            {
                                // fstobj1.restname = res_name
                                fstobj2.restname = res_name
                                // arraysring.append(res_name)
                                //println(arraysring.first)
                                
                            }
                            
                            if let res_address = resInfo["res_address"] as? String
                            {
                                //fstobj1.restaddress = res_address
                                fstobj2.restaddress = res_address
                            }
                            
                            if let res_locality = resInfo["res_locality"] as? String
                            {
                                // fstobj1.Place = res_locality
                                fstobj2.Place = res_locality
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                //convert String to Double
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restlat = string.doubleValue
                                //fstobj1.Restaurantlatitude = restlat
                                fstobj2.Restaurantlatitude = restlat
                                println(fstobj1.Restaurantlatitude)
                                println(restlat)
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let mySwiftString = res_long
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restlong = string.doubleValue
                                // fstobj1.Restaurantlongitude = restlong
                                fstobj2.Restaurantlongitude = restlong
                                println(fstobj1.Restaurantlongitude)
                                println(restlong)
                                
                                
                            }
                            if let res_phone1 = resInfo["res_phone1"] as? String
                            {
                                // fstobj1.Phoneone = res_phone1
                                fstobj2.Phoneone = res_phone1
                            }
                            
                            if let res_phone2 = resInfo["res_phone2"] as? String
                            {
                                // fstobj1.Phonetwo = res_phone2
                                fstobj2.Phonetwo = res_phone2
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                                var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                                //println(devicelatitude)
                               // println(devicelongitude)
                                //  var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
                                var newLocation: CLLocation = CLLocation(latitude: restlat, longitude: restlong)
                                println(restlat)
                                println(restlong)
                                var totalDistance: Double = 0
                                var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                                totalDistance = totalDistance + (meters / 1000)
                                println(String(format: "%.2f Km", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f Km", totalDistance))
                                totalDistance = Double(round(10*totalDistance)/10)
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                                // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                
                                
                                // fstobj1.distance = totalDistance1 + " Km"
                                fstobj2.distance = totalDistance1 + " Km"
                                println(fstobj2.distance)
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
                          
                                fstobj2.amp.append(liqobj1)
                            }
                        }
      
                        head3.append(fstobj2)
                        
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
                            
                            if let res_address = resInfo["res_address"] as? String
                            {
                                vodkaobjnew.restaddress = res_address
                            }
                            if let res_locality = resInfo["res_locality"] as? String
                            {
                                vodkaobjnew.address = res_locality
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
                            
                            if let res_phone1 = resInfo["res_phone1"] as? String
                            {
                                vodkaobjnew.Phoneone = res_phone1
                            }
                            
                            if let res_phone2 = resInfo["res_phone2"] as? String
                            {
                                vodkaobjnew.Phonetwo = res_phone2
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
                                println(String(format: "%.2f Km", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f Km", totalDistance))
                                totalDistance = Double(round(10*totalDistance)/10)
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                               // totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                vodkaobjnew.distancevodka = totalDistance1 + " Km"
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
            else if check == "Cocktails"
            {
                self.performSegueWithIdentifier("cocktail2", sender: self)
            }
            else
            {
                header1 = headerfortableview
                  newvodkaarray = header1
                tableview1.reloadData()
            }
            header1 = pricesort1(header1)
            
            showdropdownview.hidden = true
            if newtextfieldtableview.text == "All"
            {
                //self.locationnamedisplaybutton.setTitle(self.dropdowntextfield.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text ,forState: .Normal)
                citynamedisplaybutton.setTitle(dropdowntextfield.text + space + near + space + locationnamefromtextfield, forState: .Normal)
            }
            else
                
            {
                // self.locationnamedisplaybutton.setTitle(self.newtextfieldtableview.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text ,forState: .Normal)
                citynamedisplaybutton.setTitle(liqtypefromTextfield + space + near + space + locationnamefromtextfield, forState: .Normal)
            }
            actInd2.hidden = true
        }
        else
        {
            actInd2.hidden = true
            showdropdownview.hidden = false
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotobeersegue"
        {
            if let destination = segue.destinationViewController as? tableviewclass
            {
                destination.liqvodkaname = newtextfieldtableview.text
                var liqvodkaname = newtextfieldtableview.text
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
                
                destination.liqtypefromTextfield = liqtypefromTextfield
                destination.locationnamefromtextfield = locationnamefromtextfield
                
                destination.localityFromtextfield = localityFromtextfield
                
                destination.liqFromresult = newtextfieldtableview.text
                destination.citylatitudefFomresult = citylat
                destination.citylongitudeFromresult = citylong
                destination.localityfromtextfield1 = citydropdowntextfield.text
                destination.liqtypeFromresult = dropdowntextfield.text
                
                
                
            }
        }
        
        if segue.identifier == "cocktail2"
        {
            if let destination3 = segue.destinationViewController as? Cocktail
            {
                //28.63875
                //77.07380
                destination3.liqname = newtextfieldtableview.text
                var liqname = newtextfieldtableview.text
                destination3.header2 = head3
                
                destination3.beerTypefromtextfield = beerTypefromtextfield
                destination3.selectedliqor = newtextfieldtableview.text
                destination3.getdevicelatitude = getdevicelatitude
                destination3.getdevicelongitude = getdevicelongitude
                destination3.getcitylatitude = citylat
                destination3.getcitylongitude = citylong
                destination3.getrestlatitudebeer = restlat
                destination3.getdevicelongitude = restlong
                
                destination3.getfstobj1 = fstobj1
                destination3.getselectedcityname = getselectedcityname
                destination3.checkliqtype = check
                //destination3.vodkaarray = header
                // destination3.getrestlatitudevodka = restvodkalat
                ////destination3.getrestlongitudevodka = restvodkalang
                //  println(autocompletedTextfieldnew.text)
                
                destination3.locationnamefromtextfield = newtextfieldtableviewcity.text
                destination3.liqtypefromTextfield = dropdowntextfield.text
                destination3.localityFromtextfield = citydropdowntextfield.text
                destination3.citylatitudefFomresult = citylat
                destination3.citylongitudeFromresult = citylong
                destination3.liqtypeFromresult = dropdowntextfield.text
                destination3.liqFromresult = newtextfieldtableview.text
                destination3.localityfromtextfield1 = citydropdowntextfield.text
                destination3.liqtypeFromresult = dropdowntextfield.text
            }
        }
        
        if segue.identifier == "getwinenearyoufromvodka"
        {
            if let destination1 = segue.destinationViewController as? mapview
            {
                destination1.newlocate = locationnamefromtextfield
                
                destination1.getdevicelatitude = getdevicelatitude
                destination1.getdevicelongitude = getdevicelongitude
            }
        }
    }

    @IBAction func arrowup(sender: UIButton)
    {
        DynamicViewvodka.hidden = true
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
    
//    func makecolor(header1:[Restauarantvodka],newvodkaarray:[Restauarantvodka]) -> [Restauarantvodka]
//    {
//        for var i = 0;i < header1.count ; i++
//        {
//            header1[i].color = true
//            println(header1[i].color)
//            print(header1.count)
//            for var j = 0; j < newvodkaarray.count; j++
//            {
//                print(newvodkaarray.count)
//                if header1[i].restnamevodka == newvodkaarray[j].restnamevodka
//                {
//                    println(header1[i].restnamevodka)
//                    println(newvodkaarray[i].restnamevodka)
//                    header1[i].color = false
//                 
//                }
//
//            }
//        }
//        
//        return header1
//    }
    
    
    
    //Hides status bar
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func phonebuttonclicked(sender: UIButton, forEvent event: UIEvent)
    {
        
        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Contact details",action: header1[sender.tag].Phoneone,label: header1[sender.tag].Phonetwo, value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])
       // self.tableview1.userInteractionEnabled = false
        let buttonView = sender as UIView;
        let imageName = "Popbackground.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.DynamicViewvodka=UIView(frame: CGRectMake(self.view.frame.origin.x + 60 ,p!.y + 15,self.view.frame.width * 0.5,90))
            imageView.frame = CGRect(x: 0,y: 0,width: DynamicViewvodka.frame.width,height: DynamicViewvodka.frame.height)
            
            let closelocationpopupbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            closelocationpopupbutton.frame = CGRectMake(DynamicViewvodka.frame.width-35 ,DynamicViewvodka.frame.height/2 - 13,25,25)
            closelocationpopupbutton.addTarget(self, action: "popupbuttonclickedclosed:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            closelocationpopupbutton.setBackgroundImage(image1, forState: .Normal)
            
            
            let Findongooglemapsbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            Findongooglemapsbutton.frame = CGRectMake(0,45,DynamicViewvodka.frame.width - 30,30)
            Findongooglemapsbutton.addTarget(self, action: "call1:", forControlEvents: UIControlEvents.TouchUpInside)
            Findongooglemapsbutton.setTitle("8722289471", forState: .Normal)
            Findongooglemapsbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 14)
            
            let Findongooglemapsbutton1 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            Findongooglemapsbutton1.frame = CGRectMake(0,15,DynamicViewvodka.frame.width - 30,30)
            Findongooglemapsbutton1.addTarget(self, action: "call2:", forControlEvents: UIControlEvents.TouchUpInside)
            Findongooglemapsbutton1.setTitle("8892640540", forState: .Normal)
            Findongooglemapsbutton1.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 14)
            
            self.view.addSubview(DynamicViewvodka)
            self.DynamicViewvodka.addSubview(imageView)
            self.DynamicViewvodka.addSubview(closelocationpopupbutton)
            self.DynamicViewvodka.addSubview(Findongooglemapsbutton)
            self.DynamicViewvodka.addSubview(Findongooglemapsbutton1)
 
        }
    }
    
    func popupbuttonclickedclosed(sender: UIButton)
    {
        DynamicViewvodka.hidden = true
        self.tableview1.userInteractionEnabled = true
    }
    

    func call1(sender:UIButton)
    {
      callNumber("8722289471")
    }
    
    func call2(sender:UIButton)
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
        // phoneview.hidden = true
    }
    
    
    @IBAction func locationpopupclicked(sender: UIButton, forEvent event: UIEvent)
    {
        restlatitude = header1[sender.tag].Restaurantlatitudevodka
        restlongitude = header1[sender.tag].Restaurantlongitudevodka
        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Location Name",action: "Location Name",label: "Location Name", value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])
     // self.tableview1.userInteractionEnabled = false
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            let imageName = "Popbackground.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.DynamicViewvodka = UIView(frame: CGRectMake(p!.x - 140,p!.y + 20,165,95))
            imageView.frame = CGRect(x: 0,y: 0,width: DynamicViewvodka.frame.width,height: DynamicViewvodka.frame.height)
            
            let closelocationpopupbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            closelocationpopupbutton.frame = CGRectMake(DynamicViewvodka.frame.width-27 ,DynamicViewvodka.frame.height/2 - 10,16,16)
            closelocationpopupbutton.addTarget(self, action: "locationpopupclosebuttontouchedbuttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            closelocationpopupbutton.setBackgroundImage(image1, forState: .Normal)
            
            //  var addresslabel: UILabel = UILabel()
            self.addresslabel.frame = CGRectMake(10, 5, DynamicViewvodka.frame.width - 25, 35)
            self.addresslabel.textColor = UIColor.blackColor()
            self.addresslabel.textAlignment = NSTextAlignment.Left
            self.addresslabel.text = newaddress
            self.addresslabel.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            self.addresslabel.numberOfLines = 3
            
            
            let Findongooglemapsbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            Findongooglemapsbutton.frame = CGRectMake(0,50,DynamicViewvodka.frame.width - 30,30)
            Findongooglemapsbutton.addTarget(self, action: "gotomapgoogle:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var text = "Find on Google Maps"
            var titleString : NSMutableAttributedString = NSMutableAttributedString(string: text)
            titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0,19))
           // titleString.addAttribute(text, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, 18))
            
            Findongooglemapsbutton.setAttributedTitle(titleString, forState: .Normal)
            Findongooglemapsbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 11)
            
            
            self.view.addSubview(DynamicViewvodka)
            self.DynamicViewvodka.addSubview(imageView)
            self.DynamicViewvodka.addSubview(closelocationpopupbutton)
            self.DynamicViewvodka.addSubview(self.addresslabel)
            self.DynamicViewvodka.addSubview(Findongooglemapsbutton)



    }
}
    
    func locationpopupclosebuttontouchedbuttonTouched(sender: UIButton)
    {
        self.tableview1.userInteractionEnabled = true
        self.DynamicViewvodka.hidden = true
    }
    
    func gotomapgoogle(sender: UIButton)
    {
      // UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(restlatitude),\(restlongitude)")!)
        
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=13.043148,77.570403&daddr=\(restlatitude),\(restlongitude)")!)
    }

    @IBAction func lookfurthernew(sender: UIButton, forEvent event: UIEvent)
    {
        if lookfurtheboolean == false
            {
                lookfurtheboolean = true
                println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        
        
        
        let buttonView = sender as UIView;
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            
            
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.DynamicViewvodka = UIView(frame: CGRectMake(p!.x - 38,p!.y - 270,75,230))
            
            if lookfurtheboolean == true
            {
                DynamicViewvodka.hidden = false
            }
            else
            {
                DynamicViewvodka.hidden = true
            }
            
            var tag = sender.tag
            
            switch (tag)
            {
                
                
//            case 1:
//                closelocationpopupbutton7kms.frame = CGRectMake(0,0,75,75)
//                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
//                closelocationpopupbutton7kms.tag=7
//                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
//                
//                
//                
//                closelocationpopupbutton5kms.frame = CGRectMake(0,75,75,75)
//                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
//                closelocationpopupbutton5kms.tag=5
//                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
//                
//                
//                closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
//                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
//                closelocationpopupbutton2kms.tag=2
//                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
//                
//                self.view.addSubview(DynamicViewvodka)
//                self.DynamicViewvodka.addSubview(closelocationpopupbutton7kms)
//                self.DynamicViewvodka.addSubview(closelocationpopupbutton5kms)
//                self.DynamicViewvodka.addSubview(closelocationpopupbutton2kms)
                
                
                
                
                
            case 2:
                closelocationpopupbutton7kms.frame = CGRectMake(0,75,70,70)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,150,70,70)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                self.view.addSubview(DynamicViewvodka)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton7kms)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton5kms)
                
                
            case 5:
                closelocationpopupbutton7kms.frame = CGRectMake(0,75,70,70)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,150,70,70)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                self.view.addSubview(DynamicViewvodka)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton7kms)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton2kms)
                
            case 7:
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,75,70,70)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,150,70,70)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                self.view.addSubview(DynamicViewvodka)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton5kms)
                self.DynamicViewvodka.addSubview(closelocationpopupbutton2kms)
                
            default: return
            }
            

        }
 
        
    }
    
    
    func lookfurtherfor2KMS(sender: UIButton)
    {
        PleaseWaitlabel1 = UILabel(frame: CGRectMake(0,20, 150, 100))
        PleaseWaitlabel1.text = "Please Wait..."
        self.actInd1.center = self.view.center
        self.actInd1.hidesWhenStopped = true
        self.actInd1.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.actInd1.color = UIColor.blackColor()
        view.addSubview(actInd1)
        self.actInd1.startAnimating()
        self.actInd1.addSubview(PleaseWaitlabel1)
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        selectedliqor = trimmedString1
        
        var tag = sender.tag
        
        switch(tag){
        case 2:
            //call 2km api
            count = 1
            println(liqFromresult)
            println(citylatitudefFomresult)
            println(citylongitudeFromresult)
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
            }

            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header1
            
        case 5:
             count = 2
             println(liqFromresult)
             println(citylatitudefFomresult)
             println(citylongitudeFromresult)
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                println(citylatitudefFomresult)
                println(citylongitudeFromresult)
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
             }

            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header1
            
        case 7:
             count = 3
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
             }

            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header1
            
        default: return
            
        }
        
        //self.array1 = self.header1
        self.DynamicViewvodka.hidden = true

    }
    
    
    
    
    func lookfurtherfor5KMS(sender: UIButton)
    {
        PleaseWaitlabel1 = UILabel(frame: CGRectMake(0,20, 150, 100))
        PleaseWaitlabel1.text = "Please Wait..."
        self.actInd1.center = self.view.center
        self.actInd1.hidesWhenStopped = true
        self.actInd1.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.actInd1.color = UIColor.blackColor()
        view.addSubview(actInd1)
        self.actInd1.startAnimating()
        self.actInd1.addSubview(PleaseWaitlabel1)
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        selectedliqor = trimmedString1
        
        var tag = sender.tag
        
        switch(tag){
        case 2:
            //call 2km api
             count = 1
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                 var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header1
            
        case 5:
             count = 2
             println(liqFromresult)
             println(citylatitudefFomresult)
             println(citylongitudeFromresult)
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header1
            
        case 7:
             count = 3
             if liqFromresult == "All"
             {
                 var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header1
            
        default: return
            
        }
        
      //  self.array1 = self.header1
        self.DynamicViewvodka.hidden = true
    }
    
    func lookfurtherfor7KMS(sender: UIButton)
    {
        PleaseWaitlabel1 = UILabel(frame: CGRectMake(0,20, 150, 100))
        PleaseWaitlabel1.text = "Please Wait..."
        self.actInd1.center = self.view.center
        self.actInd1.hidesWhenStopped = true
        self.actInd1.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.actInd1.color = UIColor.blackColor()
        view.addSubview(actInd1)
        self.actInd1.startAnimating()
        self.actInd1.addSubview(PleaseWaitlabel1)
        if  lookfurtheboolean == false
        {
            lookfurtheboolean = true
            println(lookfurtheboolean)
        }
        else
        {
            lookfurtheboolean = false
            println(lookfurtheboolean)
        }
        
        let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        selectedliqor = trimmedString1
        
        
        var tag = sender.tag
        
        switch(tag){
        case 2:
            //call 2km api
             count = 1
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header1
            
        case 5:
             count = 2
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header1
            
        case 7:
             count = 3
             if liqFromresult == "All"
             {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
             }
             else
             {
                 var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurtherforvodka("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
             }
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header1
            
        default: return
            
        }
        
        
       // self.array1 = self.header1
        self.DynamicViewvodka.hidden = true
    }

    
    @IBAction func shownewviewvodka(sender: UIButton)
    {
        self.showdropdownview = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        showdropdownview.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        var tapview = UIView()
        tapview = UIView(frame: CGRectMake(0,200,self.view.frame.width,self.view.frame.height))
        var tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        showdropdownview.userInteractionEnabled = true
        
        
        self.liqplacedisplaylabel = UILabel(frame: CGRectMake(10,3,self.view.frame.width - 20,25))
        
        self.liqplacedisplaylabel.backgroundColor = UIColor.whiteColor()
        self.liqplacedisplaylabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        self.liqplacedisplaylabel.text =  liqtypefromTextfield + space + near + space + locationnamefromtextfield
        self.liqplacedisplaylabel.layer.cornerRadius = 10
        self.liqplacedisplaylabel.textAlignment = NSTextAlignment.Center
        self.liqplacedisplaylabel.textColor = UIColor.darkGrayColor()
        
        
        // liqtypetextfield
        self.dropdowntextfield = UITextField (frame:CGRectMake(10,40,self.view.frame.width - 20,35));
        dropdowntextfield.backgroundColor = UIColor.whiteColor()
        self.dropdowntextfield.delegate = self
        dropdowntextfield.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)

        dropdowntextfield.text = liqtypefromTextfield
        dropdowntextfield.textColor = UIColor.darkGrayColor()

        
        dropdowntextfield.tag = 5
        
        
        beerdropdowntableview.frame         =   CGRectMake(10,80,self.view.frame.width - 20,150)
        beerdropdowntableview.delegate      =   self
        beerdropdowntableview.dataSource    =   self
        beerdropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beerdropdowntableview.tag = 4
        
        
        
        
        
        self.newtextfieldtableview = UITextField (frame:CGRectMake(10,85,self.view.frame.width - 20,35));
        newtextfieldtableview.backgroundColor = UIColor.whiteColor()
        self.newtextfieldtableview.delegate = self
        newtextfieldtableview.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        // newtextfieldtableview.text = liqtypefromTextfield
        newtextfieldtableview.text = "All"
        newtextfieldtableview.tag = 2
        newtextfieldtableview.textColor = UIColor.darkGrayColor()
        
        //        liqdropdowntableview.frame = CGRectMake(0,105,self.view.frame.width,100);
        
        beerTypedropdowntableview.frame         =   CGRectMake(10,130,self.view.frame.width - 20,150)
        beerTypedropdowntableview.delegate      =   self
        beerTypedropdowntableview.dataSource    =   self
        beerTypedropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beerTypedropdowntableview.tag = 6
        
        
        
        self.citydropdowntextfield = UITextField (frame:CGRectMake(10,135,self.view.frame.width - 20,35));
        citydropdowntextfield.backgroundColor = UIColor.whiteColor()
        self.citydropdowntextfield.delegate = self
        citydropdowntextfield.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        // newtextfieldtableview.text = liqtypefromTextfield
        citydropdowntextfield.text = localityfromtextfield1
        citydropdowntextfield.tag = 8
        citydropdowntextfield.textColor = UIColor.darkGrayColor()
        
        
        
        citydropdowntableview.frame         =   CGRectMake(10,175,self.view.frame.width - 20,150)
        citydropdowntableview.delegate      =   self
        citydropdowntableview.dataSource    =   self
        citydropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        citydropdowntableview.tag = 9
        
        
        
        
        search.frame = CGRectMake(40, 250, self.view.frame.width - 80, 30)
        search.backgroundColor = UIColor.whiteColor()
        search.setTitle("Search", forState: UIControlState.Normal)
        search.titleLabel!.font =  UIFont(name: "MyriadPro-Bold", size: 20)
        search.addTarget(self, action: "Getresults:", forControlEvents: UIControlEvents.TouchUpInside)
        search.layer.cornerRadius = 10
        search.backgroundColor = UIColor.orangeColor()
        search.tintColor = UIColor.whiteColor()
        
        
        self.view.addSubview(showdropdownview)
        showdropdownview.addSubview(tapview)
        tapview.addGestureRecognizer(tap)
        self.showdropdownview.addSubview(newtextfieldtableview)
        
        
        self.showdropdownview.addSubview(liqplacedisplaylabel)
        self.showdropdownview.addSubview(dropdowntextfield)
        self.showdropdownview.addSubview(citydropdowntextfield)
        self.showdropdownview.addSubview(search)
        
        
        
        
        
        self.newtextfieldtableviewcity = AutoCompleteTextField2 (frame: CGRect(x: 10,y: 185,width: self.view.frame.width - 20,height: 35), superview: showdropdownview)
        self.showdropdownview.addSubview(newtextfieldtableviewcity)
        newtextfieldtableviewcity.backgroundColor = UIColor.whiteColor()
        newtextfieldtableviewcity.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        newtextfieldtableviewcity.text = locationnamefromtextfield
        newtextfieldtableviewcity.textColor = UIColor.darkGrayColor()
        configureTextField()
        handleTextFieldInterfaces()
        self.showdropdownview.addSubview(citydropdowntableview)
        self.showdropdownview.addSubview(beerTypedropdowntableview)
        self.showdropdownview.addSubview(beerdropdowntableview)
        self.showdropdownview.slideInFromLeft()

 
        
    }
    
    func Getresults(sender:UIButton!)
    {
        
        PleaseWaitlabel2 = UILabel(frame: CGRectMake(-25,20, 150, 100))
        PleaseWaitlabel2.text = "Please Wait..."
        PleaseWaitlabel2.textColor = UIColor.whiteColor()
        //self.actInd2.center = self.view.center
        self.actInd2 = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.width/2 - 30, 280 , 50, 50))
        self.actInd2.hidesWhenStopped = true
        self.actInd2.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.actInd2.color = UIColor.whiteColor()
        view.addSubview(actInd2)
        self.actInd2.startAnimating()
        self.actInd2.addSubview(PleaseWaitlabel2)
        showdropdownview.hidden = false
        if togglevodka == true
        {
            togglebutton.setImage(toggleoff, forState: .Normal)
            togglevodka == false
        }
        liqtypefromTextfield = dropdowntextfield.text
        locationnamefromtextfield = newtextfieldtableviewcity.text
        
 
        
        onselect()
    }
    func handleTap(gestureRecognizer: UIGestureRecognizer)
    {
        self.view.endEditing(true)
        self.showdropdownview.hidden = true
    }
    
    func locationdisplay(sender: UIButton)
    {
        self.DynamicViewvodka = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        DynamicViewvodka.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        self.newtextfieldtableviewcity = AutoCompleteTextField2(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 35), superview: DynamicViewvodka)
        
        newtextfieldtableviewcity.backgroundColor = UIColor.whiteColor()
        newtextfieldtableviewcity.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        
        configureTextField()
        handleTextFieldInterfaces()
        self.view.addSubview(DynamicViewvodka)
        self.DynamicViewvodka.addSubview(newtextfieldtableviewcity)
        
    }
    
    func viewclosed(sender: UIButton)
    {
        showdropdownview.hidden = true
    }
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("Animation stopped")
    }
    
    @IBAction func liqnameshowviewbutton(sender: UIButton)
    {
        self.showdropdownview = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        showdropdownview.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        let backbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        backbutton.frame = CGRectMake(0,10,18,18)
        backbutton.addTarget(self, action: "viewclosed:", forControlEvents: UIControlEvents.TouchUpInside)
        let imageName1 = "popupclosebutton.png"
        let image1 = UIImage(named: imageName1)
        let imageView1 = UIImageView(image: image1!)
        backbutton.setBackgroundImage(image1, forState: .Normal)
        
        
        
        locationdisplaybutton.frame = CGRectMake(0,3,self.view.frame.width,35)
        locationdisplaybutton.addTarget(self, action: "locationdisplay:", forControlEvents: UIControlEvents.TouchUpInside)
        locationdisplaybutton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        locationdisplaybutton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        
        locationdisplaybutton.backgroundColor = UIColor.whiteColor()
        
        self.newtextfieldtableview = UITextField (frame:CGRectMake(0,39,self.view.frame.width,35));
        newtextfieldtableview.backgroundColor = UIColor.whiteColor()
        newtextfieldtableviewcity.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        self.newtextfieldtableview.delegate = self
        
        
        liqdropdowntableview.frame = CGRectMake(0,75,self.view.frame.width,100);
        
        
        self.view.addSubview(showdropdownview)
        self.showdropdownview.addSubview(locationdisplaybutton)
        self.showdropdownview.addSubview(newtextfieldtableview)
        self.showdropdownview.addSubview(backbutton)
        self.showdropdownview.addSubview(liqdropdowntableview)
        self.showdropdownview.slideInFromLeft()
        
    
    }

    
    func ApiCall()
    {
   
//            println(citylat)
//             println(citylong)
//        
//        var passliq = self.newtextfieldtableview.text
//        var  passliqspaceremoved = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
//
//        
//            
//            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=20&query=\(passliqspaceremoved)")
        
        if dropdowntextfield.text != nil && newtextfieldtableviewcity.text != "" && citydropdowntextfield.text != nil && newtextfieldtableview.text != nil
        {
        
        
        if newtextfieldtableview.text == "All"
        {
            var passliq = dropdowntextfield.text
           // println(newtextfieldtableview.text)
            
            var passspaceremovedliq = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            println(passspaceremovedliq)
            
            
            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=20&query=\(passspaceremovedliq)")
            
        }
        else
        {
            var passliq = newtextfieldtableview.text
           // println(newtextfieldtableview.text)
            
            var passspaceremovedliq = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            println(passspaceremovedliq)
            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=20&query=\(passspaceremovedliq)")
          
        }
        }
        else
        {
            actInd2.hidden = true
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
       

        
}
    
    func ApiCall1()
    {
    
        
            println(citylat)
            println(citylong)
            
            var passliq = self.newtextfieldtableview.text
           var  passliqspaceremoved = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            
            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=4&query=\(passliqspaceremoved)")
        

        
    }
    
    @IBAction func findwineandbeernewryou(sender: UIButton)
    {
        performSegueWithIdentifier("getwinenearyoufromvodka", sender: self)
    }

}































    
    
    
    
    
    
    
    
    
    
    
    

