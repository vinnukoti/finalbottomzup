//
//  results.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation

var variable:String!

var liqnamefromtextfield:String!


var restlat:Double!
var restlong:Double!

var restvodkalang:Double!
var restvodkalat:Double!

var trimmedString:String!

var head1:[Restaurant] = [Restaurant]()
var fstobj1 = Restaurant()

var header:[Restauarantvodka] = [Restauarantvodka]()
var vodkaobj = Restauarantvodka()
var alert = false
var trim = false
var check:Int!



class results: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
  
    var citylat:Double!
    var citylong:Double!
    
    var newarar =  [String]()
    @IBOutlet var mainview: UIView!

    @IBOutlet weak var  autocmpleteTextfield: AutoCompleteTextField!
    
    @IBOutlet weak var textfield1: UITextField!
   
    @IBOutlet weak var tableview: UITableView!
    
    private var responseData:NSMutableData?

    private var connection:NSURLConnection?
    
    private let googleMapsKey = "AIzaSyAmC9Bxbw-8M-6ppbty3ArFP7u2t97KKMY"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"

    var autocompleteUrls = [String]()
    
    let locationManager1 = CLLocationManager()

    var locationname:String!
    var arar = [String]()
 
    var flag = false
    var devicelatitude:Double!
    var devicelongitude:Double!

    override func viewDidLoad()
    {
        textfield1.delegate = self
        tableview!.delegate = self
        tableview!.dataSource = self
        tableview!.scrollEnabled = true
        tableview!.hidden = true
        autocmpleteTextfield.delegate = self
        configureTextField()
        handleTextFieldInterfaces()
        
       // locationManager = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        locationManager1.startUpdatingLocation()
    }
    
//    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
//        
//        CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
//            
//            if (error != nil) {
//                println("Error: " + error.localizedDescription)
//                return
//            }
//            
//            if placemarks.count > 0 {
//                let pm = placemarks[0] as! CLPlacemark
//                self.displayLocationInfo(pm)
//            } else {
//                println("Error with the data.")
//            }
//        })
//    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userLocation:CLLocation = locations[0] as! CLLocation
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        //Do What ever you want with it
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: {
            placemarks, error in

        
        if error == nil && placemarks.count > 0
        {
//            self.placeMark = placemarks.last as? CLPlacemark
//            self.adressLabel.text = "\(self.placeMark!.thoroughfare)\n\(self.placeMark!.postalCode) \(self.placeMark!.locality)\n\(self.placeMark!.country)"
//            self.manager.stopUpdatingLocation()
        }
            })
    }
    
    

   
    // Resign Firstresponder of UITableview
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        tableview.hidden = true
    }

    
    func reverseGeocodeLocation(location: CLLocation!, completionHandler: CLGeocodeCompletionHandler!){
        
    }
    
    //liq drop down table resign first responder
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textfield1.resignFirstResponder()
        autocmpleteTextfield.resignFirstResponder()
        
        return true
    }
    
    //keyboard resign firsdt responder 

   // getting Device latitude and longitude

    
    //city textfield
    private func configureTextField()
    {
        autocmpleteTextfield.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        autocmpleteTextfield.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        autocmpleteTextfield.autoCompleteCellHeight = 35.0
        autocmpleteTextfield.maximumAutoCompleteCount = 20
        autocmpleteTextfield.hidesWhenSelected = true
        autocmpleteTextfield.hidesWhenEmpty = true
        autocmpleteTextfield.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Light", size: 14.0)
        autocmpleteTextfield.autoCompleteAttributes = attributes
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
        autocmpleteTextfield.onTextChange = {[weak self] text in
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
        autocmpleteTextfield.onSelect = {[weak self] text, indexpath in
            self!.autocmpleteTextfield.text = text;self!.view.endEditing(true)
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil
                {
                    let coordinate = placemark!.location.coordinate
                    self!.citylat = coordinate.latitude
                    self!.citylong = coordinate.longitude
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
                        self.autocmpleteTextfield.autoCompleteStrings = locations
                    }
                }
                else{
                    self.autocmpleteTextfield.autoCompleteStrings = nil
                }
            }
        }
    }
    
    func connection(connection: NSURLConnection, didFailWithError error: NSError)
    {
        println("Error: \(error.localizedDescription)")
    }
    
    
    // textfield1 starts
    func textFieldDidBeginEditing(textField: UITextField)
    {
            
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
     
    }
    
    func textFieldDidChange(textField: UITextField)
    {
        
        if self.textfield1.text != nil && self.textfield1.text != ""
        {
            var s = self.textfield1.text
            variable = s
            variable.startIndex
            let trimmedString1 = variable.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
            trim = true
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
        var substring = self.textfield1.text
        //substring.lowercaseString
        searchAutocompleteEntriesWithSubstring(substring)
        
        self.tableview.reloadData()
        self.tableview!.hidden = false
    }

// Autocomplete liq
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        
        return true
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepCapacity: false)
   
        var usubstring = substring.uppercaseString
        
        for curString in newarar
        {
            var ucurstring = curString.uppercaseString
          
            var myString: NSString! = ucurstring as NSString
            var substringRange: NSRange! = myString.rangeOfString(usubstring)
            
           if (substringRange.location == 0)
           {
              autocompleteUrls.append(ucurstring.lowercaseString)
            }
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return autocompleteUrls.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        tableview.layer.masksToBounds = true
        tableview.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        tableview.layer.borderWidth = 2.0

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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        textfield1.text = selectedCell.textLabel!.text
        self.view.endEditing(true)
        tableView.hidden = true
    }

    @IBAction func search(sender: AnyObject)
    {
        
       liqnamefromtextfield = textfield1.text
       trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
       getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=28.63875&long=77.07380&km=5&records=4&query=\(trimmedString)")
        //28.63875
        //77.07380
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
        header = [Restauarantvodka]()
        for var index = 0; index < json.count; ++index
        {
            fstobj1 = Restaurant()
            vodkaobj = Restauarantvodka()
            
            if let bottomsUp1 = json[index] as? NSDictionary
            {
                if let avg_price = bottomsUp1["avg_price"] as? Int
                {
                   check = avg_price
                    println("check  \(check)")
                }
                if check <= 0{
                if let pint_avg_price = bottomsUp1["pint_avg_price"] as? Int
                {
                    var pint_avg_price2:String = toString(pint_avg_price)
                    fstobj1.minp = pint_avg_price2
                }
                if let bottle_avg_price = bottomsUp1["bottle_avg_price"] as? Int
                {
                    var bottle_avg_price2:String = toString(bottle_avg_price)
                    fstobj1.maxp = bottle_avg_price2
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
                        println(restlat)
                    }
                    if let res_long = resInfo["res_long"] as? String
                    {
                        let mySwiftString = res_long
                        var string = NSString(string: mySwiftString)
                        string.doubleValue
                        restlong = string.doubleValue
                        println(restlong)

                        
                    }
                    if var distance = resInfo["distance"] as? String
                    {
                        //28.63875
                        //77.07380
                        var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
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
                 head1.append(fstobj1)
                }
                    
                else
                {
                   if let avg_price = bottomsUp1["avg_price"] as? Int
                   {
                    var avg_price2:String = toString(avg_price)
                    vodkaobj.avgprice = avg_price2
                    
                    }
                    if let resInfo = bottomsUp1["resInfo"] as? NSDictionary
                    {
                        if let res_name = resInfo["res_name"] as? String
                        {
                            vodkaobj.restnamevodka = res_name
                        }
                        
                        if let res_lat = resInfo["res_lat"] as? String
                        {
                            let mySwiftString = res_lat
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restvodkalat = string.doubleValue
                            println(restvodkalat)

                        }
                        if let res_long = resInfo["res_long"] as? String
                        {
                            let mySwiftString = res_long
                            var string = NSString(string: mySwiftString)
                            string.doubleValue
                            restvodkalang = string.doubleValue
                            println(restvodkalang)
                        }
                        if var distance = resInfo["distance"] as? String
                        {
                            //28.63875
                            //77.07380
                            var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
                            var newLocation: CLLocation = CLLocation(latitude: restvodkalat, longitude: restvodkalang)
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
                            vodkaobj.distancevodka = totalDistance1 + "KM"
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
                        }
                    }
                    header.append(vodkaobj)
                    println("header \(vodkaobj)")
                }
            }
        }
        if check <= 0
        {
        
         performSegueWithIdentifier("newres", sender: self)
        }
        else
        {
          performSegueWithIdentifier("vodka", sender: self)
        }
        }
        else
          {
            let alertController = UIAlertController(title: "Bottomz Up", message:"Appsriv", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "No data Found", style: UIAlertActionStyle.Default,handler: nil))
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
        if segue.identifier == "newres"
        {
            if let destination = segue.destinationViewController as? tableviewclass
            {
                //28.63875
                //77.07380
                destination.liqname = textfield1.text
                var liqname = textfield1.text
                let trimmedString = liqname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination.liqname = trimmedString
                destination.head = head1
                destination.getdevicelatitude = devicelatitude
                destination.getdevicelongitude = devicelongitude
                destination.getcitylatitude = 28.63875
                destination.getcitylongitude = 77.07380
                
           }
        }
        if segue.identifier == "vodka"
        {
            if let destination1 = segue.destinationViewController as? tableviewclassvodka
            {
                destination1.liqvodkaname = textfield1.text
                var liqvodkaname = textfield1.text
                let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination1.liqvodkaname = trimmedString

                destination1.header1 = header
                destination1.getcitylatitude = 28.63875
                destination1.getcitylongitude = 77.07380
            }
        }
        if segue.identifier == "mapview"
        {
            if let destination2 = segue.destinationViewController as? mapview
            {
                destination2.getdevicelatitude = devicelatitude
                destination2.getdevicelongitude = devicelongitude
                destination2.getcitylatitude = 28.63875
                destination2.getcitylongitude = 77.07380
                destination2.getdevicelatitude = devicelatitude
                destination2.getdevicelongitude = devicelongitude
            }
            
        }
    }
    
    
    @IBAction func getcurrentlocationname(sender: AnyObject)
    {
     
        func displayLocationInfo(placemark: CLPlacemark) {
            
           // self.locationManager.stopUpdatingLocation()
            println(placemark.locality)
            println(placemark.postalCode)
            println(placemark.administrativeArea)
            println(placemark.country)
            
            autocmpleteTextfield.text = placemark.locality + placemark.postalCode + placemark.administrativeArea + placemark.country
            
        }
        
        func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
            println("Error: " + error.localizedDescription)
        }

        
        
      // autocmpleteTextfield.text = placemark.locality + placemark.postalCode + placemark.administrativeArea + placemark.country
        
        
    }

    @IBAction func nearbar(sender: AnyObject)
    {
        performSegueWithIdentifier("mapview", sender: self)

    }
    
    
}
    
    
    
    
    
    

    
    
    



