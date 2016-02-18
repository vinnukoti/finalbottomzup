//
//  Cocktail.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 04/02/16.
//  Copyright (c) 2016 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social
import FBSDKShareKit


class Cocktail: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate,UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
    var PleaseWaitlabel1 = UILabel()
    var actInd1 : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView

    @IBOutlet weak var sortbyfont: UILabel!
    @IBOutlet weak var happyhoursfont: UILabel!
     var header2:[Restauarantcocktail] = [Restauarantcocktail]()
    var newHeader2:[Restauarantcocktail] = [Restauarantcocktail]()
    var head2:[Restaurant] = [Restaurant]()
    var headerfortableview:[Restauarantvodka] = [Restauarantvodka]()
    var getfstobj1 = Restaurant()
    var fstobj1 = Restaurant()
       var fstobj2 = Restauarantcocktail()
    var vodkaobjnew = Restauarantvodka()
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var getselectedlq:String!
    var arraylookfurther = [Restaurant]()
    var array2 = [Restauarantcocktail]()
    var restlat:Double!
    var restlong:Double!
    var resortname = [String]()
    var arraycolor = [Restaurant]()
    
    var newheadarray:[Restaurant] = [Restaurant]()
    var newheadarray1:[Restaurant] = [Restaurant]()
    
    var namefromlabel:String!
    
    
    
    
    
    var variable:String!
    var liqnamefromtextfield:String!
    
    var citylat:Double!
    var citylong:Double!
    //  @IBOutlet weak var autocompletetextfieldforbeer: AutoCompleteTextField1!
    
    
    // @IBOutlet weak var newtextfieldtableview: UITextField!
    var global = false
    var pintbuttonclicked = false
    var bottlebuttonclicked = false
    var locationbuttonclicked = false
    @IBOutlet var mainview: UIView!
    // @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var pintbutton: UIButton!
    @IBOutlet weak var bottlebutton: UIButton!
    @IBOutlet weak var locationbutton: UIButton!
    
    
    let pintcheckedImage = UIImage(named: "NormalTabyellow")
    let pintunCheckedImage = UIImage(named: "NormaltabWhite")
    
    let bottlecheckedImage = UIImage(named: "NormalTabyellow")
    let bottleunCheckedImage = UIImage(named: "NormaltabWhite")
    
    let locationcheckedImage = UIImage(named: "NormalTabyellow")
    let locationunCheckedImage = UIImage(named: "NormaltabWhite")
    
    let delasimage = UIImage(named: "Deals")
    
    var liqname:String!
    var head:[Restaurant] = [Restaurant]()
    var headfurther:[Restaurant] = [Restaurant]()
    
    var vodkaarray:[Restauarantvodka] = [Restauarantvodka]()
    
    var getdevicelatitude:Double!
    var getdevicelongitude:Double!
    var resobjr = Restaurant()
    var getcitylatitude:Double!
    var getcitylongitude:Double!
    
    var getResturantlatitude:[Double] = [Double]()
    var getRestuarantlongitude:[Double] = [Double]()
    
    var getrestlatitudebeer:Double!
    var getrestlongitudebeer:Double!
    
    var getrestlatitudevodka:Double!
    var getrestlongitudevodka:Double!
    
    //var getselectedliq:String!
    
    @IBOutlet weak var togglebuttonbeer: UIButton!
    let toggleoff = UIImage(named: "toggleoff")
    let toggleon = UIImage(named: "toggleon")
    
    var changecolor = false
    
    var togglebeer = false
    // var toggleboolean:Bool!
    
    var pintSortingarry = [Restaurant]()
    var botleSortingarray = [Restaurant]()
    
    //var iscitytextfieldhavedata = false
    //var isliqtextfieldhasdata = false
    
    
    
    // @IBOutlet weak var pop: UIView!
    
    
    
    
    var currentlocationname:String!
    
    
    
    // @IBOutlet weak var newliqdropdowntableview: UITableView!
    
    
    var locationManager1: CLLocationManager!
    
    private var connection:NSURLConnection?
    
    var iscitytextfieldhavedata = false
    
    private var responseData:NSMutableData?
    
    private let googleMapsKey = "AIzaSyC8fGPXIWXTKJNvkBvKszetkDYbqh5AtC0"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
    
    var arar = [String]()
    
    var newarar =  [String]()
    
    var autocompleteUrls = [String]()
    
    var selectedliqor:String!
    
    var isliqtextfieldhasdata = false
    
    var takegetselectedcitynale:String!
    
    var checkliqtype:String!
    
    var getenteredcitylat:Double!
    var getenteredcitylong:Double!
    
    var trimmedString:String!
    
    var check:String!
    
    var liqvodkaname:String!
    
    var getcitylatitudefromvodka:Double!
    var getcitylongitudefromvodka:Double!
    
    var getliqnamefromresult:String!
    
    var getcitylatitudefromgoogle:Double!
    var getcitylongitudefromgoogle:Double!
    
    var getselectedcityname:String!
    var substringofselectedliq = "650"
    
    var boolexists = false
    
    var countfurther = 0
    
    var obj = [results1]()
    var array1 = [Restauarantcocktail]()
    var resortname1 = [String]()
    
    
    var origin = CGFloat()
    var origin1 = Float()
    var end = CGFloat()
    
    var newtrimmedstring:String!
    
    var countvlaues:Int!
    
    var one:Int!
    var two:Int!
    
    var popupx:CGFloat!
    var popupy:CGFloat!
    
    var DynamicView=UIView()
    var newrestnamefromtag:String!
    var locatiopopupview = UIView()
    var newaddress:String!
    var addresslabel: UILabel = UILabel()
    var showdropdownview=UIView()
    
    let imagewi2kmrhradius = UIImage(named: "LookFurthe2kmrwithradius") as UIImage?
    let imagewi5kmrhradius = UIImage(named: "Lookfurther5withradius") as UIImage?
    let imagewi7kmrhradius = UIImage(named: "lookfurther7withradius") as UIImage?
    
    let imageName5 = UIImage(named: "lookfurther5") as UIImage?
    let imageName7 = UIImage(named: "lookfurther7") as UIImage?
    let imageName2 = UIImage(named: "Lookfurther2") as UIImage?
    
    
    @IBOutlet weak var lookfurtherdefault: UIButton!
    let closelocationpopupbutton5kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let closelocationpopupbutton7kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    let closelocationpopupbutton2kms = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    var lookfurtheboolean = false
    
    var newtextfieldtableview = UITextField()
    var liqdropdowntableview: UITableView  =   UITableView()
    var newtextfieldtableviewcity = AutoCompleteTextField1()
    let locationdisplaybutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    
    @IBOutlet weak var locationnamedisplaybutton: UIButton!
    
    var space = " "
    var near = "Near"
    
    var beerTypefromtextfield:String!
    var localityfromtextfield:String!
    
    var locationvaluefrombutton: String!
    var liqvaluefrombutton: String!
    
    var locationnamefromtextfield:String!
    var liqtypefromTextfield:String!
    
    // localityFromtextfield value is given by Result1 from segue
    var localityFromtextfield:String!
    
    
    var citylatitudefFomresult:Double!
    var citylongitudeFromresult:Double!
    var liqtypeFromresult:String!
    var liqFromresult:String!
    
    var hstart = "00:00 - 00:00"
    
    var countphoneclicked = 0
    
    var restlatitude:Double!
    var restlongitude:Double!
    
    var liqplacedisplaylabel = UILabel()
    var dropdowntextfield = UITextField()
    var beerdropdowntableview = UITableView()
    var beerTypedropdowntableview = UITableView()
    
    //uiview and labels programatically
    
    var dropdowntextfieldnew = UIView()
    var dropdowntextfieldnewlabel = UILabel()
    
    var newtextfieldtableviewnew = UIView()
    var newtextfieldtableviewlabel = UILabel()
    
    var citydropdowntextfieldnew = UIView()
    var citydropdowntextfieldlabel = UILabel()
    
    var liqTypes: [String] = ["Beer", "Whiskey", "Vodka","rum","Cocktail"]
    var liqTypes1:[String] = [String]()
    
    var citydropdowntextfield = UITextField()
    var citydropdowntableview = UITableView()
    
    var items: [String] = ["Delhi", "Gurgaon", "Noida"]
    
    var search   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    var localityfromtextfield1:String!
    
    let Findongooglemapsbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    
    var reslatitude:Double!
    var reslongitude:Double!
    
    @IBOutlet weak var shadowimage: UIImageView!
    
    var devicelatitude:Double!
    var devicelongitude:Double!
    
    var actInd2 : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
    var PleaseWaitlabel2 = UILabel()
    
    var searchedLocality:String!
    var searchedLiq:String!
    var searchedaLiqType:String!
    var searchedsubLocality:String!

    override func viewDidLoad()
    {
        
        println(getdevicelatitude)
        println(getdevicelongitude)
        super.viewDidLoad()
        
        self.happyhoursfont.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        self.sortbyfont.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        
        
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "TableviewTapped:")
        tableview.addGestureRecognizer(headerTapped)

        
        beerdropdowntableview.hidden = true
        beerTypedropdowntableview.hidden = true
        citydropdowntableview.hidden = true
        
        
        GAI.sharedInstance().trackUncaughtExceptions = true
        GAI.sharedInstance().dispatchInterval = 20
        GAI.sharedInstance().logger.logLevel = GAILogLevel.Verbose
        GAI.sharedInstance().trackerWithTrackingId("UA-73017985-1")
        var tracker2:GAITracker = GAI.sharedInstance().defaultTracker as GAITracker
        tracker2.set(kGAIScreenName, value:"Beer Screen")
        
        //dealsnearyou.hidden = true
        locationnamedisplaybutton.setTitle(liqtypefromTextfield + space + near + space + locationnamefromtextfield, forState: .Normal)
        locationnamedisplaybutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        
        locationnamedisplaybutton.layer.cornerRadius = 10
    
        liqdropdowntableview.hidden = true
        locationbutton.hidden = true
        newheadarray = head
        countvlaues = newheadarray.count
        println(countvlaues)
        
        if togglebeer == true
        {
            togglebuttonbeer.setImage(toggleon, forState: .Normal)
        }
        else
        {
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
        }
        
        Happyhours()
        
        tableview.tag = 1
        liqdropdowntableview.tag = 0
        
        newtextfieldtableviewcity.tag = 3
        
        dropdowntextfield.tag = 7
        
        
        
        liqdropdowntableview.layer.borderColor = UIColor.grayColor().CGColor
        liqdropdowntableview.layer.borderWidth = 2
        
        
        if selectedliqor.rangeOfString(substringofselectedliq) != nil
        {
            boolexists = true
            
            // println("exists")
        }
        else
        {
            boolexists = false
            
            //  println("Not exists")
        }
        
        if boolexists == true
        {
            bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
            header2 = bottlesorting(header2)
            tableview.reloadData()
        }
        
        
        if boolexists == false
        {
            pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            header2 = pintsoring(header2)
            tableview.reloadData()
        }
        
        // super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        pintbutton.setTitle("GLASS (₹)", forState: .Normal)
        pintbutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: 11)
        bottlebutton.setTitle("PITCHER (₹)", forState: .Normal)
        bottlebutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: 11)
        
        newtextfieldtableviewcity.delegate = self
        
        
        
        locationManager1 = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        //locationManager1.startUpdatingLocation()
        
        liqdropdowntableview.dataSource = self
        liqdropdowntableview.delegate = self

        

    }
    
    func TableviewTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        locatiopopupview.hidden = true
        DynamicView.hidden = true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        locatiopopupview.hidden = true
        DynamicView.hidden = true
    }
    
    

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
    override func prefersStatusBarHidden() -> Bool
    {
        return true
    }
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userLocation:CLLocation = locations[0] as! CLLocation
        self.locationManager1.stopUpdatingLocation()
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {
            placemarks, error in
            
            let placeArray = placemarks as? [CLPlacemark]
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placeArray?[0]
            
            //            // Street address
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
                    // print(address)
                    
                    //Assigning the address to the address label on the map.
                    // self.addressLabel.text = " \(roadno) \r \(thoroughfare) \r \(subLocality) \r \(locality) \(administrativeArea) \(postalCode) \r \(country)"
                    self.newtextfieldtableviewcity.text = subLocality
                }
            }
            
        })
    }
    
    private func configureTextField()
    {
        newtextfieldtableviewcity.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        newtextfieldtableviewcity.autoCompleteTextFont = UIFont(name: "MYRIADPRO-REGULAR", size: 14.0)
        newtextfieldtableviewcity.autoCompleteCellHeight = 35.0
        newtextfieldtableviewcity.maximumAutoCompleteCount = 20
        newtextfieldtableviewcity.hidesWhenSelected = true
        newtextfieldtableviewcity.hidesWhenEmpty = true
        newtextfieldtableviewcity.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "MYRIADPRO-REGULAR", size: 14.0)
        newtextfieldtableviewcity.autoCompleteAttributes = attributes
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
        //  self.view.bringSubviewToFront(showdropdownview)
        newtextfieldtableviewcity.onTextChange = {[weak self] text in
            if !text.isEmpty{
                if self!.connection != nil
                {
                    self!.connection!.cancel()
                    self!.connection = nil
                }
                println(self!.citydropdowntextfield.text)
                if CheckforInternetViewController.isConnectedToNetwork() == true
                {
                    // print("Internet connection OK")
                    let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyC45IqTyfdeO5SzyLDGAVWiwADSSv70S6g&input={\(self!.citydropdowntextfield.text.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)}\(text)&types=(regions)&components=country:IN"
                    let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
                    if url != nil{
                        let urlRequest = NSURLRequest(URL: url!)
                        self!.connection = NSURLConnection(request: urlRequest, delegate: self)
                        //  print("Internet connection OK")
                        
                    }}
                else
                {
                    // print("Internet connection FAILED")
                    
                    let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                    alert.show()
                    AutoCompleteTextField1.autoCompleteTableView?.hidden = true
                    
                    
                    
                }
            }
        }
        
        newtextfieldtableviewcity.onSelect = {[weak self] text, indexpath in
            
            println(self!.newtextfieldtableviewcity.text)
            self!.newtextfieldtableviewcity.text = text
            self!.liqtypefromTextfield = self!.newtextfieldtableview.text
            self!.locationnamefromtextfield = text
            //self!.onselect()
            self!.liqFromresult = self!.newtextfieldtableview.text
            // self!.locationnamedisplaybutton.setTitle(self!.newtextfieldtableview.text + self!.space + self!.near + self!.space + self!.newtextfieldtableviewcity.text ,forState: .Normal)
            
            self!.iscitytextfieldhavedata = true;
            
            self!.view.endEditing(true);
            // self?.showdropdownview.hidden = true;
            self!.getselectedcityname = text
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil
                {
                    let coordinate = placemark!.location.coordinate
                    self!.getcitylatitudefromgoogle = coordinate.latitude
                    self!.getcitylongitudefromgoogle = coordinate.longitude
                    //                    if self!.iscitytextfieldhavedata == true && self!.isliqtextfieldhasdata == true
                    //                    {
                    //                        println(self!.trimmedString)
                    //                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/radmin/searchresultV2.php?lat=\(self!.getcitylatitudefromgoogle)&long=\(self!.getcitylongitudefromgoogle)&km=2&records=10&query=\(self!.trimmedString)")
                    //                    }
                    //                    else
                    //                    {
                    //                        println(self!.trimmedString)
                    //                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/radmin/searchresultV2.php?lat=\(self!.getcitylatitudefromgoogle)&long=\(self!.getcitylongitudefromgoogle)&km=2&records=10&query=\(self!.newtrimmedstring)")
                    //                    }
                    
                    
                    
                    
                }
            })
        }
        
    }
    
    func onselect()
    {
        var text1 = self.newtextfieldtableviewcity.text
        var locate = citydropdowntextfield.text + text1
        
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
                                
                                
                                
                                // }
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
                        for var i = 0; i < locations.count;i++
                        {
                            var newlaocations = locations[i]
                            var fullNameArr = split(newlaocations) {$0 == ","}
                            println(fullNameArr.count)
                            
                            //                            if fullNameArr.count > 1
                            //                            {
                            //                                var firstName: String = fullNameArr[0]
                            //                                var lastName: String = fullNameArr[1]
                            //                                locations[i] = firstName + ", " + lastName
                            //                            }
                            
                            
                            var firstName: String = fullNameArr[0]
                            locations[i] = firstName
                            
                            
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
    
    func textFieldDidBeginEditing(textField: UITextField)
    {
        //showdropdownview.userInteractionEnabled = false
        // showdropdownview.removeGestureRecognizer(self.tap)
        
        if textField.tag == 0
        {
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
            AutoCompleteTextField1.autoCompleteTableView?.hidden = true
            
        }
        else if textField.tag == 2
        {
            AutoCompleteTextField1.autoCompleteTableView?.hidden = true
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
            AutoCompleteTextField1.autoCompleteTableView?.hidden = true
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
        searchAutocompleteEntriesWithSubstring(substring)
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
        // self.showdropdownview.hidden = true
        if tableView.tag == 0
        {
            
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            newtextfieldtableview.text = selectedCell1.textLabel?.text
            liqnamefromtextfield = newtextfieldtableview.text
            isliqtextfieldhasdata = true
            if liqnamefromtextfield.rangeOfString(substringofselectedliq) != nil
            {
                boolexists = true
            }
            else
            {
                boolexists = false
            }
            trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            //  newtrimmedstring = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            
            
            self.array1 = header2
            selectedliqor = selectedCell1.textLabel!.text
            isliqtextfieldhasdata = true
            self.liqFromresult = self.newtextfieldtableview.text
            // locationnamedisplaybutton.setTitle(self.newtextfieldtableview.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text , forState: .Normal)
            locationnamefromtextfield = self.newtextfieldtableviewcity.text
            liqtypefromTextfield = self.newtextfieldtableview.text
            println(self.newtextfieldtableviewcity.text)
            println(self.newtextfieldtableview.text)
            
            
            
            //            var text = self.newtextfieldtableviewcity.text
            //
            //            var locate = self.localityFromtextfield + text
            //
            //            println(locate)
            //            var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            //            self.getgoogledata1("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
            
            
            self.view.endEditing(true)
            tableView.hidden = true
        }
            
            // category liq
        else if tableView.tag == 4
        {
            
            citydropdowntextfield.enabled = true
            newtextfieldtableview.enabled = true
            dropdowntextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            dropdowntextfield.text = selectedCell1.textLabel?.text
            dropdowntextfieldnewlabel.text = selectedCell1.textLabel?.text
            searchedLiq = dropdowntextfield.text
            println(searchedLiq)
            
            beerdropdowntableview.hidden = true
        }
            
            // subcategory liq
        else if tableView.tag == 6
        {
            citydropdowntextfield.enabled = true
            newtextfieldtableview.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            newtextfieldtableview.text = selectedCell1.textLabel?.text
            newtextfieldtableviewlabel.text = selectedCell1.textLabel?.text
            beerTypedropdowntableview.hidden = true
            searchedaLiqType = newtextfieldtableview.text
        }
         
            // Locality
        else if tableView.tag == 9
        {
            newtextfieldtableviewcity.text = ""
            citydropdowntextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            citydropdowntextfield.text = selectedCell1.textLabel?.text
            citydropdowntextfieldlabel.text = selectedCell1.textLabel?.text
            citydropdowntableview.hidden = true
            searchedLocality = citydropdowntextfield.text
        }
    }
    
    func getbardata(urlString:String)
    {
        let url = NSURL(string: urlString)
        println(urlString)
        
        
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
            head2 = [Restaurant]()
             newHeader2 = [Restauarantcocktail]()
            headerfortableview = [Restauarantvodka]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
                fstobj2 = Restauarantcocktail()
                vodkaobjnew = Restauarantvodka()
                
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
                            println(fstobj1.maxp)
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
                                println(getdevicelatitude)
                                println(getdevicelongitude)
                                // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                        head2.append(fstobj1)
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
                                println(devicelatitude)
                                println(devicelongitude)
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
                                // fstobj1.amp.append(liqobj1)
                                fstobj2.amp.append(liqobj1)
                            }
                        }
       
                        newHeader2.append(fstobj2)
                        
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
                            //vodkasendobj.vodkahappystart = happy_hour_start2
                        }
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            vodkaobjnew.rest_offers_happy_hour = rest_offers_happy_hour1
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
                                vodkaobjnew.distancevodka = totalDistance1 + " Km"
                                
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
                        
                    }
                }
            }
            if check == "Cocktails"
            {
              header2 = newHeader2
                self.tableview.reloadData()
                
            }
            else if check == "Beer"
            {
                self.performSegueWithIdentifier("segfromcocktailtobeer", sender: self)
            }
            else
            {
                 self.performSegueWithIdentifier("segforvodkafromcocktail", sender: self)
            }
            if boolexists == true
            {
                pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
                bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
                header2 = bottlesorting(header2)
                for var i = 0;i < header2.count;i++
                {
                    println(header2[i].maxp)
                }
            }
                
            else
            {
                pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
                bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
                header2 = pintsoring(header2)
                for var i = 0;i < header2.count;i++
                {
                    println(header2[i].minp)
                }
            }
            
            showdropdownview.hidden = true
            
            if newtextfieldtableview.text == "All"
            {
                self.locationnamedisplaybutton.setTitle(self.dropdowntextfield.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text ,forState: .Normal)
            }
            else
                
            {
                self.locationnamedisplaybutton.setTitle(self.newtextfieldtableview.text + self.space + self.near + self.space + self.newtextfieldtableviewcity.text ,forState: .Normal)
            }
//            if let viewWithTag = self.view.viewWithTag(100) {
//                println("Tag 100")
//                viewWithTag.removeFromSuperview()
//            }
            actInd2.removeFromSuperview()
            actInd2.hidden = true
            
        }
            
        else
        {
            actInd2.removeFromSuperview()
//            if let viewWithTag = self.view.viewWithTag(100) {
//                println("Tag 100")
//                viewWithTag.removeFromSuperview()
//            }
            actInd2.hidden = true
            showdropdownview.hidden = false
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    @IBAction func press2revealPressed(sender: UIButton)
    {
        //resturantnamelable.text = "I just got a 10 % discount at \(head[sender.tag].restnamevodka) Through Bottomz Up"
        
        // tableview.userInteractionEnabled = false
        // popupview.hidden = false
        
    }

    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
        //gestureRecognizer.cancelsTouchesInView = false
        //popupview.hidden = false
    }
    @IBAction func shareonfacebook(sender: AnyObject)
    {

        
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("\(namefromlabel)")
        
        
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        if tableView.tag == 1
        {
            println(header2.count)
            return header2.count
        }
        else if tableView.tag == 4
        {
            return 1
        }
        else if tableView.tag == 6
        {
            return 1
        }
        else if tableView.tag == 9
        {
            return 1
        }
        else
        {
            return 1
        }
    }
    
    @IBAction func getdiscount1(sender: AnyObject)
    {
        
    }
    //    @IBAction func gotomap(sender: AnyObject)
    //    {
    //        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
    //    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        
        
        if tableView.tag == 1
        {
            
            //          self.tableheightConstrain.constant = CGFloat(head.count) * 1
            //             self.view.layoutIfNeeded()
            if header2[section].bool == true
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
            
            let cells = tableView.dequeueReusableCellWithIdentifier("tableChildCell", forIndexPath: indexPath) as! Cocktailrowcell
            
            var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "hidecell:")
            cells.tapimage.addGestureRecognizer(headerTapped)
            cells.tapimage.tag = indexPath.section
            cells.tapimage.userInteractionEnabled = true

            
            //cells.press2reveal.hidden = true
            cells.locationicon.tag = indexPath.section
            //Findongooglemapsbutton.tag = indexPath.section
            println(cells.locationicon.tag)
            cells.beers = [liqclass]()
            cells.beers = header2[indexPath.section].amp
            cells.arrowup.tag = indexPath.section
           // cells.press2reveal.tag = indexPath.section
            cells.restaurantName = header2[indexPath.section].restname
            //  resturantnamelable.text = "I just got a 10% discount at \(head[cells.press2reveal.tag].restname) through the BottomzUp App"
            //namefromlabel = resturantnamelable.text
            cells.distancelabelnew.text = header2[indexPath.section].distance
            cells.distancelabelnew.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            cells.hotelname.text = header2[indexPath.section].restname
            cells.hotelname.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            cells.areaname.text = header2[indexPath.section].restaddress
            cells.areaname.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            cells.Happyhourslabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            cells.happytiming.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            //addresslabel.text = head[indexPath.section].Place
            newaddress = header2[indexPath.section].restaddress
            cells.happytiming.text = header2[indexPath.section].happystart + " - " + header2[indexPath.section].happyend
            cells.popupbutton.tag = indexPath.section
            println(cells.happytiming.text)
            println(hstart)
            // println("\(cells.popupbutton.tag)" + "MAxwell")
            if cells.happytiming.text == hstart
            {
                cells.happytiming.hidden = true
                cells.Happyhourslabel.hidden = true
            }
            else
            {
                cells.happytiming.hidden = false
                cells.Happyhourslabel.hidden = false
            }
            
            
            cells.tableView.reloadData()
            
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
            cell!.textLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
            cell!.textLabel?.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
            return cell!
        }
    }
    
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        
        locatiopopupview.hidden = true
        DynamicView.hidden = true
        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Tapped Hotel",action: header2[gestureRecognizer.view!.tag].restname,label: header2[gestureRecognizer.view!.tag].restname, value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])
        var section = gestureRecognizer.view!.tag
        println(section)
        println("Section: \(gestureRecognizer.view!.tag)")
        
        if header2[gestureRecognizer.view!.tag].bool == false
        {
            header2[gestureRecognizer.view!.tag].bool = true
            
        }
        else
        {
            header2[gestureRecognizer.view!.tag].bool = false
        }
        
        self.tableview.reloadData()
        
    }
    
    
    
    
    @IBAction func arrowup(sender: UIButton)
    {
        locatiopopupview.hidden = true
        DynamicView.hidden = true
        if header2[sender.tag].bool == true
        {
            header2[sender.tag].bool = false
        }
        tableview.reloadData()
        
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
//            if ((header2[indexPath.section].amp.count * 30) + 10) > 202 {
//                
//                return CGFloat((head[indexPath.section].amp.count * 30) + 10)
//            }
//            else{
//                
//                return 202
//                
//            }
            return CGFloat((header2[indexPath.section].amp.count * 16) + 150)
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
            if header2[section].bool == false
            {
                if header2[section].rest_offers_happy_hour == "Yes"
                {
                    return 85
                }
                else
                {
                    return 85
                }
            }
            else
            {
                if header2[section].rest_offers_happy_hour == "Yes"
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
    
    func imageResize (imageObj:UIImage, sizeChange:CGSize)-> UIImage{
        
        let hasAlpha = false
        let scale: CGFloat = 0.0 // Automatically use scale factor of main screen
        
        UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
        imageObj.drawInRect(CGRect(origin: CGPointZero, size: sizeChange))
        
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        return scaledImage
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        
        
        if tableView.tag == 1
        {
            
            if header2[section].bool == false
            {
                var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercellcocktail
                headerCell.headercellname.text = header2[section].restname
                headerCell.headercellname.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                headerCell.citynamedisplay.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                headerCell.Happyhourslabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                
                
                println(head.count)
                if header2.count >= 5
                {
                    shadowimage.hidden = false
                    headerCell.shadowimage.hidden = true
                }
                else if header2.count < 5
                {
                    println(section)
                    println(header2.count)
                    
                    if section == header2.count - 1
                    {
                        headerCell.shadowimage.hidden = false
                        shadowimage.hidden = true
                    }
                    else
                    {
                        headerCell.shadowimage.hidden = true
                    }
                }
                
                if header2[section].minp == 0
                {
                    headerCell.headercellmin.text =   "--"
                }
                else
                {
                    headerCell.headercellmin.text =   "  " + "\(header2[section].minp)"
                }
                
                if header2[section].maxp == 0
                {
                    headerCell.headercellmax.text =  "--"
                }
                else
                {
                    headerCell.headercellmax.text =  "  " + "\(header2[section].maxp)"
                }
                
               // headerCell.availofferimagetodisplay.hidden = true
                
                var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
                headerCell.tapguesturerecognizer.addGestureRecognizer(headerTapped)
                headerCell.tapguesturerecognizer.tag = section
                headerCell.tapguesturerecognizer.userInteractionEnabled = true
                headerCell.citynamedisplay.text = header2[section].Place
                headerCell.mapbutton.tag = section
                headerCell.mapbutton.setTitle(header2[section].distance, forState: UIControlState.Normal)
                headerCell.mapbutton.enabled =  false
                var happyhourstiming = header2[section].happystart + " - " + header2[section].happyend

                println(happyhourstiming)
                println(hstart)
                var screensize = self.view.frame.width
                headerCell.headercellmax.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                headerCell.headercellmin.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
              //  bottlebutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 12)
               // pintbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 12)
                
                if boolexists == true
                {
                    headerCell.headercellmax.font = UIFont(name: "MyriadPro-Bold", size: fontsizenew)
                    bottlebutton.titleLabel?.font = UIFont(name: "MyriadPro-Bold", size: 11)
                    
                }
                else
                {
                    headerCell.headercellmin.font = UIFont(name: "MyriadPro-Bold", size: fontsizenew)
                    pintbutton.titleLabel?.font = UIFont(name: "MyriadPro-Bold", size: 11)
                    
                }
                
                if header2[section].ishappy == "Yes"
                {
                    
                    
                    
                    var happyhourstiming1 = "Happy Hours " + happyhourstiming
                    var myMutableString = NSMutableAttributedString()
                    
                    myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: fontsizenew)!])
                    
                    var length = myMutableString.length
                    
                    myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 0/255.0, green: 153/255.0, blue: 0/255.0, alpha: 1.0), range: NSRange(location:11,length:length - 11))
                    
                    headerCell.Happyhourslabel.attributedText = myMutableString
     
                    
                    println(happyhourstiming1)

                }
                else
                {
                    
                    
                    
                    var happyhourstiming1 = "Happy Hours " + happyhourstiming
                    var myMutableString = NSMutableAttributedString()
                    
                    myMutableString = NSMutableAttributedString(string: happyhourstiming1, attributes: [NSFontAttributeName:UIFont(name: "MyriadPro-Regular", size: fontsizenew)!])
                    
                    myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.orangeColor(), range: NSRange(location:0,length:myMutableString.length))
                    
                    headerCell.Happyhourslabel.attributedText = myMutableString
         
                    
                    println(happyhourstiming1)

                }
                
                if header2[section].rest_offers_happy_hour == "Yes"
                {
                    
                    headerCell.Happyhourslabel.hidden = false
                    if happyhourstiming == hstart
                    {
                        headerCell.Happyhourslabel.hidden = true
                    }
                    else
                    {
                        headerCell.Happyhourslabel.hidden = false
                    }
 
                    
                }
                else
                {
     
                    headerCell.Happyhourslabel.hidden = true
                    
                }
                
                
                if header2[section].color == true
                {

                    
                }
                
                
                
                //Giving Font family style to a UIButton
                headerCell.mapbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                
                
                
                return headerCell
            }
                
            else
            {
                
                var  headerCell1 = tableView.dequeueReusableCellWithIdentifier("headercellnewforexpanded") as! customheadercellafterexpanstion
                headerCell1.backgroundColor = UIColor.whiteColor()
                headerCell1.restNameafterexpastion.text = " " + head[section].restname
                headerCell1.pintlabel.text = "\(head[section].minp)"
                headerCell1.bottlelabel.text = "\(head[section].maxp)"
                headerCell1.distancelabel.text = "\(head[section].distance)"
                headerCell1.Areanamelabel.text = " " + head[section].Place
                
                
                
                var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
                headerCell1.imageviewtapguesturerecognizer.addGestureRecognizer(headerTapped)
                headerCell1.imageviewtapguesturerecognizer.tag = section
                headerCell1.imageviewtapguesturerecognizer.userInteractionEnabled = true
                if head[section].ishappy == "Yes"
                {
                    headerCell1.HappyhourstimingAfterexpantion.textColor = UIColor.greenColor()
                }
                
                if boolexists
                {
                    
                    headerCell1.bottlelabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                    //                headerCell1.pintlabel.backgroundColor = UIColor.whiteColor()
                    
                }
                else
                {
                    headerCell1.pintlabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
                    //                headerCell1.bottlelabel.backgroundColor = UIColor.whiteColor()
                }
                
                if head[section].rest_offers_happy_hour == "Yes"
                {
                    //  headerCell1.HappyhourstimingAfterexpantion.hidden = false
                    // headerCell1.happyhoursdisplaylabelafterexpantion.hidden = false
                }
                else
                {
                    // headerCell1.HappyhourstimingAfterexpantion.hidden = true
                    // headerCell1.happyhoursdisplaylabelafterexpantion.hidden = true
                }

                return headerCell1
                
            }
        }
        else
        {
            
            return nil
        }
        
        
    }
    
    func hidecell(gestureRecognizer: UITapGestureRecognizer)
    {
        
        locatiopopupview.hidden = true
        DynamicView.hidden = true
        if header2[gestureRecognizer.view!.tag].bool == false
        {
            header2[gestureRecognizer.view!.tag].bool = true
            
        }
        else
        {
            header2[gestureRecognizer.view!.tag].bool = false
        }
        
        self.tableview.reloadData()
        
    }

    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        
    }
    @IBAction func togglebuttonbeerpressed(sender: UIButton)
    {
        
        
        var array = [Restauarantcocktail]()
        array = header2
        if togglebeer == false
        {
            
            self.array1 = header2
            togglebuttonbeer.setImage(toggleon, forState: .Normal)
            togglebeer = true
            for var i = array.count-1;i >= 0;i--
            {
                if array[i].ishappy != "Yes"
                {
                    array.removeAtIndex(i)
                }
                
            }
            header2 = array
        }
        else
        {
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
            togglebeer = false
            
            if countfurther == 1
            {
                header2 = self.array2
            }
            else if countfurther == 2
            {
                header2 = self.array2
            }
                
            else if countfurther == 3
            {
                header2 = self.array2
            }
            else
            {
                header2 = self.array1
            }
        }
        if boolexists == true{
            header2 = self.bottlesorting(header2)
        }
        else{
            header2 = self.pintsoring(header2)
        }
        
        if header2.count == 0
        {
            shadowimage.hidden = true
        }
        tableview.reloadData()
        
    }
    

    
    
    
    func getbardatafurther(urlString:String)
    {
        let url = NSURL(string: urlString)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(), {
                
                self.extract_jsonfurhter(data)
            })
            
        }
        task.resume()
    }
    
    func extract_jsonfurhter(data:NSData)
    {
        var jsonError:NSError?
        if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        {
            // newheadarray = [Restaurant]()
            head = [Restaurant]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    
                    if let pint_avg_price = bottomsUp1["pint_min_price"] as? Int
                    {
                        fstobj1.minp = pint_avg_price
                        // println(pint_avg_price)
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
                        
                        if let res_locality = resInfo["res_locality"] as? String
                        {
                            fstobj1.Place = res_locality
                        }
                        if let res_name = resInfo["res_name"] as? String
                        {
                            
                            fstobj1.restname = res_name
                            
                        }
                        if let res_address = resInfo["res_address"] as? String
                        {
                            fstobj1.restaddress = res_address
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            //convert String to Double
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restlat = string.doubleValue
                            fstobj1.Restaurantlatitude = restlat
                            println(fstobj1.Restaurantlatitude)
                            println(restlat)
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restlong = string.doubleValue
                            fstobj1.Restaurantlongitude = restlong
                            println(fstobj1.Restaurantlongitude)
                            println(restlong)
                            
                            
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
                            var OldLocation: CLLocation = CLLocation(latitude: self.getdevicelatitude, longitude: self.getdevicelongitude)
                            // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                            fstobj1.distance = totalDistance1 + " Km"
                            println(fstobj1.distance)
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
                }
                
                
                head.append(fstobj1)
                array2 = header2
                println(head.count)
                
                head = colormethod(head, newheadarray: newheadarray)
                
                println(head.count)
                
            }
            println(one)
            println(two)
            
            
            if togglebeer == true
            {
                var array = [Restauarantcocktail]()
                array = header2
                for var i = array.count - 1;i>=0;i--
                {
                    if array[i].ishappy != "Yes"
                    {
                        array.removeAtIndex(i)
                    }
                    
                }
                header2 = array
                tableview.reloadData()
            }
            
            if boolexists == true
            {
                header2 = bottlesorting(header2)
                for var i = 0;i < header2.count;i++
                {
                    println(header2[i].maxp)
                }
            }
                
            else
            {
                header2 = pintsoring(header2)
                for var i = 0;i < header2.count;i++
                {
                    println(header2[i].minp)
                }
            }
            self.actInd1.hidden = true
        }
            
        else
        {
            self.actInd1.hidden = true
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        
        self.tableview.reloadData()
        
    }
    
    @IBAction func pintsort(sender: AnyObject)
        
    {
        bottlebutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: 11)
        bottlebuttonclicked = false
        pintbuttonclicked = true
        boolexists = false
        
        if pintbuttonclicked == true
        {
            pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
        }
        
        for var i = 0; i < head.count ; i++
        {
            header2[i].bool = false
            
        }
        header2 = pintsoring(header2)
        self.tableview.reloadData()
    }
    
    @IBAction func bottolesort(sender: AnyObject)
        
    {
        pintbutton.titleLabel!.font =  UIFont(name: "MYRIADPRO-REGULAR", size: 11)
        global = true
        pintSortingarry = head
        pintbuttonclicked = false
        bottlebuttonclicked = true
        boolexists = true
        
        if bottlebuttonclicked == true
        {
            
            pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
            for var i = 0; i < head.count ; i++
            {
                head[i].bool = false
                
            }
            header2 = bottlesorting(header2)
            self.tableview.reloadData()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "segfromcocktailtobeer"
        {
            if let destination1 = segue.destinationViewController as? tableviewclass
            {
                destination1.head = head2
                destination1.liqvodkaname = newtextfieldtableview.text
                var liqvodkaname = newtextfieldtableview.text
                let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination1.liqvodkaname = trimmedString
              //  destination1.liqnamefromtableview = trimmedString
                // destination1.toggleboolean = toggleboolean
                destination1.header1 = headerfortableview
                println(headerfortableview.count)
                //destination1.toggle = toggle
                //destination1.toggleboolean = toggleforboth
              //  destination1.togglevodka = togglebeer
                destination1.getcitylatitude = getcitylatitude
                destination1.getcitylongitude = getcitylongitude
                destination1.getdevicelatitude = getdevicelatitude
                destination1.getdevicelongitude = getdevicelongitude
                destination1.selectedliqor = selectedliqor
              ////  destination1.getvodkalatitude = restlat
                //destination1.getvodkalongitude = restlong
               // destination1.getcitylatitufrombeerscreen = getcitylatitude
               // destination1.getcitylongitudefrombeerscreen = getcitylongitude
                destination1.getselectedcityname = getselectedcityname
                destination1.liqtypefromTextfield = liqtypefromTextfield
                println(locationnamefromtextfield)
                destination1.locationnamefromtextfield = locationnamefromtextfield
                destination1.localityFromtextfield = localityFromtextfield
                destination1.liqFromresult = newtextfieldtableview.text
                destination1.citylatitudefFomresult = citylat
                destination1.citylongitudeFromresult = citylong
                destination1.localityfromtextfield1 = citydropdowntextfield.text
                destination1.liqtypeFromresult = dropdowntextfield.text
                
                destination1.searchedLocality = searchedLocality
                
                
                //Beer
                destination1.searchedLiq = searchedLiq
                
                
                
                //Sublocality
                
                destination1.searchedsubLocality = locationnamefromtextfield
                
                //All
                
                destination1.searchedaLiqType = searchedaLiqType

                
            }
        }
            
        if segue.identifier == "segforvodkafromcocktail"
        {
            if let destination1 = segue.destinationViewController as? tableviewclassvodka
            {
                destination1.header1 = headerfortableview
                destination1.liqvodkaname = newtextfieldtableview.text
                var liqvodkaname = newtextfieldtableview.text
                let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination1.liqvodkaname = trimmedString
                //  destination1.liqnamefromtableview = trimmedString
                // destination1.toggleboolean = toggleboolean
                destination1.header1 = headerfortableview
                println(headerfortableview.count)
                //destination1.toggle = toggle
                //destination1.toggleboolean = toggleforboth
                //  destination1.togglevodka = togglebeer
                destination1.getcitylatitude = getcitylatitude
                destination1.getcitylongitude = getcitylongitude
                destination1.getdevicelatitude = getdevicelatitude
                destination1.getdevicelongitude = getdevicelongitude
                destination1.selectedliqor = selectedliqor
                ////  destination1.getvodkalatitude = restlat
                //destination1.getvodkalongitude = restlong
                // destination1.getcitylatitufrombeerscreen = getcitylatitude
                // destination1.getcitylongitudefrombeerscreen = getcitylongitude
                destination1.getselectedcityname = getselectedcityname
                destination1.liqtypefromTextfield = liqtypefromTextfield
                println(locationnamefromtextfield)
                destination1.locationnamefromtextfield = locationnamefromtextfield
                destination1.localityFromtextfield = localityFromtextfield
                destination1.liqFromresult = newtextfieldtableview.text
                destination1.citylatitudefFomresult = citylat
                destination1.citylongitudeFromresult = citylong
                destination1.localityfromtextfield1 = citydropdowntextfield.text
                destination1.liqtypeFromresult = dropdowntextfield.text
                
                destination1.searchedLocality = searchedLocality
                
                
                //Beer
                destination1.searchedLiq = searchedLiq
                
                
                
                //Sublocality
                
                destination1.searchedsubLocality = locationnamefromtextfield
                
                //All
                
                destination1.searchedaLiqType = searchedaLiqType

                
            }
        }
            
        else if segue.identifier == "getwineandbeernearyoufromcocktail"
        {
            if let destination2 = segue.destinationViewController as? mapview
            {
                destination2.getdevicelatitude = getdevicelatitude
                destination2.getdevicelongitude = getdevicelongitude
                destination2.newlocate = locationnamefromtextfield
            }
        }
        
        else if segue.identifier == "gobacktoresult1"
        {
            if let destination2 = segue.destinationViewController as? results1
            {
                //Locality
                destination2.searchedLocality = searchedLocality
                
                
                //Beer
                destination2.searchedLiq = searchedLiq
                
                
                
                //Sublocality
                
                destination2.searchedsubLocality = locationnamefromtextfield
                
                //All
                
                destination2.searchedaLiqType = searchedaLiqType
            }

        }
        
    }
    
    @IBAction func backbutton(sender: UIButton)
    {
        performSegueWithIdentifier("gobacktoresult1", sender: self)
    }
    
    @IBAction func getdeals(sender: UIButton) {
        performSegueWithIdentifier("dealsnearyoufrombeer", sender: self)
    }
    
    
    
    func pintsoring (var array:[Restauarantcocktail]) -> [Restauarantcocktail]
    {
        
        for var i: Int = 0; i < array.count - 1; i++
        {
            for var j: Int = i + 1; j < array.count; j++
            {
                println(j)
                if (array[j].minp < array[i].minp && array[j].minp > 0)
                {
                    
                    let temp = array[j]
                    println(temp.minp)
                    array[j] = array[i]
                    println(array[j].minp)
                    array[i] = temp
                    println(array[i].minp)
                }
                else if (array[i].minp == 0 && array[j].minp > 0)
                {
                    let temp = array[i]
                    println(temp.minp)
                    array[i] = array[j]
                    println(array[j].minp)
                    array[j] = temp
                    //println(array[i].)
                    
                }
            }
        }
        
        return array
        
    }
    
    func bottlesorting (var array:[Restauarantcocktail]) -> [Restauarantcocktail]
    {
        
        for var i: Int = 0; i < array.count - 1; i++
        {
            
            for var j: Int = i + 1; j < array.count; j++
            {
                println(j)
                if (array[j].maxp < array[i].maxp && array[j].maxp > 0)
                {
                    
                    let temp = array[j]
                    println(temp.maxp)
                    array[j] = array[i]
                    println(array[j].maxp)
                    array[i] = temp
                    println(array[i].maxp)
                }
                else if (array[i].maxp == 0 && array[j].maxp > 0)
                {
                    let temp = array[j]
                    println(temp.maxp)
                    array[j] = array[i]
                    println(array[j].maxp)
                    array[i] = temp
                    println(array[i].maxp)
                }
                
                
            }
        }
        return array
        
    }
    
    func Happyhours()
    {
        var array = [Restauarantcocktail]()
        
        array = header2
        if togglebeer == true
        {
            self.array1 = header2
            for var i = array.count-1;i >= 0;i--
            {
                if array[i].ishappy != "Yes"
                {
                    array.removeAtIndex(i)
                }
            }
            header2 = array
        }
        else
        {
            self.array1 = header2
            println(array1.count)
            if countfurther == 1
            {
                header2 = self.array2
            }
            else if countfurther == 2
            {
                header2 = self.array2
            }
            else if countfurther == 3
            {
                header2 = self.array2
            }
            else
            {
                println(array1.count)
                header2 = self.array1
            }
        }
        if boolexists == true{
            header2 = self.bottlesorting(header2)
        }
        else{
            header2 = self.pintsoring(header2)
        }
        tableview.reloadData()
        
        
    }
    
    func colormethod(head: [Restaurant],newheadarray:[Restaurant]) -> [Restaurant]
    {
        println(head.count)
        println(newheadarray.count)
        for var i = 0 ; i < head.count ; i++
        {
            println(i)
            head[i].color = true
            println(head[i].color)
            for var j = 0 ; j < newheadarray.count ; j++
            {
                println(j)
                println(head[i].restname)
                println(newheadarray[j].restname)
                
                
                if head[i].restname == newheadarray[j].restname
                {
                    
                    head[i].color = false
                    println(head[i].color)
                    
                }
            }
            
        }
        return head
    }
    
    @IBAction func popupbuttonclicked(sender: UIButton, forEvent event: UIEvent)
    {

        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Contact details",action: header2[sender.tag].Phoneone,label: header2[sender.tag].Phonetwo, value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])
        
        
        
        //  var tracker1 = GAI.sharedInstance().defaultTracker
        
        //        tracker1.send(GAIDictionaryBuilder.createEventWithCategory("Game 1", action: "Start Pressed", label: "Start Timer One", value: nil).build() as [NSObject : AnyObject])
        //        println(tracker1)
        
        //        var tracker2:GAITracker = GAI.sharedInstance().defaultTracker as GAITracker
        //        tracker2.set(kGAIScreenName, value:"Tabelviewscreen Screen")
        
       // self.tableview.userInteractionEnabled = false
        let imageName = "Popbackground.png"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            // print the touch location on the button
            
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.DynamicView=UIView(frame: CGRectMake(self.view.frame.origin.x + 60 ,p!.y + 15,self.view.frame.width * 0.5,90))
            imageView.frame = CGRect(x: 0,y: 0,width: DynamicView.frame.width,height: DynamicView.frame.height)
            
            let closelocationpopupbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            closelocationpopupbutton.frame = CGRectMake(DynamicView.frame.width-35 ,DynamicView.frame.height/2 - 13,25,25)
            closelocationpopupbutton.addTarget(self, action: "popupbuttonclickedclosed:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            closelocationpopupbutton.setBackgroundImage(image1, forState: .Normal)
            
            
            
            Findongooglemapsbutton.frame = CGRectMake(0,45,DynamicView.frame.width - 30,30)
            Findongooglemapsbutton.addTarget(self, action: "call1:", forControlEvents: UIControlEvents.TouchUpInside)
            Findongooglemapsbutton.setTitle(header2[sender.tag].Phoneone, forState: .Normal)
            Findongooglemapsbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 14)
            
            let Findongooglemapsbutton1 = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            Findongooglemapsbutton1.frame = CGRectMake(0,15,DynamicView.frame.width - 30,30)
            Findongooglemapsbutton1.addTarget(self, action: "call2:", forControlEvents: UIControlEvents.TouchUpInside)
            Findongooglemapsbutton1.setTitle(header2[sender.tag].Phonetwo, forState: .Normal)
            Findongooglemapsbutton1.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 14)
            
            
            
            self.view.addSubview(DynamicView)
            self.DynamicView.addSubview(imageView)
            self.DynamicView.addSubview(closelocationpopupbutton)
            self.DynamicView.addSubview(Findongooglemapsbutton)
            self.DynamicView.addSubview(Findongooglemapsbutton1)
            
            
            
            
            
            
        }
        
        
    }
    
    
    
    func popupbuttonclickedclosed(sender: UIButton)
    {
        self.tableview.userInteractionEnabled = true
        DynamicView.hidden = true
    }
    
    func call1(sender: UIButton)
    {
        callNumber(header2[sender.tag].Phoneone)
    }
    
    func call2(sender: UIButton)
    {
        callNumber(header2[sender.tag].Phonetwo)
    }
    
    
    
    @IBAction func revelofferclicked(sender: UIButton, forEvent event: UIEvent)
    {
        
        
      //  self.tableview.userInteractionEnabled = false
        // downcast sender as a UIView
        
        
        let buttonView = sender as UIView;
        var p : CGPoint!
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            let imageName = "Revelpopup.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            
            
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            p  = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            
            self.DynamicView=UIView(frame: CGRectMake(self.view.frame.width*0.1,p!.y - 180,self.view.frame.width * 0.8 , 195))
            
            imageView.frame = CGRect(x: 0,y: 0,width: DynamicView.frame.width,height: DynamicView.frame.height)
            
            var dynamicLabel: UILabel = UILabel()
            dynamicLabel.frame = CGRectMake(15, 10, DynamicView.frame.width - 20, 27)
            dynamicLabel.textColor = UIColor.blackColor()
            dynamicLabel.textAlignment = NSTextAlignment.Left
            dynamicLabel.text = "To avail a 10% discount on your bill,press the Avail Offer button"
            dynamicLabel.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel.numberOfLines = 2
            
            var dynamicLabel1: UILabel = UILabel()
            dynamicLabel1.frame = CGRectMake(15, 40, DynamicView.frame.width - 20, 27)
            dynamicLabel1.textColor = UIColor.blackColor()
            dynamicLabel1.textAlignment = NSTextAlignment.Left
            dynamicLabel1.text = " 1. The following post will be generated through \nyour Facebook account."
            dynamicLabel1.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel1.numberOfLines = 2
            
            var dynamicLabel2: UILabel = UILabel()
            dynamicLabel2.frame = CGRectMake(17, 70, DynamicView.frame.width - 20, 27)
            dynamicLabel2.textColor = UIColor.blackColor()
            dynamicLabel2.textAlignment = NSTextAlignment.Left
            dynamicLabel2.text = " i just got a 10% discount at \(head[sender.tag].restname) through\n the BottomzUp App"
            newrestnamefromtag = head[sender.tag].restname
            dynamicLabel2.font = UIFont(name:"MyriadPro-Bold", size: 9)
            dynamicLabel2.numberOfLines = 2
            
            var dynamicLabel3: UILabel = UILabel()
            dynamicLabel3.frame = CGRectMake(15, 100, DynamicView.frame.width - 20, 27)
            dynamicLabel3.textColor = UIColor.blackColor()
            dynamicLabel3.textAlignment = NSTextAlignment.Left
            dynamicLabel3.text = " 2.Show this Faceboof post to the restaurant to\n avail this offer"
            dynamicLabel3.font = UIFont(name:"MYRIADPRO-REGULAR", size: 11)
            dynamicLabel3.numberOfLines = 2
            
            
            
            let dunamicButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            dunamicButton.frame = CGRectMake(DynamicView.frame.width - 23,10,16,16)
            dunamicButton.addTarget(self, action: "buttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            dunamicButton.setBackgroundImage(image1, forState: .Normal)
            
            
            
            let imageName2 = "revelofferbutton.png"
            let image2 = UIImage(named: imageName2)
            let imageView2 = UIImageView(image: image2!)
            
            
            var button   = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            button.frame = CGRectMake(DynamicView.frame.width/2 - 75,120,150,60)
            button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
            button.setBackgroundImage(image2, forState: .Normal)
            
            
            self.view.addSubview(DynamicView)
            self.DynamicView.addSubview(imageView)
            self.DynamicView.addSubview(dynamicLabel)
            self.DynamicView.addSubview(dynamicLabel1)
            self.DynamicView.addSubview(dynamicLabel2)
            self.DynamicView.addSubview(dunamicButton)
            self.DynamicView.addSubview(dynamicLabel3)
            self.DynamicView.addSubview(button)
        }
        
    }
    
    func buttonTouched(sender:UIButton!)
    {
        // print("vinayak")
        // self.view.userInteractionEnabled = true
        self.tableview.userInteractionEnabled = true
        DynamicView.hidden = true
        
    }
    
    func Action(sender:UIButton)
    {
        // print("vinayak")
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("i just got a 10% discount at \(newrestnamefromtag) through\n the BottomzUp App")
        
        
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    
    
    @IBAction func locationpopup(sender: UIButton, forEvent event: UIEvent)
    {
        reslatitude = header2[sender.tag].Restaurantlatitude
        reslongitude = header2[sender.tag].Restaurantlongitude
        let tracker = GAI.sharedInstance().defaultTracker
        let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("Location Name",action: "Location Name",label: "Location Name", value: nil).build()
        tracker.send(eventTracker as! [NSObject : AnyObject])
        
        
        // downcast sender as a UIView
        
       // self.tableview.userInteractionEnabled = false
        let buttonView = sender as UIView;
        
        // get any touch on the buttonView
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            
            
            let imageName = "Popbackground.png"
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image!)
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.locatiopopupview = UIView(frame: CGRectMake(p!.x - 140,p!.y + 20,165,95))
            imageView.frame = CGRect(x: 0,y: 0,width: locatiopopupview.frame.width,height: locatiopopupview.frame.height)
            
            let closelocationpopupbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            closelocationpopupbutton.frame = CGRectMake(locatiopopupview.frame.width-27 ,locatiopopupview.frame.height/2 - 10,16,16)
            closelocationpopupbutton.addTarget(self, action: "locationpopupclosebuttontouchedbuttonTouched:", forControlEvents: UIControlEvents.TouchUpInside)
            let imageName1 = "popupclosebutton.png"
            let image1 = UIImage(named: imageName1)
            let imageView1 = UIImageView(image: image1!)
            closelocationpopupbutton.setBackgroundImage(image1, forState: .Normal)
            
            
            self.addresslabel.frame = CGRectMake(10, 5, locatiopopupview.frame.width - 25, 35)
            self.addresslabel.textColor = UIColor.blackColor()
            self.addresslabel.textAlignment = NSTextAlignment.Left
            self.addresslabel.text = newaddress
            self.addresslabel.font = UIFont(name:"MYRIADPRO-REGULAR", size: 14)
            self.addresslabel.numberOfLines = 3
            
            
            let Findongooglemapsbutton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
            Findongooglemapsbutton.frame = CGRectMake(5,50,locatiopopupview.frame.width - 30,30)
            Findongooglemapsbutton.addTarget(self, action: "gotomapgoogle:", forControlEvents: UIControlEvents.TouchUpInside)
            
            var text = "Find on Google Maps"
            var titleString : NSMutableAttributedString = NSMutableAttributedString(string: "Find on Google Maps")
            titleString.addAttribute(NSUnderlineStyleAttributeName, value: NSUnderlineStyle.StyleSingle.rawValue, range: NSMakeRange(0, count(text.utf8)))
            Findongooglemapsbutton.setAttributedTitle(titleString, forState: .Normal)
            Findongooglemapsbutton.titleLabel?.font = UIFont(name: "MYRIADPRO-REGULAR", size: 14)
            
            
            self.view.addSubview(locatiopopupview)
            self.locatiopopupview.addSubview(imageView)
            self.locatiopopupview.addSubview(closelocationpopupbutton)
            self.locatiopopupview.addSubview(self.addresslabel)
            self.locatiopopupview.addSubview(Findongooglemapsbutton)
            
        }
        
    }
    
    
    
    func locationpopupclosebuttontouchedbuttonTouched(sender: UIButton)
    {
        
        self.tableview.userInteractionEnabled = true
        self.locatiopopupview.hidden = true
        
    }
    
    func gotomapgoogle(sender : UIButton)
    {
        println(reslatitude)
        println(reslongitude)
        println(getdevicelatitude)
        println(getdevicelongitude)
        //  UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
        
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=13.043148,77.570403&daddr=\(reslatitude),\(reslongitude)")!)
    }
    
    
    
    
    
    func callNumber(phoneNumber:String)
    {
        UIApplication.sharedApplication().openURL(NSURL(string:"tel://"+"\(phoneNumber)")!)
        
    }
    @IBAction func lookfurthernewbeer(sender: UIButton, forEvent event: UIEvent)
    {
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
        
        
        
        let buttonView = sender as UIView;
        if let touch = event.touchesForView(buttonView)?.first as? UITouch
        {
            
            
            // print the touch location on the button
            println(touch.locationInView(self.view))
            var point = touch.locationInView(self.view)
            var p = buttonView.superview?.convertPoint(buttonView.center, toView: self.view)
            
            self.locatiopopupview = UIView(frame: CGRectMake(p!.x - 38,p!.y - 270,75,230))
            
            if lookfurtheboolean == true
            {
                locatiopopupview.hidden = false
            }
            else
            {
                locatiopopupview.hidden = true
            }
            
            var tag = sender.tag
            
            switch (tag){
                
                //            case 1:
                //
                //                closelocationpopupbutton7kms.frame = CGRectMake(0,0,75,75)
                //                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton7kms.tag=7
                //                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                //
                //                closelocationpopupbutton5kms.frame = CGRectMake(0,75,75,75)
                //                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton5kms.tag=5
                //                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                //
                //                closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
                //                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //                closelocationpopupbutton2kms.tag=2
                //                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                //
                //
                //                self.view.addSubview(locatiopopupview)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                //                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
                
            case 2:
                closelocationpopupbutton7kms.frame = CGRectMake(0,90,70,70)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,160,70,70)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                self.view.addSubview(locatiopopupview)
                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                // self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
                
                
            case 5:
                closelocationpopupbutton7kms.frame = CGRectMake(0,90,70,70)
                closelocationpopupbutton7kms.addTarget(self, action: "lookfurtherfor7KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton7kms.tag=7
                closelocationpopupbutton7kms.setBackgroundImage(imageName7, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,160,70,70)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                
                self.view.addSubview(locatiopopupview)
                self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                //self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
            case 7:
                
                closelocationpopupbutton5kms.frame = CGRectMake(0,90,70,70)
                closelocationpopupbutton5kms.addTarget(self, action: "lookfurtherfor5KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton5kms.tag=5
                closelocationpopupbutton5kms.setBackgroundImage(imageName5, forState: .Normal)
                
                
                
                closelocationpopupbutton2kms.frame = CGRectMake(0,160,70,70)
                closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                closelocationpopupbutton2kms.tag=2
                closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
                self.view.addSubview(locatiopopupview)
                //  self.locatiopopupview.addSubview(closelocationpopupbutton7kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton5kms)
                self.locatiopopupview.addSubview(closelocationpopupbutton2kms)
                
                
                
                //            closelocationpopupbutton2kms.frame = CGRectMake(0,150,75,75)
                //            closelocationpopupbutton2kms.addTarget(self, action: "lookfurtherfor2KMS:", forControlEvents: UIControlEvents.TouchUpInside)
                //            closelocationpopupbutton2kms.tag=2
                //            closelocationpopupbutton2kms.setBackgroundImage(imageName2, forState: .Normal)
                
            default: return
            }
            
            
        }
        
    }
    
    
    func lookfurtherfor2KMS(sender: UIButton)
    {
        JLToast.makeText("Restaurants Near 2KMS.", delay: 2, duration:JLToastDelay.LongDelay).show()
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
            countfurther = 1
            println(liqFromresult)
            println(liqtypeFromresult)
            
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header2
            
        case 5:
            countfurther = 2
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header2
            
        case 7:
            countfurther = 3
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header2
            
        default: return
            
        }
        
        
        self.locatiopopupview.hidden = true
        
    }
    
    
    func lookfurtherfor5KMS(sender: UIButton)
    {
        JLToast.makeText("Restaurants Near 5KMS.", delay: 2, duration:JLToastDelay.LongDelay).show()
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
            countfurther = 1
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header2
            
        case 5:
            countfurther = 2
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header2
            
        case 7:
            countfurther = 3
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header2
            
        default: return
            
        }
        
        
        self.locatiopopupview.hidden = true
    }
    
    func lookfurtherfor7KMS(sender: UIButton)
    {
        JLToast.makeText("Restaurants Near 7KMS.", delay: 2, duration:JLToastDelay.LongDelay).show()
        //JLToast.makeText("Restaurants Near 7KMS", duration: JLToastDelay.ShortDelay).show()
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
            countfurther = 1
            println(liqtypeFromresult)
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=2&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi2kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 2
            self.array1 = self.header2
            
        case 5:
            countfurther = 2
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=5&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi5kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 5
            self.array1 = self.header2
            
        case 7:
            countfurther = 3
            if liqFromresult == "All"
            {
                var trimmedliqtypeFromresult = liqtypeFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqtypeFromresult)")
            }
            else
            {
                var trimmedliqFromresult = liqFromresult.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylatitudefFomresult)&long=\(citylongitudeFromresult)&km=7&records=15&query=\(trimmedliqFromresult)")
            }
            
            lookfurtherdefault.setImage(imagewi7kmrhradius, forState: .Normal)
            lookfurtherdefault.tag = 7
            self.array1 = self.header2
            
        default: return
            
        }
        self.locatiopopupview.hidden = true
    }
    func print(sender: UIButton)
    {
        println("Mask")
    }
    
    
    @IBAction func showdropdowns(sender: UIButton)
    {

        self.showdropdownview = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        showdropdownview.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        var tapview = UIView()
        tapview = UIView(frame: CGRectMake(0,200,self.view.frame.width,self.view.frame.height))
        var tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        showdropdownview.userInteractionEnabled = true
        
        
        // label to display select beer and city name
        self.liqplacedisplaylabel = UILabel(frame: CGRectMake(10,3,self.view.frame.width - 20,25))
        self.liqplacedisplaylabel.backgroundColor = UIColor.whiteColor()
        self.liqplacedisplaylabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        self.liqplacedisplaylabel.text =  liqtypefromTextfield + space + near + space + locationnamefromtextfield
        self.liqplacedisplaylabel.layer.masksToBounds = true
        self.liqplacedisplaylabel.layer.cornerRadius = 10
        self.liqplacedisplaylabel.layer.borderWidth = 2
        self.liqplacedisplaylabel.layer.borderColor = UIColor.whiteColor().CGColor
        self.liqplacedisplaylabel.textAlignment = NSTextAlignment.Center
        self.liqplacedisplaylabel.textColor = UIColor.darkGrayColor()
        
        
        // Liq catogery textfiled
        self.dropdowntextfield = UITextField (frame:CGRectMake(10,40,self.view.frame.width - 20,35));
        dropdowntextfield.backgroundColor = UIColor.whiteColor()
        
        self.dropdowntextfield.delegate = self
        dropdowntextfield.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        dropdowntextfield.text = liqtypeFromresult
        dropdowntextfield.tag = 5
        dropdowntextfield.textColor = UIColor.darkGrayColor()
        dropdowntextfield.hidden = true
        
        self.dropdowntextfieldnew = UIView(frame:CGRectMake(10,40,self.view.frame.width - 20,35));
        self.dropdowntextfieldnewlabel = UILabel(frame:CGRectMake(10,40,self.view.frame.width - 20,35));
        dropdowntextfieldnew.layer.cornerRadius = 5
        dropdowntextfieldnew.backgroundColor = UIColor.whiteColor()
        dropdowntextfieldnewlabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        dropdowntextfieldnewlabel.text = liqtypeFromresult
        dropdowntextfieldnewlabel.textColor = UIColor.darkGrayColor()
        
        var dropdowntextfieldnewtapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "liqcategorytapped:")
        dropdowntextfieldnew.addGestureRecognizer(dropdowntextfieldnewtapped)
        dropdowntextfieldnew.userInteractionEnabled = true
        showdropdownview.addSubview(dropdowntextfieldnew)
        showdropdownview.addSubview(dropdowntextfieldnewlabel)
        
        // Liq catogery drop down tableview
        beerdropdowntableview.frame         =   CGRectMake(10,77,self.view.frame.width - 20,150)
        beerdropdowntableview.delegate      =   self
        beerdropdowntableview.dataSource    =   self
        beerdropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beerdropdowntableview.tag = 4
        beerdropdowntableview.layer.cornerRadius = 5
       // beerdropdowntableview.layer.borderWidth = 2
       // beerdropdowntableview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        
        
        // liq sub catoegory textfiled
        self.newtextfieldtableview = UITextField (frame:CGRectMake(10,85,self.view.frame.width - 20,35));
        newtextfieldtableview.backgroundColor = UIColor.whiteColor()
        self.newtextfieldtableview.delegate = self
        newtextfieldtableview.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        newtextfieldtableview.text = liqFromresult
        newtextfieldtableview.tag = 2
        newtextfieldtableview.textColor = UIColor.darkGrayColor()
        newtextfieldtableview.hidden = true
        
        self.newtextfieldtableviewnew = UIView(frame:CGRectMake(10,85,self.view.frame.width - 20,35));
        self.newtextfieldtableviewlabel = UILabel(frame:CGRectMake(10,85,self.view.frame.width - 20,35));
        newtextfieldtableviewnew.layer.cornerRadius = 5
        newtextfieldtableviewnew.backgroundColor = UIColor.whiteColor()
        newtextfieldtableviewlabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        newtextfieldtableviewlabel.text = liqFromresult
        newtextfieldtableviewlabel.textColor = UIColor.darkGrayColor()
        
        var newtextfieldtableviewnewtapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "liqsubcategorytapped:")
        newtextfieldtableviewnew.addGestureRecognizer(newtextfieldtableviewnewtapped)
        newtextfieldtableviewnew.userInteractionEnabled = true
        showdropdownview.addSubview(newtextfieldtableviewnew)
        showdropdownview.addSubview(newtextfieldtableviewlabel)

        
        // Liq sub category drop down tableview
        beerTypedropdowntableview.frame         =   CGRectMake(10,126,self.view.frame.width - 20,150)
        beerTypedropdowntableview.delegate      =   self
        beerTypedropdowntableview.dataSource    =   self
        beerTypedropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        beerTypedropdowntableview.tag = 6
        beerTypedropdowntableview.layer.cornerRadius = 5
       // beerTypedropdowntableview.layer.borderColor = UIColor.lightGrayColor().CGColor
       // beerTypedropdowntableview.layer.borderWidth = 2
        
        
        // Locality dropdown textfield
        self.citydropdowntextfield = UITextField (frame:CGRectMake(10,135,self.view.frame.width - 20,35));
        citydropdowntextfield.backgroundColor = UIColor.whiteColor()
        self.citydropdowntextfield.delegate = self
        citydropdowntextfield.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        // newtextfieldtableview.text = liqtypefromTextfield
        citydropdowntextfield.text = localityfromtextfield1
        citydropdowntextfield.tag = 8
        citydropdowntextfield.textColor = UIColor.darkGrayColor()
        citydropdowntextfield.hidden = true
        
        self.citydropdowntextfieldnew = UIView(frame:CGRectMake(10,135,self.view.frame.width - 20,35));
        self.citydropdowntextfieldlabel = UILabel(frame:CGRectMake(10,135,self.view.frame.width - 20,35));
        citydropdowntextfieldnew.layer.cornerRadius = 5
        citydropdowntextfieldnew.backgroundColor = UIColor.whiteColor()
        citydropdowntextfieldlabel.font = UIFont(name: "MYRIADPRO-REGULAR", size: fontsizenew)
        citydropdowntextfieldlabel.text = localityfromtextfield1
        citydropdowntextfieldlabel.textColor = UIColor.darkGrayColor()
        
        var citydropdowntextfieldnewtapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "localityrytapped:")
        citydropdowntextfieldnew.addGestureRecognizer(citydropdowntextfieldnewtapped)
        citydropdowntextfieldnew.userInteractionEnabled = true
        showdropdownview.addSubview(citydropdowntextfieldnew)
        showdropdownview.addSubview(citydropdowntextfieldlabel)

        // Locality drop down tableview
        citydropdowntableview.frame         =   CGRectMake(10,173,self.view.frame.width - 20,150)
        citydropdowntableview.delegate      =   self
        citydropdowntableview.dataSource    =   self
        citydropdowntableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        citydropdowntableview.tag = 9
        citydropdowntableview.layer.cornerRadius = 5
       // citydropdowntableview.layer.borderWidth = 2
        //citydropdowntableview.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        
        // Search Button
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
        
        
        
        
        // Sublocality search textfiled
        self.newtextfieldtableviewcity = AutoCompleteTextField1 (frame: CGRect(x: 10,y: 185,width: self.view.frame.width - 20,height: 35), superview: showdropdownview)
        AutoCompleteTextField1.autoCompleteTableView?.layer.cornerRadius = 5
      //  AutoCompleteTextField1.autoCompleteTableView?.layer.borderWidth = 2
        //AutoCompleteTextField1.autoCompleteTableView?.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        self.newtextfieldtableviewcity.layer.cornerRadius = 5
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
    
    func liqcategorytapped(gestureRecognizer: UITapGestureRecognizer)
    {
        
        beerdropdowntableview.hidden = !beerdropdowntableview.hidden
        citydropdowntableview.hidden = true
        beerTypedropdowntableview.hidden = true
        self.view.endEditing(true)
        AutoCompleteTextField1.autoCompleteTableView?.hidden = true
    }
    func liqsubcategorytapped(gestureRecognizer: UITapGestureRecognizer)
    {
        // getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(dropdowntextfieldnewlabel.text)")
        getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(dropdowntextfieldnewlabel.text!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)")
        beerTypedropdowntableview.hidden = !beerTypedropdowntableview.hidden
        citydropdowntableview.hidden = true
        beerdropdowntableview.hidden = true
        AutoCompleteTextField1.autoCompleteTableView?.hidden = true
        self.view.endEditing(true)
    }
    
    func localityrytapped(gestureRecognizer: UITapGestureRecognizer)
    {
        citydropdowntableview.hidden = !citydropdowntableview.hidden
        beerdropdowntableview.hidden = true
        beerTypedropdowntableview.hidden = true
        AutoCompleteTextField1.autoCompleteTableView?.hidden = true
        self.view.endEditing(true)
        
    }
    
    func Getresults(sender:UIButton!)
    {
        PleaseWaitlabel2 = UILabel(frame: CGRectMake(-25,20, 150, 100))
        PleaseWaitlabel2.text = "Please Wait..."
        PleaseWaitlabel2.textColor = UIColor.whiteColor()
       // self.actInd2.center = self.view.center
        self.actInd2 = UIActivityIndicatorView(frame: CGRectMake(self.view.frame.width/2 - 30, 280 , 50, 50))
        self.actInd2.hidesWhenStopped = true
        self.actInd2.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.actInd2.color = UIColor.whiteColor()
        view.addSubview(actInd2)
        self.actInd2.startAnimating()
        self.actInd2.addSubview(PleaseWaitlabel2)
        self.actInd2.tag = 100
        showdropdownview.hidden = false
        if togglebeer == true
        {
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
            togglebeer == false
        }
        liqtypefromTextfield = dropdowntextfield.text
        locationnamefromtextfield = newtextfieldtableviewcity.text
        
 
        
        onselect()
    }
    
    func handleTap(gestureRecognizer: UIGestureRecognizer)
    {
        
        beerTypedropdowntableview.hidden = true
        beerdropdowntableview.hidden = true
        citydropdowntableview.hidden = true
        self.view.endEditing(true)
        self.showdropdownview.hidden = true
    }
    
    
    
    func viewclosed(sender: UIButton)
    {
        showdropdownview.hidden = true
    }
    func locationdisplay(sender: UIButton)
    {
        self.DynamicView = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        DynamicView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        
        self.newtextfieldtableviewcity = AutoCompleteTextField1 (frame: CGRect(x: 35,y: 36,width: self.view.frame.width - 35,height: 35), superview: DynamicView)
        
        newtextfieldtableviewcity.backgroundColor = UIColor.whiteColor()
        newtextfieldtableviewcity.font = UIFont(name: "HelveticaNeue-Bold", size: fontsizenew)
        //   newtextfieldtableviewcity.placeholder = " Search for city here..."
        configureTextField()
        handleTextFieldInterfaces()
        
        let imageName2 = "searchimage.png"
        let image2 = UIImage(named: imageName2)
        let imageView2 = UIImageView(image: image2!)
        imageView2.backgroundColor = UIColor.whiteColor()
        
        imageView2.frame = CGRectMake(0,36,35,35)
        self.view.addSubview(DynamicView)
        self.DynamicView.addSubview(newtextfieldtableviewcity)
        self.DynamicView.addSubview(imageView2)
        
    }
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        println("Animation stopped")
    }
    
    
    func ApiCall()
    {
        
        println(citylat)
        println(citylong)
        
        if dropdowntextfield.text != nil && newtextfieldtableviewcity.text != "" && citydropdowntextfield.text != nil && newtextfieldtableview.text != nil
        {
        
        if newtextfieldtableview.text == "All"
        {
            var passliq = dropdowntextfield.text
            println(newtextfieldtableview.text)
            
            var passspaceremovedliq = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            println(passspaceremovedliq)
            
            
            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=500&query=\(passspaceremovedliq)")
        
        }
        else
        {
            var passliq = newtextfieldtableview.text
            println(newtextfieldtableview.text)
            
            var passspaceremovedliq = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            println(passspaceremovedliq)
            self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=500&query=\(passspaceremovedliq)")
           
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
        
        var passliq = newtextfieldtableview.text
        var passspaceremovedliq = passliq.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        
        self.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.citylat)&long=\(self.citylong)&km=2&records=500&query=\(passspaceremovedliq)")
        
        
    }
    @IBAction func findwineandbeernewryou(sender: UIButton)
    {
        performSegueWithIdentifier("getwineandbeernearyoufromcocktail", sender: self)
    }

    

}
