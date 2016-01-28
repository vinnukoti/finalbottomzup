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


class results1: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLConnectionDataDelegate,CLLocationManagerDelegate,UIWebViewDelegate
{
    var getselectedcityname:String!
    
    var head1:[Restaurant] = [Restaurant]()
    var fstobj1 = Restaurant()
    
    
    var citylat:Double!
    var citylong:Double!
    var variable:String!
    var trimmedString:String!
    var liqnamefromtextfield:String!
    var check:String!
    
    var newarar =  [String]()
    var arraysring = [String]()

    
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
    
    var liqTypes: [String] = ["Beer", "Rum", "whiskey","Vodka"]
    var liqTypetableview: UITableView  =   UITableView()
    
   // var liqTypes1:[String] = ["BUDWEISER","CARLSBERG","FOSTERS","HEINEKEN","KINGFISHER"]
    var liqTypes1:[String] = [String]()
    
    var delhi = "Delhi"
    
    var mainlocalityfromtextfield:String!
    
    var currentLocationname:String!
    
    var currentLocation = "Current Location"
     var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 100, 100)) as UIActivityIndicatorView
   // var indicatorview = UIView()
    var PleaseWaitlabel = UILabel()
    var space = " "
    var searchedin = "Searched in"
    var forliqtype = "For liquor"


    override func viewDidLoad()
    {
  
        // All done!
        
        println(autocompletedTextfieldnew.text)


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
       

        
        
        LOcalityTableview.frame         =   CGRectMake(15,self.localityTextfield.frame.origin.y + 30, self.view.frame.width - 30, 165);
        LOcalityTableview.delegate      =   self
        LOcalityTableview.dataSource    =   self
        LOcalityTableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
       // LOcalityTableview
        self.view.addSubview(LOcalityTableview)
        LOcalityTableview.hidden = true
        
        liqTypetableview.frame         =   CGRectMake(15,self.beerTypeTextfield.frame.origin.y + 40, self.view.frame.width - 30, 165);
        liqTypetableview.delegate      =   self
        liqTypetableview.dataSource    =   self
        liqTypetableview.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(liqTypetableview)
        liqTypetableview.hidden = true
        
         println(autocompletedTextfieldnew.text)
        
        


    }


    
    
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
                    self.autocompletedTextfieldnew.text = self.currentLocation
                    self.PleaseWaitlabel.hidden = true
                    self.actInd.stopAnimating()
                    self.actInd.hidden = true
                    println(locality)
                    self.localityTextfield.text = locality
                    
                    
                    println(self.autocompletedTextfieldnew.text)
                }
            }

            
           
        })
    }
    
    
    // Resign Firstresponder of UITableview and Keyboard Hiding
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        tableviewnew.hidden = true
        textfield2.enabled = true
        localityTextfield.enabled = true
        LOcalityTableview.hidden = true
        beerTypeTextfield.enabled = true
        liqTypetableview.hidden = true
        
        view.endEditing(true)
        //super.touchesBegan(touches, withEvent: event)
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
        
        
//        auocompletetextfieldsublocality.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
//        auocompletetextfieldsublocality.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 14.0)
//        auocompletetextfieldsublocality.autoCompleteCellHeight = 35.0
//        auocompletetextfieldsublocality.maximumAutoCompleteCount = 20
//        auocompletetextfieldsublocality.hidesWhenSelected = true
//        auocompletetextfieldsublocality.hidesWhenEmpty = true
//        auocompletetextfieldsublocality.enableAttributedText = true
//        var attributes1 = [String:AnyObject]()
//        attributes[NSForegroundColorAttributeName] = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
//        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Light", size: 14.0)
//        auocompletetextfieldsublocality.autoCompleteAttributes = attributes
        
        
        
        
    }
    
    
    //city Textfield
    private  func handleTextFieldInterfaces()
    {
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
                    let urlString = "https://maps.googleapis.com/maps/api/place/autocomplete/json?key=AIzaSyC45IqTyfdeO5SzyLDGAVWiwADSSv70S6g&input={\(self!.localityTextfield.text)}\(text)&types=(regions)&components=country:IN"
                    let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
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
          
            self!.autocompletedTextfieldnew.text = text;self!.iscitytextfieldhavedata = true;self!.view.endEditing(true);self!.getselectedcityname = text
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
                       // var locations1 = [String]()
                        for dict in predictions as! [NSDictionary]
                        {
                            locations.append(dict["description"] as! String)
                           // locations1.append(dict["description"] as! String)
                          
                        }
                        println(locations)
                        
                        for var i = 0; i < locations.count ;i++
                        {
                            var newlaocations = locations[i]
                            var fullNameArr = split(newlaocations) {$0 == ","}
                            var firstName: String = fullNameArr[0]
                          //  var lastName: String = fullNameArr[1]
                            
                          //  println(firstName)
                           // println(lastName)
                            locations[i] =  firstName
        
                        }

       
                        
                        
                        self.autocompletedTextfieldnew.autoCompleteStrings = locations
                  
     
                    }
                }
                else{
                    self.autocompletedTextfieldnew.autoCompleteStrings = nil
                    
                   // self.auocompletetextfieldsublocality.autoCompleteStrings = nil
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
        
        // Textfield2
        if textField.tag == 1
        {
            //textfield2.enabled = false
            textfield2.enabled = false
            
           // getbardata("http://demos.dignitasdigital.com/bottomzup/radmin/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=15&query=\(trimmedString)")
            println(beerTypefromtextfield)
            if CheckforInternetViewController.isConnectedToNetwork() == true
            {
                print("Internet connection OK")
                getliqtypes("http://demos.dignitasdigital.com/bottomzup/get_brandmaster_for_category.php?category=\(beerTypeTextfield.text)")
               
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
            localityTextfield.enabled = false
             textField.selectAll(self)
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
//    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
//    {
//        if textField.tag == 7
//        {
//            return false; //do not show keyboard nor cursor
//        }
//        else
//        {
//            return true
//        }
//        
//    }
    
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
            
            return cell
  
        }
        
        else if tableView.tag == 6
        {
            var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
            
             cell.textLabel?.text = self.liqTypes[indexPath.row]
             cell.textLabel!.font = UIFont(name: "MyriadPro-Regular", size:14)
            
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
           // autocompletedTextfieldnew.userInteractionEnabled = true
            localityTextfield.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            localityTextfield.text = selectedCell1.textLabel?.text
            localityfromtextfield = localityTextfield.text
            println(localityfromtextfield)
            self.view.endEditing(true)
            tableView.hidden = true
        }
        // liqatable view
        else if tableView.tag == 5
        {
            textfield2.enabled = true
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            textfield2.text = selectedCell1.textLabel?.text
            selectedliqor = selectedCell1.textLabel?.text
            isliqtextfieldhasdata = true
            self.view.endEditing(true)
            tableView.hidden = true
        }
            
        // Liq type table view
        else if tableView.tag == 6
        {
            textfield2.text = "All"
            beerTypeTextfield.enabled = true
            println("You selected cell #\(indexPath.row)!")
            let selectedCell1 : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
            beerTypeTextfield.text = selectedCell1.textLabel?.text
            beerTypefromtextfield = beerTypeTextfield.text
            println(beerTypefromtextfield)
            self.view.endEditing(true)
            tableView.hidden = true
            
        }
 
        
    
    }
    @IBAction func searchnew(sender: UIButton)
    {
        
        let tracker = GAI.sharedInstance().defaultTracker
        if textfield2.text == "All"
        {
          let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(searchedin  + space + localityTextfield.text + space + autocompletedTextfieldnew.text)",action: "\(forliqtype + space + beerTypeTextfield.text)",label: "\(localityTextfield.text + autocompletedTextfieldnew.text)", value: nil).build()
              tracker.send(eventTracker as! [NSObject : AnyObject])
        }
        else
        {
           let eventTracker: NSObject = GAIDictionaryBuilder.createEventWithCategory("\(searchedin + space + localityTextfield.text + space + autocompletedTextfieldnew.text)",action: "\(forliqtype + space + textfield2.text)",label: "\(localityTextfield.text + space + autocompletedTextfieldnew.text)", value: nil).build()
              tracker.send(eventTracker as! [NSObject : AnyObject])
        }
        
        
        
        
      
        liqnamefromtextfield = textfield2.text
    
        
        
        
        trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
        println(localityfromtextfield)
        println(autocompletedTextfieldnew.text)
        
        var text = autocompletedTextfieldnew.text
        var locate = localityTextfield.text + text
        println(autocompletedTextfieldnew.text)
        println(localityfromtextfield)
        
        
        println(locate)
       var locate1 = locate.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        println(locate1)
        
        if autocompletedTextfieldnew.text == currentLocation
        {
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(devicelatitude)&long=\(devicelongitude)&km=2&records=15&query=\(beerTypeTextfield.text)")
        }
        
        getgoogledata("http://maps.google.com/maps/api/geocode/json?address=\(locate1)&sensor=false")
        
        
        
        
       //  getgoogledata("http://maps.google.com/maps/api/geocode/json?address=delhi%20connaught%20place&sensor=false")
        
      //  println(trimmedString)
        
      
        
  
        
        //getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=5&records=10&query=\(trimmedString)")
        
        // getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=28.63875&long=77.07380&km=5&records=4&query=\(trimmedString)")
        //28.63875
        //77.07380
    }
//
//    @IBAction func search(sender: AnyObject)
//    {
//        
//        liqnamefromtextfield = textfield2.text
//        trimmedString = liqnamefromtextfield.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
//        getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=\(citylat)&long=\(citylong)&km=5&records=15&query=\(trimmedString)")
//        //getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=5&records=10&query=\(trimmedString)")
//        
//        // getbardata("http://demos.dignitasdigital.com/bottomzup/searchresult.php?lat=28.63875&long=77.07380&km=5&records=4&query=\(trimmedString)")
//        //28.63875
//        //77.07380
//    }
    
    
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
                                    println(citylat)
                                }
                                if let lng = location["lng"] as? Double
                                {
                                    citylong = lng
                                    println(citylong)
                                }
                                
                                ApiCall()
                                
                           // }
                        }
                    }
                }
            }
            
         }
        
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
        
      if let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as? NSArray
        
               //let json = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSArray
        
      {
            head1 = [Restaurant]()
            header = [Restauarantvodka]()
            arraysring = [String]()
            for var index = 0; index < json.count; ++index
            {
                fstobj1 = Restaurant()
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
                            println(pint_avg_price)
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
                                arraysring.append(res_name)
                                println(arraysring.first)
                                
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
                                println(devicelatitude)
                                println(devicelongitude)
                              //  var OldLocation: CLLocation = CLLocation(latitude: 28.63875, longitude: 77.07380)
                                var newLocation: CLLocation = CLLocation(latitude: restlat, longitude: restlong)
                                println(restlat)
                                println(restlong)
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
                        head1.append(fstobj1)
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
                                vodkaobj.distancevodka = totalDistance1 + "Km."
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
            if check == "Beer"
            {
                
                self.performSegueWithIdentifier("getbeernew", sender: self)
            }
            else
            {
                self.performSegueWithIdentifier("getvodkanew", sender: self)
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
        if segue.identifier == "getbeernew"
        {
            if let destination = segue.destinationViewController as? tableviewclass
            {
                //28.63875
                //77.07380
                destination.liqname = textfield2.text
                var liqname = textfield2.text
//                let trimmedString = liqname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
//                destination.liqname = trimmedString
//                destination.newtrimmedstring = trimmedString
                destination.head = head1
         
                destination.beerTypefromtextfield = beerTypefromtextfield
                destination.selectedliqor = textfield2.text
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
                destination.liqtypefromTextfield = beerTypeTextfield.text
                destination.localityFromtextfield = localityTextfield.text
                destination.citylatitudefFomresult = citylat
                destination.citylongitudeFromresult = citylong
                destination.liqtypeFromresult = beerTypeTextfield.text
                destination.liqFromresult = textfield2.text
            }
        }
        if segue.identifier == "getvodkanew"
        {
            if let destination1 = segue.destinationViewController as? tableviewclassvodka
            {
                destination1.liqvodkaname = textfield2.text
                var liqvodkaname = textfield2.text
                let trimmedString = liqvodkaname.stringByReplacingOccurrencesOfString("\\s", withString: "%20", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
                destination1.liqvodkaname = trimmedString
                
                destination1.header1 = header
                destination1.newtrimmedstring = trimmedString
                destination1.beerTypefromtextfield = beerTypefromtextfield
//                destination1.getcitylatitude = citylat
//                destination1.getcitylongitude = citylong
                destination1.getdevicelatitude = devicelatitude
                destination1.getdevicelongitude = devicelongitude
                destination1.selectedliqor = textfield2.text
                destination1.getvodkalatitude = restlat
                destination1.getvodkalongitude = restlong
                destination1.getselectedcityname = getselectedcityname
                destination1.locationnamefromtextfield = autocompletedTextfieldnew.text
                println(autocompletedTextfieldnew.text)
                destination1.liqtypefromTextfield = beerTypeTextfield.text
                destination1.localityFromtextfield = localityTextfield.text
                
                destination1.citylatitudefFomresult = citylat
                destination1.citylongitudeFromresult = citylong
                destination1.liqtypeFromresult = beerTypeTextfield.text
                destination1.liqFromresult = textfield2.text
            }
        }
        if segue.identifier == "getwinenearyou"
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
  
        
        
        if trimmedString == "All"
        {
            println(citylat)
            println(citylong)
            println(trimmedString)
            println(beerTypeTextfield.text)
            var name  = beerTypeTextfield.text
            var name1 =  name.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            println(name1)
            
            println(name)
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=15&query=\(name1)")
        }
        else
        {
            println(citylat)
            println(citylong)
            println(trimmedString)
            getbardata("http://demos.dignitasdigital.com/bottomzup/searchresultV2.php?lat=\(citylat)&long=\(citylong)&km=2&records=15&query=\(trimmedString)")
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













