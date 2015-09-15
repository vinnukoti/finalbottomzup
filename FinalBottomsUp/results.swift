//
//  results.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 10/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

var variable:String!


class results: UIViewController,UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate,NSURLConnectionDataDelegate


{
   
    @IBOutlet weak var autocmpleteTextfield: AutoCompleteTextField!
    
    @IBOutlet weak var textfield1: UITextField!
   
    @IBOutlet weak var tableview: UITableView!
    
    private var responseData:NSMutableData?
   //private var selectedPointAnnotation:MKPointAnnotation?
    private var connection:NSURLConnection?
    
    private let googleMapsKey = "AIzaSyAmC9Bxbw-8M-6ppbty3ArFP7u2t97KKMY"
    private let baseURLString = "https://maps.googleapis.com/maps/api/place/autocomplete/json"

    //var pastUrls = ["Beer","Budviser","Vinayak"]
    var autocompleteUrls = [String]()
    
    var arar = [""]
    var newarar = [""]
    
    var yes: Bool!


    
    override func viewDidLoad()
    {
        textfield1.delegate = self
        tableview!.delegate = self
        tableview!.dataSource = self
        tableview!.scrollEnabled = true
        tableview!.hidden = true
       // autocmpleteTextfield.delegate = self
        configureTextField()
        handleTextFieldInterfaces()
        
    }
    
    private func configureTextField()
    {
        autocmpleteTextfield.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        autocmpleteTextfield.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)
        autocmpleteTextfield.autoCompleteCellHeight = 35.0
        autocmpleteTextfield.maximumAutoCompleteCount = 20
        autocmpleteTextfield.hidesWhenSelected = true
        autocmpleteTextfield.hidesWhenEmpty = true
        autocmpleteTextfield.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor.blackColor()
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        autocmpleteTextfield.autoCompleteAttributes = attributes
    }
    
    private func handleTextFieldInterfaces()
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
            Location.geocodeAddressString(text, completion: { (placemark, error) -> Void in
                if placemark != nil{
                    let coordinate = placemark!.location.coordinate
                                        println(coordinate.latitude)
                                        println(coordinate.longitude)
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
                    if let predictions = result["predictions"] as? NSArray{
                        var locations = [String]()
                        for dict in predictions as! [NSDictionary]{
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
    
    

    func textFieldDidBeginEditing(textField: UITextField)
    {
            
        textField.addTarget(self, action: "textFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
     
    }
    
    func textFieldDidChange(textField: UITextField)
    {
        if textField.text != nil && textField.text != ""
        {
           
            var s = textField.text
            variable = s
            variable.startIndex
            
           // println(variable)
            
           
            
            let url = NSURL(string: "http://demos.dignitasdigital.com/bottomzup/liquors.php?find=\(variable)")
            
            let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {(data, response, error) in
                // println(NSString(data: data, encoding: NSUTF8StringEncoding)!)
                self.setLabels(data)
                
//                autocompleteTableView.hidden = sender.text.isEmpty
//                filteredWords = dataManager.getFilteredWords(sender.text)
//                refreshUI()
            }
            
            task.resume()
            
        }
    }


// Autocomplete
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
       
        tableview!.hidden = false
        var substring = (self.textfield1.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        substring.lowercaseString
        searchAutocompleteEntriesWithSubstring(substring)
        return true
    }
    
    func searchAutocompleteEntriesWithSubstring(substring: String)
    {
        autocompleteUrls.removeAll(keepCapacity: false)
        println(substring)
        
        
        
        
        for curString in newarar
        {
            println(curString)
            var myString: NSString! = curString as NSString
            var substringRange: NSRange! = myString.rangeOfString(substring)
            if (substringRange.location == 0)
            {
                
                autocompleteUrls.append(curString)
                
            }
            
        }
        
        tableview!.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return autocompleteUrls.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let autoCompleteRowIdentifier = "AutoCompleteRowIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(autoCompleteRowIdentifier) as? UITableViewCell
        if let tempo1 = cell
        {
            let index = indexPath.row as Int
            cell!.textLabel!.text = autocompleteUrls[index]
            return cell!
        }
            
        else
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: autoCompleteRowIdentifier)
        }
         return cell!
     }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let selectedCell : UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        textfield1.text = selectedCell.textLabel!.text
        tableView.hidden = true
    }

    
    @IBAction func go(sender: UIButton)
    {
       
        performSegueWithIdentifier("restaurant", sender: self)
        
    }
    
    
    func setLabels(weatherData: NSData)
    {
        var jsonError:NSError?
        
      if (NSJSONSerialization.JSONObjectWithData(weatherData, options: nil, error: &jsonError) as? NSDictionary != nil)
      {
  
     }
        else
      {
        let json = NSJSONSerialization.JSONObjectWithData(weatherData, options: nil, error: &jsonError) as! NSArray
          for var index = 0; index < json.count; ++index
             {
             if let bottomsUp = json[index] as? NSDictionary
              {
             if let liquors = bottomsUp["liquors"] as? String
                {
                 arar.append(liquors)
                 newarar = removeDuplicates(arar)
                 println(newarar)
                    
              }
             }
           }
        }
     
    }
    
    
    
    
    func removeDuplicates(array: [String]) -> [String]
    {
        var encountered = Set<String>()
        var result: [String] = []
        for value in array {
            if encountered.contains(value)
            {
                // Do not add a duplicate element.
            }
            else
            {
                // Add value to the set.
                encountered.insert(value)
                // ... Append the value.
                result.append(value)
            }
        }
        return result
    }


}
