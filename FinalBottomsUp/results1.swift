//
//  results1.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 23/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

//
//  results.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import CoreFoundation


class results1: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate,UIWebViewDelegate
{
    var getselectedcityname:String!
    
    var head1:[Restaurant] = [Restaurant]()
    var head2:[Restauarantcocktail] = [Restauarantcocktail]()
    var fstobj1 = Restaurant()
    var fstobj2 = Restauarantcocktail()
    
    
    var citylat:Double!
    var citylong:Double!
    var variable:String!
    var trimmedString:String!
    var liqnamefromtextfield:String!
    var check:String!
    
    var newarar =  [String]()
    var arraysring = [String]()
    
    
    var winecitylat:Double!
    var winecitylong:Double!

    
    @IBOutlet weak var autocompletedTextfieldnew: AutoCompleteTextField3!

   // @IBOutlet weak var auocompletetextfieldsublocality: AutoCompleteTextField4!
    
    @IBOutlet weak var localityTextfield: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    
    @IBOutlet weak var findapubbuttonnew: UIButton!

    
    private var responseData:NSMutableData?
    
    private var connection:NSURLConnection?
    
    private let googleMapsKey = "AIzaSyC45IqTyfdeO5SzyLDGAVWiwADSSv70S6g"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
    
   // var autocompleteUrls = [String]()
    
    var locationManager1: CLLocationManager!
    
    var locationname:String!
    var arar = [String]()
    
    var flag = false
    var devicelatitude:Double!
    var devicelongitude:Double!
    
    var iscitytextfieldhavedata = false
    var isliqtextfieldhasdata = false
    

    
    var selectedliqor:String!
    
    
    var restvodkalang:Double!
    var restvodkalat:Double!
    
    var restlat:Double!
    var restlong:Double!
    
    var header:[Restauarantvodka] = [Restauarantvodka]()
    // var headervodka:[Restauarantvodka] = [Restauarantvodka]()
    var vodkaobj = Restauarantvodka()
    
    
    @IBOutlet weak var tableviewnew: UITableView!
    
    var locationnamenew:String!
    var citynamenew:String!
     // var comma = ","
    
    @IBOutlet weak var dealsnearyou: UIButton!
    
    var LOcalityTableview: UITableView  =   UITableView()
    
    var items: [String] = ["Delhi", "Gurgaon", "Noida"]
    
    var localityfromtextfield:String!
    var beerTypefromtextfield:String!
    
    @IBOutlet weak var beerTypeTextfield: UITextField!
    
    var liqTypes: [String] = ["Beer", "Whiskey", "Vodka","rum","Cocktail"]

    var liqTypetableview: UITableView  =   UITableView()
    
   // var liqTypes1:[String] = ["BUDWEISER","CARLSBERG","FOSTERS","HEINEKEN","KINGFISHER"]
    var liqTypes1:[String] = [String]()
    
    var delhi = "Delhi"
    
    var mainlocalityfromtextfield:String!
    
    var currentLocationname:String!
    
    var currentLocation = "Current Location"
     var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
     var actInd1 : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
   
   // var indicatorview = UIView()
    var PleaseWaitlabel = UILabel()
    var PleaseWaitlabel1 = UILabel()
    var space = " "
    var searchedin = "Searched in"
    var forliqtype = "For liquor"
    
    var count = 0

    @IBOutlet weak var label: UILabel!
     //var label = UILabel(frame: CGRectMake(15, 232, 110, 30))
    //var categoryliqlabel = UILabel(frame: CGRectMake(15, 167, 110, 30))
   // var subcategoryliqlabel = UILabel(frame: CGRectMake(15, 167, 110, 30))
    
    

    @IBOutlet weak var subcategoryliqlabel: UILabel!
    @IBOutlet weak var liqsubcatogeryDynamicView: UIView!
    @IBOutlet weak var localityDynamicView: UIView!
    @IBOutlet weak var categoryliqlabel: UILabel!
    @IBOutlet weak var liqcatogeryDynamicView: UIView!
    
    
    var searchedLocality:String!
    var searchedLiq:String!
    var searchedaLiqType:String!
    var searchedsubLocality:String!
    
    var category = false
    var subcategory = false
    
    var initaialcount = 0
    
    var place_id:String!
    var place_id1:String!
    
    var uName:String!
    
    @IBOutlet weak var Namedisplaylabel: UILabel!
    
    override func viewDidLoad()
    {
        if self.uName != nil
        {
          Namedisplaylabel.text = "Time to drink, \(uName)"
        }
        else
        {
           Namedisplaylabel.text = "Time to drink, Archy"
        }
        
        Namedisplaylabel.font = UIFont(name: "MyriadPro-Bold", size: 23.0)
        Namedisplaylabel.textAlignment = NSTextAlignment.Center
        Namedisplaylabel.textColor = UIColor.whiteColor()
        tableviewnew.tableFooterView = UIView()
        tableviewnew.layer.cornerRadius = 5
        
        AutoCompleteTextField3.autoCompleteTableView?.tableFooterView = UIView()
        AutoCompleteTextField3.autoCompleteTableView?.layer.cornerRadius = 5
       // AutoCompleteTextField3.autoCompleteTableView?.alwaysBounceVertical = false
        
        AutoCompleteTextField3.autoCompleteTableView?.bounces = false
         AutoCompleteTextField3.autoCompleteTableView?.scrollEnabled = true
        autocompletedTextfieldnew.textColor = UIColor.darkGrayColor()
 
        //Locality textfiled
        localityDynamicView.layer.cornerRadius=5
        localityDynamicView.backgroundColor = UIColor.whiteColor()
   

        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont(name: "MyriadPro-Regular", size: 14)
        label.textColor = UIColor.darkGrayColor()
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "localityTapped:")
        localityDynamicView.addGestureRecognizer(headerTapped)
        localityDynamicView.userInteractionEnabled = true
        localityDynamicView.tag = 200
        
        
        //liq catogery textfield
        liqcatogeryDynamicView.layer.cornerRadius=5
        categoryliqlabel.textAlignment = NSTextAlignment.Center
        categoryliqlabel.font = UIFont(name: "MyriadPro-Regular", size: 14)
        if searchedLiq != nil
        {
           categoryliqlabel.text = searchedLiq
        }
        else
        {
            categoryliqlabel.text = "Beer"
        }
        
        categoryliqlabel.textColor = UIColor.darkGrayColor()
       
        var headerTapped1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "liqcategoryTapped:")
        liqcatogeryDynamicView.addGestureRecognizer(headerTapped1)
        liqcatogeryDynamicView.userInteractionEnabled = true

        
         //liq sub catogery textfield

       liqsubcatogeryDynamicView.layer.cornerRadius=5
       liqsubcatogeryDynamicView.backgroundColor = UIColor.whiteColor()
       subcategoryliqlabel.textAlignment = NSTextAlignment.Center
        subcategoryliqlabel.font = UIFont(name: "MyriadPro-Regular", size: 14)
        if searchedaLiqType != nil
        {
            subcategoryliqlabel.text = searchedaLiqType
        }
        else
        {
          subcategoryliqlabel.text = "All"
        }
        
        subcategoryliqlabel.textColor = UIColor.darkGrayColor()
       
        var headerTapped2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "liqsubcategoryTapped:")
        liqsubcatogeryDynamicView.addGestureRecognizer(headerTapped2)
        liqsubcatogeryDynamicView.userInteractionEnabled = true
        
        
        
        
        

       PleaseWaitlabel = UILabel(frame: CGRectMake(0,20, 150, 100))
       PleaseWaitlabel.text = "Please Wait..."
       actInd.center = self.view.center
       actInd.hidesWhenStopped = true
       actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
       actInd.color = UIColor.blackColor()
       view.addSubview(actInd)
       actInd.startAnimating()
        actInd.addSubview(PleaseWaitlabel)



        if CheckforInternetViewController.isConnectedToNetwork() == true {
            print("Internet connection OK")
        } else {
            actInd.removeFromSuperview()
    
            print("Internet connection FAILED")
            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
            alert.show()
            actInd.hidden = true
        }
    
        
        dealsnearyou.hidden = true
        //tableviewnew.tableFooterView = UIView()
        textfield2.tag = 1
        autocompletedTextfieldnew.tag = 2
        localityTextfield.tag = 3
        LOcalityTableview.tag = 4
        tableviewnew.tag = 5
        liqTypetableview.tag = 6
        beerTypeTextfield.tag = 7
        AutoCompleteTextField3.autoCompleteTableView?.tag = 8
        
       // beerTypeTextfield.enabled = false
        
        
  
        textfield2.delegate = self

        tableviewnew!.dataSource = self
        tableviewnew.delegate = self
        tableviewnew!.scrollEnabled = true
        tableviewnew!.hidden = true
        
        autocompletedTextfieldnew.delegate = self
        localityTextfield.delegate = self
        beerTypeTextfield.delegate = self
      
        configureTextField()
        handleTextFieldInterfaces()
        locationManager1 = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        locationManager1.startUpdatingLocation()
       

        
        
        LOcalityTableview.frame         =   CGRectMake(15,self.localityTextfield.frame.origin.y + 10, self.view.frame.width - 30, 130);
        LOcalityTableview.bounces = false
        LOcalityTableview.delegate      =   self
        LOcalityTableview.dataSource    =   self
        LOcalityTableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(LOcalityTableview)
        LOcalityTableview.hidden = true
        LOcalityTableview.layer.borderWidth = 2
        LOcalityTableview.layer.borderColor = UIColor.darkGrayColor().CGColor
        LOcalityTableview.tableFooterView = UIView(frame: CGRectZero)
        LOcalityTableview.layer.cornerRadius = 5
        
        
        liqTypetableview.frame         =   CGRectMake(15,self.beerTypeTextfield.frame.origin.y + 20, self.view.frame.width - 30, 210);
        liqTypetableview.bounces = false
        liqTypetableview.delegate      =   self
        liqTypetableview.dataSource    =   self
        liqTypetableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(liqTypetableview)
        liqTypetableview.hidden = true
        liqTypetableview.layer.borderColor = UIColor.darkGrayColor().CGColor
        liqTypetableview.layer.borderWidth = 2
        liqTypetableview.tableFooterView = UIView(frame: CGRectZero)
        liqTypetableview.layer.cornerRadius = 5
    
        
         println(autocompletedTextfieldnew.text)
        
        


    }
    
    
    func localityTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        
        LOcalityTableview.hidden = !LOcalityTableview.hidden
        view.endEditing(true)
    }
    
    func liqcategoryTapped(gestureRecognizer: UITapGestureRecognizer)
    {

        println("Tap gesture")
       liqTypetableview.hidden = !liqTypetableview.hidden
        view.endEditing(true)
    }
    
    func liqsubcategoryTapped(gestureRecognizer: UITapGestureRecognizer)
    {

       
            if CheckforInternetViewController.isConnectedToNetwork() == true
            {
                print("Internet connection OK")
                getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(categoryliqlabel.text!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)")
                 tableviewnew.hidden = !tableviewnew.hidden
               
            }
            else{
                            print("Internet connection FAILED")
            
                            let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                            alert.show()
                            tableviewnew.hidden = true
                            textfield2.enabled = true
            }
        
        view.endEditing(true)
   
        }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

    
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
//        if textField.tag == 3
//        {
//            return false
//        }
//        else
//        {
//            return true
//        }
//    }
    
    
//    func didRecognizeTapGesture(gesture: UITapGestureRecognizer) {
//        var point: CGPoint = gesture.locationInView(gesture.view!)
//        if gesture.state == .Ended {
//            if CGRectContainsPoint(self.localityTextfield.frame, point)
//            {
//               // self.doSomething()
//                
//                self.view.endEditing(true)
//            }
//        }
//    }
//    

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userLocation:CLLocation = locations[0] as! CLLocation
        self.locationManager1.stopUpdatingLocation()
        let long = userLocation.coordinate.longitude
        let lat = userLocation.coordinate.latitude
        
//        let long = 77.07380
//        let lat = 28.63875
        
        devicelatitude = lat
        devicelongitude = long
        
        println(devicelatitude)
        println(devicelongitude)
        
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
//                self.autocompletedTextfieldnew.text = street as String
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
                  //  print(address)
                    
                    println(locality)
                    //Assigning the address to the address label on the map.
                   // self.addressLabel.text = " \(roadno) \r \(thoroughfare) \r \(subLocality) \r \(locality) \(administrativeArea) \(postalCode) \r \(country)"
                     self.currentLocationname = subLocality + "," + locality
                    if self.searchedsubLocality != nil
                    {
                        self.autocompletedTextfieldnew.text = self.searchedsubLocality
                    }
                    else
                    {
                  
                       self.autocompletedTextfieldnew.text = self.currentLocation
                    }
                    
                    
                    
                    self.PleaseWaitlabel.hidden = true
                    self.actInd.stopAnimating()
                    self.actInd.hidden = true
                    println(locality)
                   // self.localityTextfield.text = locality
                    
                    
                    //instead of localality textfield im using label.
                    if self.searchedLocality != nil
                    {
                       self.label.text = self.searchedLocality
                    }
                    else
                    {
                      self.label.text = locality
                    }
                    
                    
                    
                    println(self.autocompletedTextfieldnew.text)
                }
            }

            
           
        })
    }
    
    
    // Resign Firstresponder of UITableview and Keyboard Hiding
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        var location: CGPoint!
         var location1: CGPoint!
        var location2: CGPoint!
        
        location = (touches.first as! UITouch).locationInView(self.view)
        location1 = (touches.first as! UITouch).locationInView(self.view)
        location2 = (touches.first as! UITouch).locationInView(self.view)
        
        if !CGRectContainsPoint(localityDynamicView.frame, location1)
        {
            println("touches began")
            LOcalityTableview.hidden = true
        }

        
        if !CGRectContainsPoint(liqcatogeryDynamicView.frame, location)
        {
            println("touches began")
           liqTypetableview.hidden = true
        }
        if !CGRectContainsPoint(liqsubcatogeryDynamicView.frame, location2)
        {
            println("touches began")
            tableviewnew.hidden = true
        }
        

        view.endEditing(true)
        autocompletedTextfieldnew.endEditing(true)
       // tableviewnew.hidden = true
        textfield2.enabled = true
        localityTextfield.enabled = true
        //LOcalityTableview.hidden = true
        beerTypeTextfield.enabled = true
        AutoCompleteTextField3.autoCompleteTableView?.hidden = true

    }
    


    
    func reverseGeocodeLocation(location: CLLocation!, completionHandler: CLGeocodeCompletionHandler!){
        
    }
    
    //liq drop down table resign first responder
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textfield2.resignFirstResponder()
        autocompletedTextfieldnew.resignFirstResponder()
        
        return true
    }
    
    //keyboard resign firsdt responder
    //city textfield
    private func configureTextField()
    {
        autocompletedTextfieldnew.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        autocompletedTextfieldnew.autoCompleteTextFont = UIFont(name: "MyriadPro-Regular", size: 14.0)
        autocompletedTextfieldnew.autoCompleteCellHeight = 35.0
        autocompletedTextfieldnew.maximumAutoCompleteCount = 20
        autocompletedTextfieldnew.hidesWhenSelected = true
        autocompletedTextfieldnew.hidesWhenEmpty = true
        autocompletedTextfieldnew.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "MyriadPro-Regular", size: 14.0)
        autocompletedTextfieldnew.autoCompleteAttributes = attributes
        
        
        
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
      // AutoCompleteTextField3().setupAutocompleteTable1(self.view)
        autocompletedTextfieldnew.onTextChange = {[weak self] text in
            if !text.isEmpty{
                if self!.connection != nil
                {
                    self!.connection!.cancel()
                    self!.connection = nil
                }
               // let urlString = "\(self!.baseURLString)?key=\(self!.googleMapsKey)&input=\(text)&types=regions&components=country:IN"
                
                //var trimmedlocalityfromtextfield = self!.localityfromtextfield.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
     
               if CheckforInternetViewController.isConnectedToNetwork() == true
               {
                    print("Internet connection OK")
                    let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyC45IqTyfdeO5SzyLDGAVWiwADSSv70S6g&input={\(self!.label.text!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)}\(text)&components=country:IN"
                    let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
                println(urlString)
                println(url)
                    if url != nil{
                        let urlRequest = NSURLRequest(URL: url!)
                        self!.connection = NSURLConnection(request: urlRequest, delegate: self)
                        print("Internet connection OK")
     
                }}
                else
                {
                    print("Internet connection FAILED")
                    
                    let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                    alert.show()
                    AutoCompleteTextField3.autoCompleteTableView?.hidden = true
           
                }

            }
        }
        autocompletedTextfieldnew.onSelect = {[weak self] text , indexpath in
          
            println(text)
            println(self!.autocompletedTextfieldnew.text)
            self!.autocompletedTextfieldnew.text = text;
            self!.iscitytextfieldhavedata = true;
            self!.view.endEditing(true);
            self!.getselectedcityname = text
            println(self!.autocompletedTextfieldnew.text)
            print(self!.getselectedcityname)
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in

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
       // var newlaocations:String!
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
                            place_id = dict["place_id"] as! String
                            println(place_id)
                        }
                        println(locations.count)
                        var countarrayvalues = locations.count
                        println(countarrayvalues)
                        println(locations.count)
                        for var i = 0; i < locations.count ;i++
                        {
                            println(locations.count)
                            var newlaocations = locations[i]
                            println(newlaocations)
                            var fullNameArr = split(newlaocations) {$0 == ","}
                            println(fullNameArr.count)
                            if fullNameArr.count >= 2
                            {
                                var firstName: String = fullNameArr[0]
                                var lastName: String = fullNameArr[1]
                                println(firstName)
                                locations[i] =  firstName + ", " + lastName
                            }
                            else
                            {
                                var firstName: String = fullNameArr[0]
                                //var lastName: String = fullNameArr[1]
                                println(firstName)
                                locations[i] =  firstName
                            }
                        
        
                        }
                        self.autocompletedTextfieldnew.autoCompleteStrings = locations
                    }
                }
                else{
                    self.autocompletedTextfieldnew.autoCompleteStrings = nil
                    if self.autocompletedTextfieldnew.autoCompleteStrings == nil
                    {
                        AutoCompleteTextField3.autoCompleteTableView?.hidden = true
                    }
                }
            }
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        println("Error: \(error.localizedDescription)")
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //self.autocompletedTextfieldnew.resignFirstResponder()
    }
    
    // textfield1 starts
    func textFieldDidBeginEditing(textField: UITextField)
    {
        
        // Textfield2
        if textField.tag == 1
        {
            view.endEditing(true)
           // self.view.endEditing(true)
           // autocompletedTextfieldnew.resignFirstResponder()
            AutoCompleteTextField3.autoCompleteTableView?.hidden = true
            textfield2.enabled = false
            
           // getbardata("http://demos.dignitasdigital.com/bottomzup/radmin/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=15&query=\(trimmedString)")
            println(beerTypefromtextfield)
            if CheckforInternetViewController.isConnectedToNetwork() == true
            {
                print("Internet connection OK")
                getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(categoryliqlabel.text)")
               
                tableviewnew.hidden = false
            }
            else
            {
                print("Internet connection FAILED")
                
                let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
                tableviewnew.hidden = true
                textfield2.enabled = true
            }
            
            
           liqTypetableview.hidden = true
            LOcalityTableview.hidden = true
        }
            
            
            // autocompletedTextfieldnew
            else if textField.tag == 2
        {
         
            localityTextfield.enabled = true
            if CheckforInternetViewController.isConnectedToNetwork() == true
            {
                print("Internet connection OK")
   
            }
            else
            {
                print("Internet connection FAILED")
                
                let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
                AutoCompleteTextField3.autoCompleteTableView?.hidden = true
            }
            
            LOcalityTableview.hidden = true
        }
        
            
            
           // localityTextfield
        else if textField.tag == 3
        {
            //self.view.endEditing(true)
            textField.endEditing(true)
            textField.resignFirstResponder()
            println("It came here")
            localityTextfield.enabled = false
            LOcalityTableview.hidden = false
            AutoCompleteTextField3.autoCompleteTableView?.hidden = true
            
        }
            
            // beerTypeTextfield
        else if textField.tag == 7
        {
           
       
            beerTypeTextfield.enabled = false
            tableviewnew.hidden = true
            liqTypetableview.hidden = false
            LOcalityTableview.hidden = true
            tableviewnew.hidden = true
            AutoCompleteTextField3.autoCompleteTableView?.hidden = true
        
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
        
        self.tableviewnew.reloadData()
    }
    
    
    
//    func textFieldDidChange(textField: UITextField)
//    {
//        
//        if self.textfield2.text != nil && self.textfield2.text != ""
//        {
//            
//            var s = self.textfield2.text
//            variable = s
//            variable.startIndex
//            let trimmedString1 = variable.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
//            
//            let url = NSURL(string: "http://demos.dignitasdigital.com/bottomzup/radmin/liquors.php?find=\(trimmedString1)")
//            loadData(url!, completion: didLoadData)
//
//        }
//        
//    }
//    func loadData(url: NSURL, completion: ([String]) -> Void){
//        let session = NSURLSession.sharedSession()
//        
//        var task = session.dataTaskWithURL(url){
//            (data, response, error) -> Void in
//            
//            if error != nil {
//                
//            } else {
//                
//                var error : NSError?
//                
//                if  let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &error) as? NSArray{
//                    for var index = 0; index < json.count; ++index
//                    {
//                        if let bottomsUp = json[index] as? NSDictionary
//                        {
//                            if let liquors = bottomsUp["liquors"] as? String
//                            {
//                                self.arar.append(liquors)
//                                self.newarar = self.removeDuplicates(self.arar)
//                                
//                            }
//                        }
//                    }
//                }
//                
//                let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
//                dispatch_async(dispatch_get_global_queue(priority, 0))
//                    {
//                        dispatch_async(dispatch_get_main_queue()) {
//                            completion(self.newarar)
//                        }
//                }
//                
//            }
//        }
//        
//        task.resume()
//        
//    }
//    func didLoadData(arrData: [String])
//    {
//        var substring = self.textfield2.text
//        //substring.lowercaseString
//        searchAutocompleteEntriesWithSubstring(substring)
//        
//        self.tableviewnew.reloadData()
//        self.tableviewnew!.hidden = false
//    }
    
    // Autocomplete liq
    
//    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
//    {
//        
//        return true
//    }
    
//    func searchAutocompleteEntriesWithSubstring(substring: String)
//    {
//        autocompleteUrls.removeAll(keepCapacity: false)
//        
//        var usubstring = substring
//        
//        for curString in newarar
//        {
//            var ucurstring = curString
//            
//            var myString: NSString! = ucurstring as NSString
//            var substringRange: NSRange! = myString.rangeOfString(usubstring.capitalizedString)
//            
//            if (substringRange.location == 0)
//            {
//                autocompleteUrls.append(ucurstring)
//            }
//        }
//
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if tableView.tag == 4
        {
            return self.items.count
        }
            else if tableView.tag == 6
        {
            return self.liqTypes.count
        }
        else
        {
            return liqTypes1.count
        }
        
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        if tableView.tag == 4
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:14)
            cell.textLabel!.textColor = UIColor.darkGrayColor()
            
            return cell
  
        }
        
        else if tableView.tag == 6
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
             cell.textLabel?.text = self.liqTypes[indexPath.row]
             cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:14)
            cell.textLabel!.textColor = UIColor.darkGrayColor()
            
            return cell
        }
        
     
        else
        {
        tableviewnew.layer.masksToBounds = true
        tableviewnew.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        tableviewnew.layer.borderWidth = 2.0
        
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
        }
        
        let index = indexPath.row as Int
        cell!.textLabel!.text = liqTypes1[index]
        cell!.textLabel?.font = UIFont(name: "MyriadPro-Regular", size: 14.0)
        cell!.textLabel?.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        return cell!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        // Locality tableview
        if tableView.tag == 4
        {
            autocompletedTextfieldnew.text = ""
            localityTextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
           // localityTextfield.text = selectedCell1.textLabel?.text
            label.text = selectedCell1.textLabel?.text
           // localityfromtextfield = localityTextfield.text
            
            //inseatd of lacalitytextfiled im using label.
            localityfromtextfield = label.text
            
            println(localityfromtextfield)
            self.view.endEditing(true)
            tableView.hidden = true
        }
        // liqatable view
        else if tableView.tag == 5
        {
       
            subcategory = false
            textfield2.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            //textfield2.text = selectedCell1.textLabel?.text
            
            
            subcategoryliqlabel.text = selectedCell1.textLabel?.text
            
            
            
            selectedliqor = selectedCell1.textLabel?.text
            isliqtextfieldhasdata = true
            self.view.endEditing(true)
            tableView.hidden = true
        }
            
        // Liq type table view
        else if tableView.tag == 6
        {
            category = false
            //textfield2.text = "All"
            subcategoryliqlabel.text = "All"
            beerTypeTextfield.enabled = true
            println("You selected cell #\(indexPath.row)!")
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            //beerTypeTextfield.text = selectedCell1.textLabel?.text
            //instead of beertypetextfield im using categoryliqlabel
            categoryliqlabel.text = selectedCell1.textLabel?.text
           // beerTypefromtextfield = beerTypeTextfield.text
            
            
            //instead of beertypetextfield im using categoryliqlabel
            beerTypefromtextfield = categoryliqlabel.text
            println(beerTypefromtextfield)
            self.view.endEditing(true)
            tableView.hidden = true
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if tableView.tag == 8
        {
            return 43;//Choose your custom row height
        }
//        else if tableView.tag == 5
//        {
//            return 30
//        }
//        else if tableView.tag == 6
//        {
//            return 30
//        }
        else
        {
            return 43
        }
      //  return 100.0;//Choose your custom row height
    }
    @IBAction func searchnew(sender: UIButton)
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
        
        let tracker = GAI.sharedInstance().defaultTracker
        if subcategoryliqlabel.text == "All"
        {
          let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(searchedin  + space + label.text! + space + autocompletedTextfieldnew.text)",action: "\(forliqtype + space + categoryliqlabel.text!)",label: "\(label.text! + autocompletedTextfieldnew.text)", value: nil).build()
              tracker.send(eventTracker as! [NSObject : AnyObject])
        }
        else
        {
           let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(searchedin + space + label.text! + space + autocompletedTextfieldnew.text)",action: "\(forliqtype + space + subcategoryliqlabel.text!)",label: "\(label.text! + space + autocompletedTextfieldnew.text)", value: nil).build()
              tracker.send(eventTracker as! [NSObject : AnyObject])
        }

       // liqnamefromtextfield = textfield2.text
        
        liqnamefromtextfield = categoryliqlabel.text
        trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        println(localityfromtextfield)
        println(autocompletedTextfieldnew.text)
        
        println(autocompletedTextfieldnew.text)
        var text = autocompletedTextfieldnew.text
       // var locate = localityTextfield.text + text
        
        //indtead of loacalitytextfile im using lael.
        var locate = label.text! + text
        println(autocompletedTextfieldnew.text)
        println(localityfromtextfield)
        
        
        println(locate)
       var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        println(locate1)
        
        if autocompletedTextfieldnew.text == currentLocation
        {
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(devicelatitude)&long=\(devicelongitude)&km=5&records=15&query=\(categoryliqlabel.text!)")
        }
        
        else
        {
        getgoogledata("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
        }

    }

    
    func getgoogledata(urlString:String)
    {
        let url = NSURL(string: urlString)
        println(url)
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data,response,error) in
            
            dispatch_async(dispatch_get_main_queue(),
                {
                    
                    self.extract_googlejson(data)
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
                println(results.count)
                println(i)
                if let one = results[i] as? NSDictionary
                {
                    if let place_id = json["place_id"] as? String!
                    {
                        place_id1 = place_id
                        println(place_id1)
                    }
                    if let geometry = one["geometry"] as? NSDictionary
                    {
                   
                       // for var j = 0; j < geometry.count; j++
                      //  {
                            if let location = geometry["location"] as? NSDictionary
                            {
                          
                                if let lat = location["lat"] as? Double
                                {
                                    citylat = lat
                                    println(citylat)
                                }
                                if let lng = location["lng"] as? Double
                                {
                                    citylong = lng
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

    func getbardata(urlString:String)
    {
        let url = NSURL(string: urlString)
        println(url)
        
        
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
        
      if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        
               //let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSArray
        
      {
            head1 = [Restaurant]()
            head2 = [Restauarantcocktail]()
            header = [Restauarantvodka]()
            arraysring = [String]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
                fstobj2 = Restauarantcocktail()
                vodkaobj = Restauarantvodka()
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
                            fstobj2.minp = pint_avg_price
                            println(pint_avg_price)
                        }
                        if let bottle_avg_price = bottomsUp1["bottle_min_price"] as? Int
                        {
                            //var bottle_avg_price2:String = toString(bottle_avg_price)
                            fstobj1.maxp = bottle_avg_price
                            fstobj2.maxp = bottle_avg_price
                        }
                        
                        if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                        {

                            
                            var happy_hour_start1 = happy_hour_start
                            
                            
                            fstobj1.happystart = happy_hour_start1
                            fstobj2.happystart = happy_hour_start1
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {

                            
                            var happy_hour_end1 = happy_hour_end
                            fstobj1.happyend = happy_hour_end1
                            fstobj2.happyend = happy_hour_end1
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            fstobj1.ishappy = is_happy_hour
                            fstobj2.ishappy = is_happy_hour
                        }
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            fstobj1.rest_offers_happy_hour = rest_offers_happy_hour1
                            fstobj2.rest_offers_happy_hour = rest_offers_happy_hour1
                        }
                        if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                        {
                            
                            
                            if let res_name = resInfo["res_name"] as? String
                            {
                                fstobj1.restname = res_name
                                fstobj2.restname = res_name
                                arraysring.append(res_name)
                                println(arraysring.first)
                                
                            }
                            
                            if let res_address = resInfo["res_address"] as? String
                            {
                                fstobj1.restaddress = res_address
                                fstobj2.restaddress = res_address
                            }
                            
                            if let res_locality = resInfo["res_locality"] as? String
                            {
                                fstobj1.Place = res_locality
                                fstobj2.Place = res_locality
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                //convert String to Double
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restlat = string.doubleValue
                                fstobj1.Restaurantlatitude = restlat
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
                                fstobj1.Restaurantlongitude = restlong
                                fstobj2.Restaurantlongitude = restlong
                                println(fstobj1.Restaurantlongitude)
                                println(restlong)
                                
                                
                            }
                            if let res_phone1 = resInfo["res_phone1"] as? String
                            {
                                fstobj1.Phoneone = res_phone1
                                fstobj2.Phoneone = res_phone1
                            }
                            
                            if let res_phone2 = resInfo["res_phone2"] as? String
                            {
                                fstobj1.Phonetwo = res_phone2
                                fstobj2.Phonetwo = res_phone2
                            }
                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                                var OldLocation: CLLocation = CLLocation(latitude: devicelatitude, longitude: devicelongitude)
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
                                
                                
                                fstobj1.distance = totalDistance1 + " Km"
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
                                fstobj1.amp.append(liqobj1)
                               // fstobj2.amp.append(liqobj1)
                            }
                        }
                        head1.append(fstobj1)
                       // head2.append(fstobj2)
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
                                arraysring.append(res_name)
                                println(arraysring.first)
                                
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
                                var OldLocation: CLLocation = CLLocation(latitude: devicelatitude, longitude: devicelongitude)
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
                   
                                fstobj2.amp.append(liqobj1)
                            }
                        }
      
                        println(head2.count)
          
                        head2.append(fstobj2)

                    }
                        
                    else
                    {
                        
                        if let rest_offers_happy_hour1 = bottomsUp1["rest_offers_happy_hour"] as? String
                        {
                            vodkaobj.rest_offers_happy_hour = rest_offers_happy_hour1
                        }
                        if let avg_price = bottomsUp1["alcohol_min_price"] as? Int
                        {
                            //var avg_price2:String = toString(avg_price)
                            vodkaobj.avgprice = avg_price
                            //vodkasendobj.avgprice = avg_price2
                            
                        }
                        if let happy_hour_start = bottomsUp1["happy_hour_start"] as? String
                        {

                            var happy_hour_start2 = happy_hour_start
                            
                            vodkaobj.vodkahappystart = happy_hour_start2
                            //vodkasendobj.vodkahappystart = happy_hour_start2
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {

                            var happy_hour_end2 = happy_hour_end
                            vodkaobj.vodkahappyend = happy_hour_end2
                            //vodkasendobj.vodkahappyend = happy_hour_end2
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            vodkaobj.vodkaishappy = is_happy_hour
                            // vodkasendobj.vodkaishappy = is_happy_hour
                        }
                        if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                        {
                            
//                            if let res_place = bottomsUp1["res_place"] as? String
//                            {
//                                vodkaobj.address = res_place
//                                println(vodkaobj.address)
//                            }
                           
                            if let res_name = resInfo["res_name"] as? String
                            {
                                vodkaobj.restnamevodka = res_name
                                //vodkasendobj.restnamevodka = res_name
                            }
                            if let res_address = resInfo["res_address"] as? String
                            {
                                vodkaobj.restaddress = res_address
                            }
                            
                            if let res_locality = resInfo["res_locality"] as? String
                            {
                                vodkaobj.address = res_locality
                            }
                            
                            if let res_lat = resInfo["res_lat"] as? String
                            {
                                let mySwiftString = res_lat
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restvodkalat = string.doubleValue
                                vodkaobj.Restaurantlatitudevodka = restvodkalat
                                // vodkasendobj.Restaurantlatitudevodka = restvodkalat
                                println(restvodkalat)
                                
                            }
                            if let res_long = resInfo["res_long"] as? String
                            {
                                let mySwiftString = res_long
                                var string = NSString(string: mySwiftString)
                                string.doubleValue
                                restvodkalang = string.doubleValue
                                vodkaobj.Restaurantlongitudevodka = restvodkalang
                                //vodkasendobj.Restaurantlongitudevodka = restvodkalang
                                println(restvodkalang)
                            }
                            
                            if let res_phone1 = resInfo["res_phone1"] as? String
                            {
                                vodkaobj.Phoneone = res_phone1
                            }
                            
                            if let res_phone2 = resInfo["res_phone2"] as? String
                            {
                                vodkaobj.Phonetwo = res_phone2
                            }

                            if var distance = resInfo["distance"] as? String
                            {
                                //28.63875
                                //77.07380
                               var OldLocation: CLLocation = CLLocation(latitude: devicelatitude , longitude: devicelongitude)
                               // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
                                var newLocation: CLLocation = CLLocation(latitude: restvodkalat, longitude: restvodkalang)
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
                                vodkaobj.distancevodka = totalDistance1 + " Km"
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
                                vodkaobj.vodkaarray.append(liqobj2)
                                //vodkasendobj.vodkasendarray.append(liqobj2)
                            }
                        }
                        header.append(vodkaobj)
                    
                        println("header \(vodkaobj)")
                    }
                }
            }
            if check == "Beer"
            {
                
                self.performSegueWithIdentifier("getbeernew", sender: self)
            }
                else if check == "Cocktails"
            {
                self.performSegueWithIdentifier("cocktail", sender: self)
            }
            else
            {
                self.performSegueWithIdentifier("getvodkanew", sender: self)
            }
        
        self.actInd1.hidden = true
        }
        
        else
        {
            println(autocompletedTextfieldnew.text)
           self.actInd1.hidden = true
            count = count + 1
            println(count)
            println("Nithin")
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "getbeernew"
        {
            if let destination = segue.destinationViewController as? tableviewclass
            {
                //28.63875
                //77.07380
               // destination.liqname = textfield2.text
                destination.uName = self.uName
                
                destination.liqname = subcategoryliqlabel.text
               // var liqname = textfield2.text
                
                var liqname = subcategoryliqlabel.text
                println(head1.count)
                destination.head = head1
                println(destination.head.count)
         
                destination.beerTypefromtextfield = beerTypefromtextfield
                //destination.selectedliqor = textfield2.text
                
                destination.selectedliqor = subcategoryliqlabel.text
                
                
                destination.getdevicelatitude = devicelatitude
                destination.getdevicelongitude = devicelongitude
                destination.getcitylatitude = citylat
                destination.getcitylongitude = citylong
                destination.getrestlatitudebeer = restlat
                destination.getdevicelongitude = restlong
              
                destination.getfstobj1 = fstobj1
                destination.getselectedcityname = getselectedcityname
                destination.checkliqtype = check
                destination.vodkaarray = header
                destination.getrestlatitudevodka = restvodkalat
                destination.getrestlongitudevodka = restvodkalang
                println(autocompletedTextfieldnew.text)
                
                destination.locationnamefromtextfield = autocompletedTextfieldnew.text
                //destination.liqtypefromTextfield = beerTypeTextfield.text
                
                //instead of beertypetextfiled im using category label
                
                destination.liqtypefromTextfield = categoryliqlabel.text!
                
                
                
                
               // destination.localityFromtextfield = localityTextfield.text
                
                
                //Instead of lactaclity textfield im using label.
                destination.localityFromtextfield = label.text!
                
                
                destination.citylatitudefFomresult = citylat
                destination.citylongitudeFromresult = citylong
               // destination.liqtypeFromresult = beerTypeTextfield.text
                
                
                //instead of beertypetextfiled im using category label
                destination.liqtypeFromresult = categoryliqlabel.text
                
                
                
                //destination.liqFromresult = textfield2.text
                destination.liqFromresult = subcategoryliqlabel.text
                
                
                
               // destination.localityfromtextfield1 = localityTextfield.text
                
                
                //Instead of lactaclity textfield im using label.
                destination.localityfromtextfield1 = label.text!
                
                destination.searchedLocality = label.text!
                destination.searchedaLiqType = subcategoryliqlabel.text
            }
        }
        if segue.identifier == "cocktail"
        {
            if let destination3 = segue.destinationViewController as? Cocktail
            {
                //28.63875
                //77.07380
               // destination3.liqname = textfield2.text
                
                destination3.uName = self.uName
                destination3.liqname = subcategoryliqlabel.text
               // var liqname = textfield2.text
                
                var liqname = subcategoryliqlabel.text
                println(head2.count)
                destination3.header2 = head2
                println(destination3.header2.count)
                
                destination3.beerTypefromtextfield = beerTypefromtextfield
               // destination3.selectedliqor = textfield2.text
                
                 destination3.selectedliqor = subcategoryliqlabel.text
                
                
                destination3.getdevicelatitude = devicelatitude
                destination3.getdevicelongitude = devicelongitude
                destination3.getcitylatitude = citylat
                destination3.getcitylongitude = citylong
                destination3.getrestlatitudebeer = restlat
                destination3.getdevicelongitude = restlong
                
                destination3.getfstobj1 = fstobj1
                destination3.getselectedcityname = getselectedcityname
                destination3.checkliqtype = check
                destination3.vodkaarray = header
                destination3.getrestlatitudevodka = restvodkalat
                destination3.getrestlongitudevodka = restvodkalang
                println(autocompletedTextfieldnew.text)
                
                destination3.locationnamefromtextfield = autocompletedTextfieldnew.text
                //destination3.liqtypefromTextfield = beerTypeTextfield.text
                
                 //Instead of lactaclity textfield im using label.
                destination3.liqtypefromTextfield = categoryliqlabel.text
                
                
                
                
                
                //destination3.localityFromtextfield = localityTextfield.text
                
                ////Instead of lactaclity textfield im using label.
                destination3.localityFromtextfield = label.text!
                destination3.citylatitudefFomresult = citylat
                destination3.citylongitudeFromresult = citylong
                //destination3.liqtypeFromresult = beerTypeTextfield.text
                
                //Instead of lactaclity textfield im using label.
                destination3.liqtypeFromresult = categoryliqlabel.text
                
               // destination3.liqFromresult = textfield2.text
                
                destination3.liqFromresult = subcategoryliqlabel.text
                
               // destination3.localityfromtextfield1 = localityTextfield.text
                
                
                //Instead of lactaclity textfield im using label.
                destination3.localityfromtextfield1 = label.text!
                
                destination3.searchedLocality = label.text!
                destination3.searchedaLiqType = subcategoryliqlabel.text
                destination3.searchedLiq = categoryliqlabel.text
            }
        }
        if segue.identifier == "getvodkanew"
        {
            if let destination1 = segue.destinationViewController as? tableviewclassvodka
            {
               // destination1.liqvodkaname = textfield2.text
                
                destination1.uName = self.uName
                destination1.liqvodkaname = subcategoryliqlabel.text
               // var liqvodkaname = textfield2.text
                
                var liqvodkaname = subcategoryliqlabel.text
                let trimmedString = liqvodkaname!.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination1.liqvodkaname = trimmedString
                
                destination1.header1 = header
                destination1.newtrimmedstring = trimmedString
                destination1.beerTypefromtextfield = beerTypefromtextfield
//                destination1.getcitylatitude = citylat
//                destination1.getcitylongitude = citylong
                destination1.getdevicelatitude = devicelatitude
                destination1.getdevicelongitude = devicelongitude
               // destination1.selectedliqor = textfield2.text
                
                destination1.selectedliqor = subcategoryliqlabel.text
                
                
                destination1.getvodkalatitude = restlat
                destination1.getvodkalongitude = restlong
                destination1.getselectedcityname = getselectedcityname
                destination1.locationnamefromtextfield = autocompletedTextfieldnew.text
                println(autocompletedTextfieldnew.text)
               // destination1.liqtypefromTextfield = beerTypeTextfield.text
                
                
                
                 //Instead of lactaclity textfield im using label.
                 destination1.liqtypefromTextfield = categoryliqlabel.text
                
                
              //  destination1.localityFromtextfield = localityTextfield.text
                
                
                // Instead of lactaclity textfield im using label.
                destination1.localityFromtextfield = label.text!
                
                destination1.citylatitudefFomresult = citylat
                destination1.citylongitudeFromresult = citylong
               // destination1.liqtypeFromresult = beerTypeTextfield.text
                
                //Instead of lactaclity textfield im using label.
                destination1.liqtypeFromresult = categoryliqlabel.text
                
                
                //destination1.liqFromresult = textfield2.text
                
                destination1.liqFromresult = subcategoryliqlabel.text
                
                
              //  destination1.localityfromtextfield1 = localityTextfield.text
                
                //Instead of lactaclity textfield im using label.
                destination1.localityfromtextfield1 = label.text!
                
                destination1.searchedLocality = label.text!
                destination1.searchedaLiqType = subcategoryliqlabel.text
                destination1.searchedLiq = categoryliqlabel.text
            }
        }
        if segue.identifier == "getwinenearyou"
        {
            if let destination2 = segue.destinationViewController as? mapview
            {
     
                destination2.uName = self.uName
                destination2.getcitylatitude = citylat
                destination2.getcitylongitude = citylong
                destination2.getdevicelatitude = devicelatitude
                destination2.getdevicelongitude = devicelongitude
                destination2.getrestlastmapview = restlat
                destination2.getrestlongitmapview = restlong
                println(citylat)
                println(citylong)
                destination2.citylat = winecitylat
                destination2.citylong = winecitylong
               // destination2.newlocate = autocompletedTextfieldnew.text + localityTextfield.text
                
                
                 //Instead of lactaclity textfield im using label.
                destination2.newlocate = autocompletedTextfieldnew.text + label.text!
                
                destination2.searchedLocality = localityTextfield.text
                destination2.searchedLiq = beerTypeTextfield.text
                destination2.searchedaLiqType = textfield2.text
                destination2.searchedsubLocality = autocompletedTextfieldnew.text
            }
            
        }
    }
    
    

   
    @IBAction func findnearwineandbeer(sender: UIButton)
    {
        
   
        performSegueWithIdentifier("getwinenearyou", sender: self)

    }


    @IBAction func getdeals(sender: UIButton) {
        performSegueWithIdentifier("Dealsnearyou", sender: self)
    }
    
    func ApiCall()
    {
        if label.text != nil && categoryliqlabel.text != nil && subcategoryliqlabel.text != nil && autocompletedTextfieldnew.text != ""
        {
            println(autocompletedTextfieldnew.text)
             println(label.text)
             println(categoryliqlabel.text)
             println(subcategoryliqlabel.text)
  
        
        
        if subcategoryliqlabel.text == "All"
        {
            println(citylat)
            println(citylong)
            println(trimmedString)
            println(beerTypeTextfield.text)
            //var name  = beerTypeTextfield.text
            
            var name  = categoryliqlabel.text
            
            var name1 =  name!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            println(name1)
            
            println(name)
            println(citylat)
            println(citylong)
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=500&query=\(name1)")
        }
        else
        {
            println(citylat)
            println(citylong)
            println(citylat)
            println(citylong)
            println(trimmedString)
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=500&query=\(subcategoryliqlabel.text!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)")
        }
        }
        else
        {
            if autocompletedTextfieldnew.text == "" || autocompletedTextfieldnew.text == nil
            {
                 actInd1.hidden = true
                let alertController = UIAlertController(title: "Bottomz Up", message:"Please enter locality...", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                println(autocompletedTextfieldnew.text)
  
            }
            else
            {
            println(autocompletedTextfieldnew.text)
            actInd1.hidden = true
            let alertController = UIAlertController(title: "Bottomz Up", message:"No Data found please try with some other place or liquor", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
             println(autocompletedTextfieldnew.text)
            }
        }
        
    }
    func connserv()
    {
        var request = NSMutableURLRequest(URL: NSURL(string: "https://144.1.1.45:8000")!)
        //request.timeoutInterval = 10 // for implementing timeout
        request.HTTPMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        var response: NSURLResponse?
        var error: NSError?
        println("Firing synchronous url connection......")
        let urlData = NSURLConnection.sendSynchronousRequest(request, returningResponse: &response, error: &error)
        
        if urlData == nil
        {
            println("Error happend timeout======\(error)!")
        }
        else
        {
            println("\(urlData!.length) bytes of data was returned")
            println(response!);
            println(NSString(data: urlData!, encoding: NSUTF8StringEncoding)!)
        }
        
        
    }
    
}













