//
//  newView.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 08/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//


import UIKit



class newView:ViewController
{
    
   
//    
//    @IBOutlet weak var autocompleteTextfield: AutoCompleteTextField!
//  
//    @IBOutlet weak var mapView: MKMapView!
    
//    private let googleMapsKey = "AIzaSyD8-OfZ21X2QLS1xLzu1CLCfPVmGtch7lo"
//    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
//   
//   
    
//    private var responseData:NSMutableData?
//    private var selectedPointAnnotation:MKPointAnnotation?
//    private var connection:NSURLConnection?
//    
//

    
    
    override func viewDidLoad()
    {
        liqurData("http://demos.dignitasdigital.com/bottomzup/liquors.php?find=bu")
//        configureTextField()
//        handleTextFieldInterfaces()
    }
    
    func liqurData(urlString:String!)
    {
        let url = NSURL(string: urlString)
        let request = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {(response, data, error) in
            if (error == nil)
            {
                println(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                
                self.getliqurdata(data)
                
            }
        }
    }
   
    func getliqurdata(bardata: NSData)
    {
        var jsonError:NSError?
        
        let json = NSJSONSerialization.JSONObjectWithData(bardata, options: nil, error: &jsonError) as! NSArray
        
        if let bottomsUp = json[0] as? NSDictionary
        {
          if let liquors = bottomsUp["liquors"] as? String
        {
            println("The liq is : " + liquors)
        }
        }
        
        
        if let bottomsUp = json[1] as? NSDictionary
        {
            if let liquors = bottomsUp["liquors"] as? String
            {
                println("The liq is : " + liquors)
            }
        }
    }
 
    
    
    
//    private func configureTextField()
//    {
//        autocompleteTextfield.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
//        autocompleteTextfield.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)
//        autocompleteTextfield.autoCompleteCellHeight = 35.0
//        autocompleteTextfield.maximumAutoCompleteCount = 20
//        autocompleteTextfield.hidesWhenSelected = true
//        autocompleteTextfield.hidesWhenEmpty = true
//        autocompleteTextfield.enableAttributedText = true
//        var attributes = [String:AnyObject]()
//        attributes[NSForegroundColorAttributeName] = UIColor.blackColor()
//        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
//        autocompleteTextfield.autoCompleteAttributes = attributes
//    }
//    
//    private func handleTextFieldInterfaces()
//    {
//        autocompleteTextfield.onTextChange = {[weak self] text in
//            if !text.isEmpty{
//                if self!.connection != nil
//                {
//                    self!.connection!.cancel()
//                    self!.connection = nil
//                }
//                let urlString = "\(self!.baseURLString)?key=\(self!.googleMapsKey)&input=\(text)"
//                let url = NSURL(string: urlString.stringByAddingPercentEscapesUsingEncoding(NSASCIIStringEncoding)!)
//                if url != nil{
//                    let urlRequest = NSURLRequest(URL: url!)
//                    self!.connection = NSURLConnection(request: urlRequest, delegate: self)
//                }
//            }
//        }
//        
//        autocompleteTextfield.onSelect = {[weak self] text, indexpath in
//            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
//                if placemark != nil{
//                    let coordinate = placemark!.location.coordinate
//                    self!.addAnnotation(coordinate, address: text)
//                    self!.mapView.setCenterCoordinate(coordinate, zoomLevel: 12, animated: true)
//                }
//            })
//        }
//    }
//    
//    
//    //MARK: NSURLConnectionDelegate
//    func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
//        responseData = NSMutableData()
//    }
//    
//    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
//        responseData?.appendData(data)
//    }
//    
//    func connectionDidFinishLoading(connection: NSURLConnection)
//    {
//        if responseData != nil
//        {
//            var error:NSError?
//            if let result = NSJSONSerialization.JSONObjectWithData(responseData!, options: nil, error: &error) as? NSDictionary
//            {
//                let status = result["status"] as? String
//                if status == "OK"
//                {
//                    if let predictions = result["predictions"] as? NSArray{
//                        var locations = [String]()
//                        for dict in predictions as! [NSDictionary]{
//                            locations.append(dict["description"] as! String)
//                        }
//                        self.autocompleteTextfield.autoCompleteStrings = locations
//                    }
//                }
//                else{
//                    self.autocompleteTextfield.autoCompleteStrings = nil
//                }
//            }
//        }
//    }
//    
//    func connection(connection: NSURLConnection, didFailWithError error: NSError)
//    {
//        println("Error: \(error.localizedDescription)")
//    }
//    
//    //MARK: Map Utilities
//    private func addAnnotation(coordinate:CLLocationCoordinate2D, address:String?)
//    {
//        if selectedPointAnnotation != nil
//        {
//            mapView.removeAnnotation(selectedPointAnnotation)
//        }
//        
//        selectedPointAnnotation = MKPointAnnotation()
//        selectedPointAnnotation?.coordinate = coordinate
//        selectedPointAnnotation?.title = address
//        mapView.addAnnotation(selectedPointAnnotation)
//    }
//
//    
    

}



