//
//  tableviewclass.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import Social
import FBSDKShareKit
//var toggleforboth = false


class tableviewclass: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate,UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
    var head2:[Restaurant] = [Restaurant]()
    var headerfortableview:[Restauarantvodka] = [Restauarantvodka]()
    var getfstobj1 = Restaurant()
    var fstobj1 = Restaurant()
    var vodkaobjnew = Restauarantvodka()
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var getselectedlq:String!
    var arraylookfurther = [Restaurant]()
    var array2 = [Restaurant]()
    var restlat:Double!
    var restlong:Double!
    var resortname = [String]()
    var arraycolor = [Restaurant]()
    
    var newheadarray:[Restaurant] = [Restaurant]()
    var newheadarray1:[Restaurant] = [Restaurant]()

    
    
    

    var variable:String!
    var liqnamefromtextfield:String!
    
    var citylat:Double!
    var citylong:Double!
    @IBOutlet weak var autocompletetextfieldforbeer: AutoCompleteTextField1!
    

    @IBOutlet weak var newtextfieldtableview: UITextField!
    var global = false
    var pintbuttonclicked = false
    var bottlebuttonclicked = false
    var locationbuttonclicked = false
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var popupview: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var pintbutton: UIButton!
    @IBOutlet weak var bottlebutton: UIButton!
    @IBOutlet weak var locationbutton: UIButton!
    @IBOutlet weak var resturantnamelable: UILabel!
    
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
    
    
    

    
    
    var currentlocationname:String!
    

    @IBOutlet weak var newuitableview: UITableView!
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
    var array1 = [Restaurant]()
    var resortname1 = [String]()


   var origin = CGFloat()
    var origin1 = Float()
    var end = CGFloat()
    
    var newtrimmedstring:String!
    
    var countvlaues:Int!
    
    var one:Int!
    var two:Int!

    
    override func viewDidLoad()
    {
        
        

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
        newuitableview.tag = 0
        newtextfieldtableview.tag = 2
        autocompletetextfieldforbeer.tag = 3

         newuitableview.layer.borderColor = UIColor.grayColor().CGColor
        newuitableview.layer.borderWidth = 2

        
        if selectedliqor.rangeOfString(substringofselectedliq) != nil
        {
            boolexists = true
            if boolexists
            {
                bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
               head = bottlesorting(head)
                tableview.reloadData()
            }
            println("exists")
        }
        else
        {
            boolexists = false
            if boolexists == false
            {
                pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
                head = pintsoring(head)
                tableview.reloadData()
            }
            println("Not exists")
        }
        
        newtextfieldtableview.text = selectedliqor
        configureTextField()
        handleTextFieldInterfaces()
     

        autocompletetextfieldforbeer.text = getselectedcityname
        newuitableview.hidden = true
        
        popupview.layer.cornerRadius = 20.0

        let tap1 = UITapGestureRecognizer(target: popupview, action: Selector("handleFrontTap:"))
        //popupview.addGestureRecognizer(tap1)
        popupview.hidden = true
        tap1.delegate = self
        super.viewDidLayoutSubviews()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        pintbutton.setTitle("PINT", forState: .Normal)
        pintbutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
        bottlebutton.setTitle("BOTTLE", forState: .Normal)
        bottlebutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)
       
        locationbutton.setTitle("DISTANCE", forState: .Normal)
        locationbutton.titleLabel!.font =  UIFont(name: "HelveticaNeue-Bold", size: 11)

       // togglebuttonbeer.setImage(toggleoff, forState: .Normal)
        autocompletetextfieldforbeer.textFieldWidth = autocompletetextfieldforbeer.frame.width
        autocompletetextfieldforbeer.delegate = self
        
        self.newtextfieldtableview.delegate = self
        
        locationManager1 = CLLocationManager()
        // locationManager = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        //locationManager1.startUpdatingLocation()
        
        newuitableview.dataSource = self
        newuitableview.delegate = self
        
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
            
            // Street address
            if let street = placeMark.addressDictionary["Thoroughfare"] as? NSString {
                println(street)
                self.currentlocationname = street as String
                
                self.autocompletetextfieldforbeer.text = street as String
                
            }
            
        })
    }
    
 
    
    
    private func configureTextField()
    {
        autocompletetextfieldforbeer.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        autocompletetextfieldforbeer.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        autocompletetextfieldforbeer.autoCompleteCellHeight = 35.0
        autocompletetextfieldforbeer.maximumAutoCompleteCount = 20
        autocompletetextfieldforbeer.hidesWhenSelected = true
        autocompletetextfieldforbeer.hidesWhenEmpty = true
        autocompletetextfieldforbeer.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        autocompletetextfieldforbeer.autoCompleteAttributes = attributes
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
        autocompletetextfieldforbeer.onTextChange = {[weak self] text in
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
        autocompletetextfieldforbeer.onSelect = {[weak self] text, indexpath in
            self!.autocompletetextfieldforbeer.text = text;self!.iscitytextfieldhavedata = true;self!.view.endEditing(true);self!.getselectedcityname = text
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil
                {
                    let coordinate = placemark!.location.coordinate
                    self!.getcitylatitudefromgoogle = coordinate.latitude
                    self!.getcitylongitudefromgoogle = coordinate.longitude
                    if self!.iscitytextfieldhavedata == true && self!.isliqtextfieldhasdata == true
                    {
                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self!.getcitylatitudefromgoogle)&long=\(self!.getcitylongitudefromgoogle)&km=2&records=10&query=\(self!.trimmedString)")
                    }
                    else
                    {
                        self!.getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self!.getcitylatitudefromgoogle)&long=\(self!.getcitylongitudefromgoogle)&km=2&records=10&query=\(self!.newtrimmedstring)")
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
                        self.autocompletetextfieldforbeer.autoCompleteStrings = locations
                    }
                }
                else{
                    self.autocompletetextfieldforbeer.autoCompleteStrings = nil
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

        if textField.tag == 2
        {
        textField.selectAll(self)
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        }
        
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
        self.newuitableview.reloadData()
        self.newuitableview!.hidden = false
        
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
        if tableView.tag == 0{
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
        
        self.array1 = head 
        selectedliqor = selectedCell1.textLabel!.text
        isliqtextfieldhasdata = true
        if iscitytextfieldhavedata == true && isliqtextfieldhasdata == true
           {
              getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=2&records=10&query=\(trimmedString)")
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
            head2 = [Restaurant]()
            headerfortableview = [Restauarantvodka]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
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
                               // var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                        head2.append(fstobj1)
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
                                vodkaobjnew.distancevodka = totalDistance1 + "Km."
                 
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
            if check == "Beer"
            {
                head = head2
                newheadarray = head2
                tableview.reloadData()
                
            }
            else
            {
                self.performSegueWithIdentifier("newsegforvodka", sender: self)
            }
            if boolexists == true
            {
                pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
                bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
                head = bottlesorting(head)
                for var i = 0;i < head.count;i++
                {
                    println(head[i].maxp)
                }
            }
                
            else
            {
                pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
                bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
                head = pintsoring(head)
                for var i = 0;i < head.count;i++
                {
                    println(head[i].minp)
                }
            }

        }
            
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    

    @IBAction func press2revealPressed(sender: UIButton)
    {
        //resturantnamelable.text = "I just got a 10 % discount at \(head[sender.tag].restnamevodka) Through Bottomz Up"
        resturantnamelable.text = "I just got a 10% discount at \(head[sender.tag].restname) through the BottomzUp App"
        tableview.userInteractionEnabled = false
        popupview.hidden = false
        
    }
    
    // Resign Firstresponder of UITableview
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        view.endEditing(true)
       if let touch = touches.first as? UITouch {
            let location = touch.locationInView(self.mainview)
            if location.x < popupview.frame.origin.x || location.x > (popupview.frame.origin.x + popupview.frame.size.width){
                popupview.hidden = true
                tableview.userInteractionEnabled = true
            }
            if location.y < popupview.frame.origin.y || location.y > (popupview.frame.origin.y + popupview.frame.size.height){
            popupview.hidden = true
            tableview.userInteractionEnabled = true
           }
        
        }
        
    }
    
    
    
    func handleFrontTap(gestureRecognizer: UITapGestureRecognizer)
    {
        //gestureRecognizer.cancelsTouchesInView = false
        //popupview.hidden = false
    }
    @IBAction func shareonfacebook(sender: AnyObject)
    {
        //      var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        //        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        //        content.contentURL = NSURL(string: "www.google.com")
        //        content.contentTitle = "Bottomz Up"
        //        content.contentDescription = "I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App"
        
        //var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        
        //shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
        //content.contentURL =  NSURL(string: DOWNLOAD_LINK_APPSTORE)
        //content.contentTitle = "My Custom Title"
        //content.contentDescription = "My Custom Description"
        // content.imageURL = NSURL(string: FB_IMAGE_LINK)
        // Share Dialog
        // FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
        ////
        //        shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant \(resobjr.restname) through the BottomzUp App")
        //        self.presentViewController(shareToFacebook, animated: true, completion: nil)
        //
//        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//        //       shareToFacebook.setInitialText("I just got a 10% discount at Aangan Restaurant through the BottomzUp App")
//        //        self.presentViewController(shareToFacebook, animated: true, completion: nil)
//        
//        
//        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook)
//        {
//            
//            //            var facebookSheet:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
//            //            facebookSheet.setInitialText("Vea Software! :D")
//            //            self.presentViewController(facebookSheet, animated: true, completion: nil)
//            
//            var text: String = "I just got a 10% discount at  \(head[sender.tag].restname) through the BottomzUp App"
//            var url: NSURL = NSURL(string: "http://bottomzup.com")!
//            var controller: UIActivityViewController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
//            self.presentViewController(controller, animated: true, completion: nil)
//            
//        }
//        else
//        {
//            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
        //
        //        var content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        //        content.contentURL = NSURL(string:"https://developers.facebook.com")
        
        //        var text: String = "How to add Facebook and Twitter sharing to an iOS app"
        //        var url: NSURL = NSURL(string: "http://roadfiresoftware.com/2014/02/how-to-add-facebook-and-twitter-sharing-to-an-ios-app/")!
        //        var controller: UIActivityViewController = UIActivityViewController(activityItems: [text, url], applicationActivities: nil)
        
        
        //        self.presentViewController(controller, animated: true, completion: nil)
        
        var shareToFacebook : SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        shareToFacebook.setInitialText("I just got a 10% discount at \(head[sender.tag].restname) through the BottomzUp App")
        self.presentViewController(shareToFacebook, animated: true, completion: nil)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        if tableView.tag == 1{
        return head.count
        }
        else {
            return 1
        }
    }
    
    @IBAction func getdiscount1(sender: AnyObject)
    {

    }
    @IBAction func gotomap(sender: AnyObject)
    {
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        if tableView.tag == 1{
        if head[section].bool == true
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
        var obj = customheadercellafterexpanstion()
      //  var widthtake = obj.widthnew
        
        if tableView.tag == 1
        {

        let cells = tableView.dequeueReusableCellWithIdentifier("tableChildCell", forIndexPath: indexPath) as! BeerRowCell
        cells.beers = [liqclass]()
        cells.beers = head[indexPath.section].amp
        cells.arrowup.tag = indexPath.section
        cells.press2reveal.tag = indexPath.section
        cells.restaurantName = head[indexPath.section].restname
        cells.distancelabelnew.text = head[indexPath.section].distance
            cells.layer.addBorder (UIRectEdge.Left, color: UIColor.lightGrayColor(), thickness: 1)
            cells.layer.addBorder (UIRectEdge.Right, color: UIColor.lightGrayColor(), thickness: 1)
            cells.layer.addBorder (UIRectEdge.Bottom, color: UIColor.lightGrayColor(), thickness: 1)
            //cells.layer.addBorder(UIRectEdge.Top, color: UIColor.lightGrayColor(), thickness: 1)
            //cells.layer.addBorder1(UIRectEdge.Top, color: UIColor.redColor(), thickness: 1, end: 374)
          //  println(widthtake)
         //  cells.layer.addBorder1(UIRectEdge.Top, color: UIColor.redColor(), thickness: 1, end:cells.frame.origin.x + obj.viewtodisplayhappyhoursafterexpanstion.frame.width)
            cells.borderimage.backgroundColor = UIColor.whiteColor()
            cells.borderimage1.backgroundColor = UIColor.lightGrayColor()
           // cells.userInteractionEnabled = false
            
            
            println(end)

         
        cells.tableView.reloadData()
        
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
            cell!.textLabel?.font = UIFont(name: "HelveticaNeue", size: 14.0)
            cell!.textLabel?.textColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
            //cell?.layer.addBorder(UIRectEdge.Top, color: UIColor.redColor(), thickness: 10)

            
            return cell!
        }
    }
    @IBAction func arrowup(sender: UIButton)
    {
       if head[sender.tag].bool == true
       {
        head[sender.tag].bool = false
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
        if ((head[indexPath.section].amp.count * 30) + 10) > 187 {
            
            return CGFloat((head[indexPath.section].amp.count * 30) + 10)
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
        if tableView.tag == 1
        {
        if head[section].bool == false
        {
            if head[section].rest_offers_happy_hour == "Yes"
            {
                return 125
            }
            else
            {
                return 80
            }
        }
        else
        {
            if head[section].rest_offers_happy_hour == "Yes"
            {
                return 110
            }
            else
            {
                return 60
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
           
            if head[section].bool == false
            {
        var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        headerCell.backgroundColor = UIColor.whiteColor()
        headerCell.headercellname.text = " " + head[section].restname
                if head[section].minp == 0
                {
                    headerCell.headercellmin.text =   "--"
                }
                else
                {
                     headerCell.headercellmin.text =   "₹  " + "\(head[section].minp)"
                }
                
                if head[section].maxp == 0
                {
                    headerCell.headercellmax.text =  "--"
                }
                else
                {
                    headerCell.headercellmax.text =  "₹  " + "\(head[section].maxp)"
                }
 
    
        
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.tapguesturerecognizer.addGestureRecognizer(headerTapped)
        headerCell.tapguesturerecognizer.tag = section
        headerCell.tapguesturerecognizer.userInteractionEnabled = true
        headerCell.viretodisplayHappyhours.layer.borderWidth = 1
        headerCell.viretodisplayHappyhours.layer.borderColor = UIColor.grayColor().CGColor
        headerCell.viretodisplayHappyhours.layer.cornerRadius = 10
        headerCell.mapbutton.tag = section
        headerCell.mapbutton.setTitle(head[section].distance, forState: UIControlState.Normal)
                
        headerCell.mapbutton.enabled =  false
        headerCell.availofferbuttonbeer.tag = section
        headerCell.HappyhourstiminglabelBeforeexpastion.text = " " + head[section].happystart + " - " + head[section].happyend
        headerCell.headercellname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmin.font = UIFont(name: "HelveticaNeue-Bold", size: 9)
        headerCell.headercellmax.font = UIFont(name: "HelveticaNeue-Bold", size: 9)
                
      //  headerCell.viretodisplayHappyhours.frame.width = width
        
                if boolexists == true
            {
               // headerCell.headercellmax.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
               // headerCell.headercellmin.backgroundColor = UIColor.whiteColor()
            }
            else
            {
               // headerCell.headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
               // headerCell.headercellmax.backgroundColor = UIColor.whiteColor()
            }
        
//        if global == true
//        {
//            headerCell.headercellmin.backgroundColor = UIColor.whiteColor()
//
//            
//        }
                
                if head[section].ishappy == "Yes"
                {
                    headerCell.HappyhourstiminglabelBeforeexpastion.textColor = UIColor.greenColor()
                }
                else
                {
                   headerCell.HappyhourstiminglabelBeforeexpastion.textColor = UIColor.blackColor()
                }
                
                if head[section].rest_offers_happy_hour == "Yes"
                {
                    headerCell.HappyhourstiminglabelBeforeexpastion.hidden = false
                    headerCell.happyhourslabelbeer.hidden = false
                    headerCell.viretodisplayHappyhours.hidden = false
                }
                else
                {
                   headerCell.HappyhourstiminglabelBeforeexpastion.hidden = true
                    headerCell.happyhourslabelbeer.hidden = true
                    headerCell.viretodisplayHappyhours.hidden = true
                }
               
                
                if head[section].color == true
                {
                   // headerCell.backgroundColor = UIColor(red: 0xcc/255,green: 0xd9/255,blue: 0xff/255,alpha: 1.0)
                    if boolexists != true{
                        //headerCell.headercellmax.backgroundColor = UIColor(red: 0xcc/255,green: 0xd9/255,blue: 0xff/255,alpha: 1.0)
                    }
                    else
                    {
                        ///headerCell.headercellmin.backgroundColor = UIColor(red: 0xcc/255,green: 0xd9/255,blue: 0xff/255,alpha: 1.0)
                    }
 
  
                }
                else
                {
                  // headerCell.backgroundColor = UIColor.whiteColor()
                }
                
        
        //Giving Font family style to a UIButton
        headerCell.mapbutton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 9)
                


        return headerCell
        }
        
        else
        {
            var  headerCell1 = tableView.dequeueReusableCellWithIdentifier("headercellnewforexpanded") as! customheadercellafterexpanstion
            headerCell1.backgroundColor = UIColor.whiteColor()
            headerCell1.restNameafterexpastion.text = " " + head[section].restname
            headerCell1.HappyhourstimingAfterexpantion.text = " " + head[section].happystart + " - " + head[section].happyend
            headerCell1.viewtodisplayhappyhoursafterexpanstion.layer.borderWidth = 1
            headerCell1.viewtodisplayhappyhoursafterexpanstion.layer.borderColor = UIColor.lightGrayColor().CGColor
           

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
  
                headerCell1.bottlelabel.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
                headerCell1.pintlabel.backgroundColor = UIColor.whiteColor()
                
            }
            else
            {
                headerCell1.pintlabel.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
                headerCell1.bottlelabel.backgroundColor = UIColor.whiteColor()
            }

            if head[section].rest_offers_happy_hour == "Yes"
            {
                headerCell1.HappyhourstimingAfterexpantion.hidden = false
                headerCell1.happyhoursdisplaylabelafterexpantion.hidden = false
            }
            else
            {
               headerCell1.HappyhourstimingAfterexpantion.hidden = true
                headerCell1.happyhoursdisplaylabelafterexpantion.hidden = true
            }
          //  end = self.view.frame.size.width
           // println(end)
//            origin = headerCell1.viewtodisplayhappyhoursafterexpanstion.layer.frame.origin.x
//            
//            println(origin)
//            println(end)
            //end =  headerCell1.viewtodisplayhappyhoursafterexpanstion.frame.size
            //println(headerCell1.viewtodisplayhappyhoursafterexpanstion.frame.size)
          //  headerCell1.viewtodisplayhappyhoursafterexpanstion.frame.width
      
            
            return headerCell1
            
        }
    }
        else
        {
            
            return nil
        }
        
        
    }
    
//    override func viewWillLayoutSubviews() {
//        
//        
//       end = self.view.frame.size.width
//        println(end)
//        
//    }
    func sectionHeaderTapped(gestureRecognizer: UITapGestureRecognizer)
    {
        var section = gestureRecognizer.view!.tag
        println(section)
        println("Section: \(gestureRecognizer.view!.tag)")
        
        if head[gestureRecognizer.view!.tag].bool == false
        {
            head[gestureRecognizer.view!.tag].bool = true
            
        }
        else
        {
            head[gestureRecognizer.view!.tag].bool = false
        }
        self.tableview.reloadData()
        
    }
    
    func tappedMe(gestureRecognizer: UITapGestureRecognizer)
    {
        var section = gestureRecognizer.view!.tag
        println(section)
        println("Section: \(gestureRecognizer.view!.tag)")
        
        if head[gestureRecognizer.view!.tag].bool == false
        {
            head[gestureRecognizer.view!.tag].bool = true
            
        }
        else
        {
            head[gestureRecognizer.view!.tag].bool = false
        }
        self.tableview.reloadData()
        
    }

    
    
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {

    }
    @IBAction func togglebuttonbeerpressed(sender: UIButton)
    {
    
        var array = [Restaurant]()
        array = head
        
        if togglebeer == false
        {
            self.array1 = head
            togglebuttonbeer.setImage(toggleon, forState: .Normal)
            togglebeer = true
            for var i = array.count-1;i >= 0;i--
            {
                if array[i].ishappy != "Yes"
                {
                    array.removeAtIndex(i)
                }

            }
            head = array
        }
        else
        {
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
            togglebeer = false

            if countfurther == 1
            {
                head = self.array2
            }
            else if countfurther == 2
            {
                head = self.array2
            }
            
            else if countfurther == 3
            {
               head = self.array2
            }
            else
            {
                head = self.array1
            }
        }
        if boolexists == true{
            head = self.bottlesorting(head)
        }
        else{
            head = self.pintsoring(head)
        }
        tableview.reloadData()
        
    }

    
    @IBAction func lookfurther(sender: AnyObject)
    {

        
        //28.63875
        //77.07380
       // changecolor = true
        println(countfurther)
        countfurther = countfurther + 1
        
        println(countfurther)
        
        if countfurther == 1{
            
            
            let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            selectedliqor = trimmedString1
            

           if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
           {
              getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=15&query=\(newtrimmedstring)")
            }
            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
           {
               getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=5&records=10&query=\(newtrimmedstring)")
            }
           else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
           {
            getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=5&records=10&query=\(trimmedString)")
            }
           else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == true
           {
            getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=5&records=10&query=\(trimmedString)")
            }
            
    
        
          //head = makecolor(newheadarray, arrayj: newheadarray1)
        self.array1 = self.head
            //fstobj1.color = true
        }
        
        if countfurther == 2
        {
            let trimmedString1 = selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            selectedliqor = trimmedString1

          // getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=15&query=\(newtrimmedstring)")
           //  getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=7&records=10&query=\(newtrimmedstring)")
            
            if isliqtextfieldhasdata == false && iscitytextfieldhavedata == false
            {
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=15&query=\(newtrimmedstring)")
            }
            else if isliqtextfieldhasdata == false && iscitytextfieldhavedata == true
            {
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=7&records=10&query=\(newtrimmedstring)")
            }
            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == false
            {
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=7&records=10&query=\(trimmedString)")
            }
            
            else if isliqtextfieldhasdata == true && iscitytextfieldhavedata == true
            {
                getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitudefromgoogle)&long=\(getcitylongitudefromgoogle)&km=7&records=10&query=\(trimmedString)")
            }

             self.array1 = self.head
           // fstobj1.color = true
        }
        
        if countfurther == 3
        {
            
            let alertController = UIAlertController(title: "Do you want go back to 2 km search", message: "Press the Ok or cancel", preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                self.countfurther = 2
                //self.fstobj1.color = true
               
            }
            alertController.addAction(cancelAction)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                self.countfurther = 0
                let trimmedString1 = self.selectedliqor.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                self.selectedliqor = trimmedString1

                
                
                if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == false
                {
                    self.getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=15&query=\(self.newtrimmedstring)")
                }
                else if self.isliqtextfieldhasdata == false && self.iscitytextfieldhavedata == true
                {
                    self.getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitudefromgoogle)&long=\(self.getcitylongitudefromgoogle)&km=2&records=10&query=\(self.newtrimmedstring)")
                }
                else if self.isliqtextfieldhasdata == true && self.iscitytextfieldhavedata == false
                {
                    self.getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitude)&long=\(self.getcitylongitude)&km=2&records=10&query=\(self.trimmedString)")
                }
                else if self.isliqtextfieldhasdata == true && self.iscitytextfieldhavedata == true
                {
                    self.getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(self.getcitylatitudefromgoogle)&long=\(self.getcitylongitudefromgoogle)&km=2&records=10&query=\(self.trimmedString)")
                }

                 self.array1 = self.head
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
          
            }
            
        }
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
                            fstobj1.distance = totalDistance1 + "Km."
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
                }
    
                
                head.append(fstobj1)
                array2 = head
                println(head.count)
                //newheadarray1 = head

                head = colormethod(head, newheadarray: newheadarray)
                
                if countfurther == 1
                {
                    one = head.count
                    two = countvlaues
                    
                }
                else if countfurther == 2
                {
                    two = head.count
                    
                }
                
                println(head.count)
                
            }
            println(one)
            println(two)
            if countvlaues > one
            {
                
            }
            
            else if one > two
            {
                
            }
            
                
            else
            {

        
                let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
             

            }
     
            
                if togglebeer == true
                {
                    var array = [Restaurant]()
                    array = head
                    for var i = array.count - 1;i>=0;i--
                    {
                        if array[i].ishappy != "Yes"
                        {
                             array.removeAtIndex(i)
                        }

                    }
                    head = array
                    tableview.reloadData()
                }

            if boolexists == true
            {
                head = bottlesorting(head)
                for var i = 0;i < head.count;i++
                {
                    println(head[i].maxp)
                }
            }
            
            else
            {
                head = pintsoring(head)
                for var i = 0;i < head.count;i++
                {
                    println(head[i].minp)
                }
            }
        }
            
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    
        self.tableview.reloadData()
   
    }
    
    @IBAction func pintsort(sender: AnyObject)
        
    {
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
            head[i].bool = false
            
        }
        head = pintsoring(head)
        self.tableview.reloadData()
    }
    
    @IBAction func bottolesort(sender: AnyObject)
        
    {
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
            head = bottlesorting(head)
            self.tableview.reloadData()
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "newsegforvodka"
        {
        if let destination1 = segue.destinationViewController as? tableviewclassvodka
        {
            destination1.liqvodkaname = newtextfieldtableview.text
            var liqvodkaname = newtextfieldtableview.text
            let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            destination1.liqvodkaname = trimmedString
            destination1.liqnamefromtableview = trimmedString
           // destination1.toggleboolean = toggleboolean
            destination1.header1 = headerfortableview
            println(headerfortableview.count)
            //destination1.toggle = toggle
            //destination1.toggleboolean = toggleforboth
            destination1.togglevodka = togglebeer
            destination1.getcitylatitude = getcitylatitude
            destination1.getcitylongitude = getcitylongitude
            destination1.getdevicelatitude = getdevicelatitude
            destination1.getdevicelongitude = getdevicelongitude
            destination1.selectedliqor = selectedliqor
            destination1.getvodkalatitude = restlat
            destination1.getvodkalongitude = restlong
            destination1.getcitylatitufrombeerscreen = getcitylatitude
            destination1.getcitylongitudefrombeerscreen = getcitylongitude
            destination1.getselectedcityname = getselectedcityname
        }
        }
    }
    
    @IBAction func backbutton(sender: UIButton)
    {
        performSegueWithIdentifier("gobacktoresult1", sender: self)
    }
    
    @IBAction func getdeals(sender: UIButton) {
        performSegueWithIdentifier("getdealsfrombeer", sender: self)
    }
    

    
func pintsoring (var array:[Restaurant]) -> [Restaurant]
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
    
    func bottlesorting (var array:[Restaurant]) -> [Restaurant]
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
        var array = [Restaurant]()
        
        array = head
        if togglebeer == true
        {
            self.array1 = head
            for var i = array.count-1;i >= 0;i--
            {
                if array[i].ishappy != "Yes"
                {
                    array.removeAtIndex(i)
                }
            }
            head = array
        }
        else
        {
            self.array1 = head
            println(array1.count)
            if countfurther == 1
            {
                head = self.array2
            }
            else if countfurther == 2
            {
                head = self.array2
            }
            else if countfurther == 3
            {
                head = self.array2
            }
            else
            {
                println(array1.count)
                head = self.array1
            }
        }
        if boolexists == true{
            head = self.bottlesorting(head)
        }
        else{
            head = self.pintsoring(head)
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

}








































