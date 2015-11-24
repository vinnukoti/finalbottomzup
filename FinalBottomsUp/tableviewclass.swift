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


class tableviewclass: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate,UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
    var head1:[Restaurant] = [Restaurant]()
    var headerfortableview:[Restauarantvodka] = [Restauarantvodka]()
    var getfstobj1 = Restaurant()
    var fstobj1 = Restaurant()
    var vodkaobjnew = Restauarantvodka()
    var header1:[Restauarantvodka] = [Restauarantvodka]()
    var getselectedlq:String!

    
    var restlat:Double!
    var restlong:Double!
   // var getfstobj2 = Restaurant()
    
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
    
    @IBOutlet weak var selectedliqname: UILabel!
    @IBOutlet weak var resturantnamelable: UILabel!
 //   @IBOutlet weak var restaurantnamelable2: UILabel!
    
    let pintcheckedImage = UIImage(named: "pintenabled")
    let pintunCheckedImage = UIImage(named: "pint")
    
    let bottlecheckedImage = UIImage(named: "bottleenabled")
    let bottleunCheckedImage = UIImage(named: "bottle")
    
    let locationcheckedImage = UIImage(named: "locationenabled")
    let locationunCheckedImage = UIImage(named: "location")
    
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
    
    var toggle = false
    
    var inputArr = [Restaurant]()
    
       var currentlocationname:String!
    

    @IBOutlet weak var newuitableview: UITableView!
   // @IBOutlet weak var newliqdropdowntableview: UITableView!
    @IBOutlet weak var getdealsbutton: UIButton!
    
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
    
    var getselectedliqname:String!
    
  //  var selectedliqor1:String!
    
    
    

    
    override func viewDidLoad()
    {
        
        newtextfieldtableview.text = selectedliqor
        configureTextField()
        handleTextFieldInterfaces()
     

        autocompletetextfieldforbeer.text = getselectedcityname
       // var getcitynamefromnewtextfield = autocompletetextfieldforbeer.text
        newuitableview.hidden = true
        
        getdealsbutton.layer.cornerRadius = 10
        getdealsbutton.setBackgroundImage(delasimage, forState: .Normal)
        
        inputArr = head
    
        pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
        
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
        
        //var drink = getselectedliq.capitalizedString
        //selectedliqname.text =  drink
        togglebuttonbeer.setImage(toggleoff, forState: .Normal)
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
       // newliqdropdowntableview.scrollEnabled = true
        

        tableview.tag = 1
        newuitableview.tag = 0
        newtextfieldtableview.tag = 2
        
        func swapNumbers(index1 :Int,index2: Int)
        {
            let temp = inputArr[index1]
            println(temp)
            inputArr[index1] = inputArr[index2]
            println(inputArr[index1])
            inputArr[index2] = temp
            println(inputArr[index2])
        }
        
        for var ind: Int = 0; ind < inputArr.count - 1; ++ind
        {
            for var jIndex: Int = ind + 1; jIndex < inputArr.count; ++jIndex
            {
                println(jIndex)
                if inputArr[jIndex].minp < inputArr[ind].minp
                {
                    // println(inputArr[jIndex].maxp)
                    // println(inputArr[jIndex + 1].maxp)
                    //swapNumbers(jIndex, ind)
                    //println(swapNumbers(jIndex, jIndex+1))
                    //println(inputArr[jIndex + 1].maxp)
                    let temp = inputArr[jIndex]
                    //println(temp)
                    inputArr[jIndex] = inputArr[ind]
                    //println(inputArr[index1])
                    inputArr[ind] = temp
                }
            }
        }
        
        //  println(inputArr.first)
        // println(inputArr.last)
        head = inputArr
        self.tableview.reloadData()

        
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
//                    self!.citylat = coordinate.latitude
//                    self!.citylong = coordinate.longitude
                    self!.getcitylatitudefromgoogle = coordinate.latitude
                    self!.getcitylongitudefromgoogle = coordinate.longitude
                    
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

        
        textField.selectAll(self)
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
        
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
        trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
           
        getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=50&records=10&query=\(trimmedString)")
            //getcit
        
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
                                println(String(format: "%.2f KM", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f KM", totalDistance))
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                                totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                
                                
                                fstobj1.distance = totalDistance1 + "KM"
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
                            
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_start, 1, 5))
                            var happy_hour_start2 = PartOfString(happy_hour_start, 1, 5)
                            
                            vodkaobjnew.vodkahappystart = happy_hour_start2
                            //vodkasendobj.vodkahappystart = happy_hour_start2
                        }
                        
                        if let happy_hour_end = bottomsUp1["happy_hour_end"] as? String
                        {
                            
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_end, 1, 5))
                            var happy_hour_end2 = PartOfString(happy_hour_end, 1, 5)
                            vodkaobjnew.vodkahappyend = happy_hour_end2
                            //vodkasendobj.vodkahappyend = happy_hour_end2
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            vodkaobjnew.vodkaishappy = is_happy_hour
                            // vodkasendobj.vodkaishappy = is_happy_hour
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
                                println(String(format: "%.2f KM", totalDistance))
                                NSLog("totalDistance: %@", String(format: "%.2f KM", totalDistance))
                                var totalDistance1 = totalDistance.description
                                println(totalDistance1)
                                func PartOfString(s: String, start: Int, length: Int) -> String
                                {
                                    return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                                }
                                println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                                totalDistance1 = PartOfString(totalDistance1, 1, 3)
                                vodkaobjnew.distancevodka = totalDistance1 + "KM"
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
                
                //self.performSegueWithIdentifier("getbeernew", sender: self)
                head = head1
                tableview.reloadData()
                
            }
            else
            {
                self.performSegueWithIdentifier("newsegforvodka", sender: self)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    
    
    @IBAction func togglebuttonbeerpressed(sender: UIButton)
    {
        if toggle == false
        {
            togglebuttonbeer.setImage(toggleon, forState: .Normal)
            toggle = true
        }
        else{
            togglebuttonbeer.setImage(toggleoff, forState: .Normal)
            toggle = false
            
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
       // newliqdropdowntableview.hidden = true
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
        
        //popupview.hidden = true
        
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
//        popupview.hidden = false
//        resturantnamelable.text = "I just got a 10% discount at \(head[sender.tag].restname) through the BottomzUp App"
        //restaurantnamelable2.text = ""
        
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
        if tableView.tag == 1
        {

        let cells = tableView.dequeueReusableCellWithIdentifier("tableChildCell", forIndexPath: indexPath) as! BeerRowCell
        cells.beers = [liqclass]()
        cells.beers = head[indexPath.section].amp
        cells.press2reveal.tag = indexPath.section
        cells.restaurantName = head[indexPath.section].restname
      //  cells.directions.setTitle(head[indexPath.section].distance, forState: UIControlState.Normal)
        cells.distancelabelnew.text = head[indexPath.section].distance
        //cells.distanceroundimage.image = UIImage(named: "Happyhoursround image")
        cells.tableView.reloadData()
        
        return cells
        }
        
        else
        {
            newtextfieldtableview.layer.masksToBounds = true
            newtextfieldtableview.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
            newtextfieldtableview.layer.borderWidth = 2.0
            
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
        if tableView.tag == 1{
        if head[section].bool == false
        {
            
            return 99   
            
        }
        else{
            return 60
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
        
        if tableView.tag == 1{
        var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! customheadercell
        headerCell.tag = section
        headerCell.backgroundColor = UIColor.whiteColor()
        headerCell.headercellname.text = head[section].restname
        headerCell.headercellmin.text = "₹ " + "\(head[section].minp)"
        headerCell.headercellmax.text = "₹ " + "\(head[section].maxp)"
        headerCell.happyhourslabelbeer.text = "Happy Hours " + head[section].happystart + "PM-" + head[section].happyend + "PM  "
        var headerTapped: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        headerCell.addGestureRecognizer(headerTapped)
        headerCell.userInteractionEnabled = true
        headerCell.mapbutton.tag = section
        headerCell.mapbutton.setTitle(head[section].distance, forState: UIControlState.Normal)
        headerCell.availofferbuttonbeer.tag = section
        headerCell.headercellname.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmin.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmax.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        headerCell.headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        
        if global == true{
            headerCell.headercellmin.backgroundColor = UIColor.whiteColor()
            
        }
        
        
        if head[section].bool == false
        {
            headerCell.headercellmin.hidden = false
            headerCell.headercellmax.hidden = false
            headerCell.mapbutton.hidden = false
            headerCell.availofferbuttonbeer.hidden = false
            headerCell.happyhourslabelbeer.hidden = false
            headerCell.arrowimage.image = UIImage(named: "arrow")
            headerCell.headercellnamechild.hidden = true
       }
        else
        {
            //headerCell.roundimagebeer.hidden = true
            headerCell.headercellmin.text = ""
            headerCell.headercellmax.text = ""
            headerCell.mapbutton.setTitle("", forState: UIControlState.Normal)
            headerCell.availofferbuttonbeer.hidden = true
            headerCell.happyhourslabelbeer.hidden = true
            headerCell.arrowimage.hidden = true
            headerCell.headercellnamechild.text = head[section].restname
            headerCell.happyhourslablebeernew.text = "Happy Hours " + head[section].happystart + "PM-" + head[section].happyend + "PM "
            headerCell.happyhourslabelbeer.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
            headerCell.headercellname.hidden = true
            
            headerCell.setheadercellnamechildimaghe.layer.borderColor = UIColor.lightGrayColor().CGColor
            headerCell.setheadercellnamechildimaghe.layer.borderWidth = 1
        }
        //Giving Font family style to a UIButton
        headerCell.mapbutton.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 11)
        if head[section].happyend == "yes"
        {
            headerCell.happyhourslabelbeer.layer.cornerRadius = 10
            headerCell.happyhourslabelbeer.layer.borderColor = UIColor.greenColor().CGColor
            headerCell.happyhourslabelbeer.layer.borderWidth = 1


        }
        else
        {
            
            headerCell.happyhourslabelbeer.layer.cornerRadius = 10
            headerCell.happyhourslabelbeer.layer.borderColor = UIColor.redColor().CGColor
            headerCell.happyhourslabelbeer.layer.borderWidth = 1
        }
        
        if pintbuttonclicked == true
        {
            headerCell.headercellmin.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }

        
        if bottlebuttonclicked == true
        {
            headerCell.headercellmax.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }
        
        if locationbuttonclicked == true
        {
            headerCell.mapbutton.backgroundColor = UIColor(red: 0xff/255,green: 0xd2/255,blue: 0x00/255,alpha: 1.0)
        }

        return headerCell
        }
        else
        {
            //var  headerCell = tableView.dequeueReusableCellWithIdentifier("headercellnew") as! UITableViewCell
            
            return nil
        }
    }
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
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {

    }
    
    
    @IBAction func lookfurther(sender: AnyObject)
    {
        //         println("latitude is \(citylat)")
        //         println("longitude is\(citylong)")
        
        //28.63875
        //77.07380
        changecolor = true
        getbardatafurther("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(getcitylatitude)&long=\(getcitylongitude)&km=8&records=15&query=\(liqname)")
        
        
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
            head = [Restaurant]()
            
            for var index = 0; index < json.count; ++index
            {
                getfstobj1 = Restaurant()
                
                if let bottomsUp1 = json[index] as? NSDictionary
                {
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            getfstobj1.restname = res_name
                        }
                        
                        
                        if let happy_hour_startbeer = bottomsUp1["happy_hour_start"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_startbeer, 1, 5))
                            var happy_hour_startbeer1 = PartOfString(happy_hour_startbeer, 1, 5)
                            getfstobj1.happystart = happy_hour_startbeer1
                        }
                        
                        if let happy_hour_endbeer = bottomsUp1["happy_hour_end"] as? String
                        {
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(happy_hour_endbeer, 1, 5))
                            var happy_hour_endbeer1 = PartOfString(happy_hour_endbeer, 1, 5)
                            
                            getfstobj1.happyend = happy_hour_endbeer1
                        }
                        
                        if let is_happy_hour = bottomsUp1["is_happy_hour"] as? String
                        {
                            getfstobj1.ishappy = is_happy_hour
                        }
                        
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            //convert String to Double
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getrestlatitudebeer = string.doubleValue
                            //println(restlat)
                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            getrestlongitudebeer = string.doubleValue
                            //println(restlong)
                            
                            
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            
                            var OldLocation: CLLocation = CLLocation(latitude: getdevicelatitude, longitude: getdevicelongitude)
                            var newLocation: CLLocation = CLLocation(latitude: getrestlatitudebeer, longitude: getrestlongitudebeer)
                            var totalDistance: Double = 0
                            var meters: CLLocationDistance = newLocation.distanceFromLocation(OldLocation)
                            totalDistance = totalDistance + (meters / 1000)
                            println(String(format: "%.2f KM", totalDistance))
                            NSLog("totalDistance: %@", String(format: "%.2f KMS", totalDistance))
                            var totalDistance1 = totalDistance.description
                            println(totalDistance1)
                            func PartOfString(s: String, start: Int, length: Int) -> String
                            {
                                return s.substringFromIndex(advance(s.startIndex, start - 1)).substringToIndex(advance(s.startIndex, length))
                            }
                            println("SUBSTRING    " + PartOfString(totalDistance1, 1, 3))
                            totalDistance1 = PartOfString(totalDistance1, 1, 3)
                            
                            
                            getfstobj1.distance = totalDistance1 + "KMS"
                            // println(fstobj1.distance)
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
                            getfstobj1.amp.append(liqobj1)
                        }
                    }
                    if let pint_avg_price = bottomsUp1["pint_avg_price"] as? Int
                    {
                       // var pint_avg_price1:String = toString(pint_avg_price)
                        getfstobj1.minp = pint_avg_price
                    }
                    if let bottle_avg_price = bottomsUp1["bottle_avg_price"] as? Int
                    {
                        //var bottle_avg_price1:String = toString(bottle_avg_price)
                        getfstobj1.maxp = bottle_avg_price
                    }
                }
                head.append(getfstobj1)
            }
        }
        else
        {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
        self.tableview.reloadData()
        
    }
    
    @IBAction func pintsort(sender: AnyObject)
        
    {
        inputArr = head
        bottlebuttonclicked = false
        locationbuttonclicked = false
        pintbuttonclicked = true
        
        if pintbuttonclicked == true
        {
            //pintbutton.setImage(checkedImage, forState: .Normal)
            pintbutton.setBackgroundImage(pintcheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
            locationbutton.setBackgroundImage(locationunCheckedImage, forState: .Normal)
        }
       
//        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
//        {
//            var sorted = false
//            while sorted == false
//            {
//                sorted = true
//                if cards.count > 1
//                {
//                    for i in 0...cards.count - 2
//                    {
//                        if cards[i].minp < cards[i+1].minp
//                        {
//                            sorted = false
//                            var first = cards[i]
//                            var second = cards[i + 1]
//                            println("first object before \(first.minp)")
//                            println("second object before\(second.minp)")
//                            cards[i] = second
//                            cards[i + 1] = first
//                            println("first object after\(cards[i].minp)")
//                            println("second object after\(cards[i + 1].minp)")
//                        }
//                    }
//                }
//                else
//                {
//                    
//                }
//            }
//            return cards
//        }
//        var sortedarray:[Restaurant] = sortCards(&head)
        
        
        func swapNumbers(index1 :Int,index2: Int)
        {
            let temp = inputArr[index1]
            println(temp)
            inputArr[index1] = inputArr[index2]
            println(inputArr[index1])
            inputArr[index2] = temp
            println(inputArr[index2])
        }
        
        for var ind: Int = 0; ind < inputArr.count - 1; ++ind
        {
            for var jIndex: Int = ind + 1; jIndex < inputArr.count; ++jIndex
            {
                println(jIndex)
                if inputArr[jIndex].minp < inputArr[ind].minp
                {
                    // println(inputArr[jIndex].maxp)
                    // println(inputArr[jIndex + 1].maxp)
                    //swapNumbers(jIndex, ind)
                    //println(swapNumbers(jIndex, jIndex+1))
                    //println(inputArr[jIndex + 1].maxp)
                    let temp = inputArr[jIndex]
                    //println(temp)
                    inputArr[jIndex] = inputArr[ind]
                    //println(inputArr[index1])
                    inputArr[ind] = temp
                }
            }
        }
        
        //  println(inputArr.first)
        // println(inputArr.last)
        head = inputArr
        self.tableview.reloadData()
        
        //println("sorted array is  : \(head)")
        
        
        
        //        else
        //        {
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].minp < cards[i+1].minp
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.minp)")
        //                            println("second object before\(second.minp)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //                            println("first object after\(cards[i].minp)")
        //                            println("second object after\(cards[i + 1].minp)")
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
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
        
    }
    
    @IBAction func bottolesort(sender: AnyObject)
        
    {
        global = true
        inputArr = head
        pintbuttonclicked = false
        locationbuttonclicked = false
        bottlebuttonclicked = true
        
        if bottlebuttonclicked == true
        {
            
            pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
            bottlebutton.setBackgroundImage(bottlecheckedImage, forState: .Normal)
            locationbutton.setBackgroundImage(locationunCheckedImage, forState: .Normal)
//            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
//            {
//                var sorted = false
//                while sorted == false
//                {
//                    sorted = true
//                    if cards.count > 1
//                    {
//                        for i in 0...cards.count - 2
//                        {
//                            if cards[i].maxp < cards[i+1].maxp
//                            {
//                                sorted = false
//                                var first = cards[i]
//                                var second = cards[i + 1]
//                                println("first object before \(first.maxp)")
//                                println("second object before\(second.maxp)")
//                                cards[i] = second
//                                cards[i + 1] = first
//                                
//                                println("first object after\(cards[i].maxp)")
//                                println("second object after\(cards[i + 1].maxp)")
//                                
//                            }
//                        }
//                    }
//                    else
//                    {
//                        
//                    }
//                }
//                return cards
//            }
//            var sortedarray:[Restaurant] = sortCards(&head)
            
            func swapNumbers(index1 :Int,index2: Int)
            {
                let temp = inputArr[index1]
                println(temp)
                inputArr[index1] = inputArr[index2]
                println(inputArr[index1])
                inputArr[index2] = temp
                println(inputArr[index2])
            }
            
            for var ind: Int = 0; ind < inputArr.count - 1; ++ind
            {
                for var jIndex: Int = ind + 1; jIndex < inputArr.count; ++jIndex
                {
                    println(jIndex)
                    if inputArr[jIndex].maxp < inputArr[ind].maxp
                    {
                       // println(inputArr[jIndex].maxp)
                       // println(inputArr[jIndex + 1].maxp)
                        //swapNumbers(jIndex, ind)
                        //println(swapNumbers(jIndex, jIndex+1))
                        //println(inputArr[jIndex + 1].maxp)
                        let temp = inputArr[jIndex]
                        //println(temp)
                        inputArr[jIndex] = inputArr[ind]
                        //println(inputArr[index1])
                        inputArr[ind] = temp
                    }
                }
            }
        
          //  println(inputArr.first)
           // println(inputArr.last)
            head = inputArr
            self.tableview.reloadData()
            
            println("sorted array is  : \(head)")
            
        }
        
        
        //        else
        //        {
        //
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].maxp < cards[i+1].maxp
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.maxp)")
        //                            println("second object before\(second.maxp)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //
        //                            println("first object after\(cards[i].maxp)")
        //                            println("second object after\(cards[i + 1].maxp)")
        //
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
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
        
    }
    
    
    @IBAction func locationsort(sender: AnyObject)
    {
        //        pintbuttonclicked = false
        //        bottlebuttonclicked = false
        //        locationbuttonclicked = true
        //
        //        if locationbuttonclicked == true
        //        {
        //            pintbutton.setBackgroundImage(pintunCheckedImage, forState: .Normal)
        //            bottlebutton.setBackgroundImage(bottleunCheckedImage, forState: .Normal)
        //            locationbutton.setBackgroundImage(locationcheckedImage, forState: .Normal)
        //        }
        //
        ////        func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        ////        {
        ////            var sorted = false
        ////            while sorted == false
        ////            {
        ////                sorted = true
        ////                if cards.count > 1
        ////                {
        ////                for i in 0...cards.count - 2
        ////                {
        ////                    if cards[i].distance > cards[i+1].distance
        ////                    {
        ////                        sorted = false
        ////                        var first = cards[i]
        ////                        var second = cards[i + 1]
        ////                        println("first object before \(first.distance)")
        ////                        println("second object before\(second.distance)")
        ////                        cards[i] = second
        ////                        cards[i + 1] = first
        ////
        ////                        println("first object after\(cards[i].distance)")
        ////                        println("second object after\(cards[i + 1].distance)")
        ////
        ////                    }
        ////                }
        ////                }
        ////                else
        ////                {
        ////
        ////                }
        ////            }
        ////            return cards
        ////            }
        ////            var sortedarray:[Restaurant] = sortCards(&head)
        ////            head = sortedarray
        //            self.tableview.reloadData()
        //
        //            println("sorted array is  : \(head)")
        //
        //        else
        //        {
        //            func sortCards(inout cards: Array<Restaurant>) -> Array<Restaurant>
        //            {
        //                var sorted = false
        //                while sorted == false
        //                {
        //                    sorted = true
        //                    if cards.count > 1
        //                    {
        //                    for i in 0...cards.count - 2
        //                    {
        //                        if cards[i].distance < cards[i+1].distance
        //                        {
        //                            sorted = false
        //                            var first = cards[i]
        //                            var second = cards[i + 1]
        //                            println("first object before \(first.distance)")
        //                            println("second object before\(second.distance)")
        //                            cards[i] = second
        //                            cards[i + 1] = first
        //                            
        //                            println("first object after\(cards[i].distance)")
        //                            println("second object after\(cards[i + 1].distance)")
        //                            
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
        //            var sortedarray:[Restaurant] = sortCards(&head)
        //            head = sortedarray
        //            self.tableview.reloadData()
        //            println("sorted array is  : \(head)")
        //            doubleTap = true
        //        }
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
            
            destination1.header1 = headerfortableview
            println(headerfortableview.count)
            // destination1.headfurther = headervodka
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
    
    @IBAction func getDirections(sender: UIButton)
    {
        
        UIApplication.sharedApplication().openURL(NSURL(string:"http://maps.google.com/maps?saddr=\(getdevicelatitude),\(getdevicelongitude)&daddr=\(head[sender.tag].Restaurantlatitude),\(head[sender.tag].Restaurantlongitude)")!)
        
    }
    
    @IBAction func backbutton(sender: UIButton)
    {
        performSegueWithIdentifier("gobacktoresult1", sender: self)
    }
    
}













































