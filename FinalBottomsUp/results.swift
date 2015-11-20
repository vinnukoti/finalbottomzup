//
//  results.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import CoreLocation


class results: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate
{
  
    var head1:[Restaurant] = [Restaurant]()
    var fstobj1 = Restaurant()
    
    
    var citylat:Double!
    var citylong:Double!
    var variable:String!
    var trimmedString:String!
    var liqnamefromtextfield:String!
    var check:Int!
    
    var newarar =  [String]()
    @IBOutlet var mainview: UIView!

    @IBOutlet weak var  autocmpleteTextfield: AutoCompleteTextField!
    
    @IBOutlet weak var textfield1: UITextField!
   
    @IBOutlet weak var tableview: UITableView!
    
    private var responseData:NSMutableData?

    private var connection:NSURLConnection?
    
    private let googleMapsKey = "AIzaSyC8fGPXIWXTKJNvkBvKszetkDYbqh5AtC0"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"

    var autocompleteUrls = [String]()
    
    var locationManager1: CLLocationManager!

    var locationname:String!
    var arar = [String]()
 
    var flag = false
    var devicelatitude:Double!
    var devicelongitude:Double!
    
    var iscitytextfieldhavedata = false
    var isliqtextfieldhasdata = false
    
    @IBOutlet weak var findapubbutton: UIButton!
    var currentlocationname:String!
    
    var selectedliqor:String!
    
    
    var restvodkalang:Double!
    var restvodkalat:Double!
    
    var restlat:Double!
    var restlong:Double!
    
    var header:[Restauarantvodka] = [Restauarantvodka]()
   // var headervodka:[Restauarantvodka] = [Restauarantvodka]()
    var vodkaobj = Restauarantvodka()
  
    


    


    override func viewDidLoad()
    {
        textfield1.delegate = self
        tableview!.delegate = self
        tableview!.dataSource = self
        tableview!.scrollEnabled = true
        tableview!.hidden = true
        autocmpleteTextfield.textFieldWidth = autocmpleteTextfield.frame.width
        autocmpleteTextfield.delegate = self
        
        configureTextField()
        handleTextFieldInterfaces()
        locationManager1 = CLLocationManager()
        // locationManager = CLLocationManager()
        locationManager1.delegate = self;
        locationManager1.desiredAccuracy = kCLLocationAccuracyBest
        locationManager1.requestAlwaysAuthorization()
        locationManager1.startUpdatingLocation()
    }
    
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!)
    {
        var userLocation:CLLocation = locations[0] as! CLLocation
        self.locationManager1.stopUpdatingLocation()
        let long = userLocation.coordinate.longitude;
        let lat = userLocation.coordinate.latitude;
        
        devicelatitude = lat
        devicelongitude = long
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
                
                self.autocmpleteTextfield.text = street as String
               
            }

            })
    }
    
    
    // Resign Firstresponder of UITableview and Keyboard Hiding
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        tableview.hidden = true
        view.endEditing(true)
        //super.touchesBegan(touches, withEvent: event)
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
            self!.autocmpleteTextfield.text = text;self!.iscitytextfieldhavedata = true;self!.view.endEditing(true);
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
       // textField.text = ""
        textField.selectAll(self)
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
        
        
        
//        if autoCompleteStrings != nil
//        {
//            for i in 0..<autoCompleteStrings!.count
//            {
//                let str = autoCompleteStrings![i] as NSString
//                let range = str.rangeOfString(text!, options: .CaseInsensitiveSearch)
//                var attString = NSMutableAttributedString(string: autoCompleteStrings![i], attributes: attrs)
//                attString.addAttributes(autoCompleteAttributes!, range: range)
//                attributedAutoCompleteStrings?.append(attString)
//            }
//        }
        
        
        
        
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
        selectedliqor = selectedCell.textLabel!.text
        
        if iscitytextfieldhavedata == true
        {
        findapubbutton.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        }
        isliqtextfieldhasdata = true
        self.view.endEditing(true)
        tableView.hidden = true
    }

    @IBAction func search(sender: AnyObject)
    {
        
       liqnamefromtextfield = textfield1.text
       trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
       getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(citylat)&long=\(citylong)&km=5&records=15&query=\(trimmedString)")
        
       // getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=28.63875&long=77.07380&km=5&records=4&query=\(trimmedString)")
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
            //vodkasendobj = Restauarantvodka()
            
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
                    //var pint_avg_price2:String = toString(pint_avg_price)
                    fstobj1.minp = pint_avg_price
                }
                if let bottle_avg_price = bottomsUp1["bottle_avg_price"] as? Int
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
                        var OldLocation: CLLocation = CLLocation(latitude: devicelatitude, longitude: devicelongitude)
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
                    //var avg_price2:String = toString(avg_price)
                    vodkaobj.avgprice = avg_price
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

                        vodkaobj.vodkahappystart = happy_hour_start2
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
                        if let res_name = resInfo["res_name"] as? String
                        {
                            vodkaobj.restnamevodka = res_name
                            //vodkasendobj.restnamevodka = res_name
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
                        if var distance = resInfo["distance"] as? String
                        {
                            //28.63875
                            //77.07380
                            var OldLocation: CLLocation = CLLocation(latitude: devicelatitude , longitude: devicelongitude)
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
                   // headervodka.append(vodkasendobj)
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
                destination.getcitylatitude = citylat
                destination.getcitylongitude = citylong
                destination.getrestlatitudebeer = restlat
                destination.getdevicelongitude = restlong
                destination.getselectedliq = selectedliqor
                destination.getfstobj1 = fstobj1
                
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
               // destination1.headfurther = headervodka
                destination1.getcitylatitude = citylat
                destination1.getcitylongitude = citylong
                destination1.getdevicelatitude = devicelatitude
                destination1.getdevicelongitude = devicelongitude
                destination1.getselectedlq = selectedliqor
                destination1.getvodkalatitude = restlat
                destination1.getvodkalongitude = restlong
            }
        }
        if segue.identifier == "mapview"
        {
            if let destination2 = segue.destinationViewController as? mapview
            {
                destination2.getdevicelatitude = devicelatitude
                destination2.getdevicelongitude = devicelongitude
                destination2.getcitylatitude = citylat
                destination2.getcitylongitude = citylong
                destination2.getdevicelatitude = devicelatitude
                destination2.getdevicelongitude = devicelongitude
                destination2.getrestlastmapview = restlat
                destination2.getrestlongitmapview = restlong
                
               // newbeerresult
            }
            
        }
    }
    
    
    @IBAction func getcurrentlocationname(sender: AnyObject)
    {
       autocmpleteTextfield.text = currentlocationname
    }

    @IBAction func nearbar(sender: AnyObject)
    {
        performSegueWithIdentifier("mapview", sender: self)

    }
}
    
    
    
    
    
    

    
    
    



