//
//  AutocompleteTextField2.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 23/11/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//
import Foundation
import UIKit

public class AutoCompleteTextField2:UITextField, UITableViewDataSource, UITableViewDelegate
{
    
    //Manages the instance of tableview
    public static var autoCompleteTableView:UITableView?
    /// Holds the collection of attributed strings
    public var attributedAutoCompleteStrings:[NSAttributedString]?
    /// Handles user selection action on autocomplete table view
    public var onSelect:(String, NSIndexPath)->() = {_,_ in}
    /// Handles textfield's textchanged
    public var onTextChange:(String)->() = {_ in}
    
    /// Font for the text suggestions
    public var autoCompleteTextFont = UIFont(name: "MyriadPro-Regular", size: 14)
    /// Color of the text suggestions
    public var autoCompleteTextColor = UIColor.blackColor()
    /// Used to set the height of cell for each suggestions
    public var autoCompleteCellHeight:CGFloat = 44.0
    /// The maximum visible suggestion
    public var maximumAutoCompleteCount = 20
    /// Used to set your own preferred separator inset
    public var autoCompleteSeparatorInset = UIEdgeInsetsZero
    /// Shows autocomplete text with formatting
    public var enableAttributedText = false
    /// User Defined Attributes
    public var autoCompleteAttributes:[String:AnyObject]?
    // Hides autocomplete tableview after selecting a suggestion
    public var hidesWhenSelected = true
    /// Hides autocomplete tableview when the textfield is empty
    var textFieldWidth: CGFloat!
    
    public var superview1: UIView!
    
    func viewDidLoad()
    {
        
        
    }
    public var hidesWhenEmpty:Bool?
        {
        didSet{
            assert(hidesWhenEmpty != nil, "hideWhenEmpty cannot be set to nil")
            self.dynamicType.autoCompleteTableView?.hidden = hidesWhenEmpty!
        }
    }
    /// The table view height
    public var autoCompleteTableHeight:CGFloat?
        {
        didSet
        {
            redrawTable()
        }
    }
    /// The strings to be shown on as suggestions, setting the value of this automatically reload the tableview
    public var autoCompleteStrings:[String]?
        {
        didSet{ reload() }
    }
    
    
    //MARK: - Init
    
    convenience init(frame:CGRect,superview: UIView)
    {
        
        self.init(frame: frame)
        superview1 = superview
        setupAutocompleteTable(superview1)
        
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        commonInit()
        //setupAutocompleteTable(superview!)
    }
    
    required public init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib()
    {
        super.awakeFromNib()
        commonInit()
        setupAutocompleteTable(superview!)
    }
    
    public override func willMoveToSuperview(newSuperview: UIView?)
    {
        super.willMoveToSuperview(newSuperview)
        commonInit()
        //setupAutocompleteTable(newSuperview!)
    }
    
    private func commonInit()
    {
        hidesWhenEmpty = true
        autoCompleteAttributes = [NSForegroundColorAttributeName:UIColor.blackColor()]
        autoCompleteAttributes![NSFontAttributeName] = UIFont(name: "MyriadPro-Regular", size: 11)
        self.clearButtonMode = .Always
        self.addTarget(self, action: "textFieldDidChange", forControlEvents: .EditingChanged)
    }
    
    private func setupAutocompleteTable(view:UIView)
    {
        let screenSize2 = UIScreen.mainScreen().bounds.size
        
        //let tableView1 = UITableView(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y + CGRectGetHeight(self.frame), width: screenSize2.width - 50, height: 30.0))
        //let tableView1 = UITableView(frame: CGRect(x: self.frame.origin.x, y: self.frame.origin.y + CGRectGetHeight(self.frame), width: screenSize2.width - 140, height: 100.0))
        let tableView1 = UITableView(frame: CGRect(x: 0, y: 220, width: screenSize2.width, height: 50.0))
        
        tableView1.layer.masksToBounds = true
        tableView1.layer.borderColor = UIColor( red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0 ).CGColor
        tableView1.layer.borderWidth = 2.0
        //tableView.frame =   CGRectMake(0, 247,375,10);
        
        tableView1.dataSource = self
        tableView1.delegate = self
        tableView1.rowHeight = autoCompleteCellHeight
        tableView1.hidden = hidesWhenEmpty ?? true
        tableView1.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView1)
        self.dynamicType.autoCompleteTableView = tableView1
        autoCompleteTableHeight = 250

    }
    
    //    override public func layoutSubviews()
    //    {
    //        super.layoutSubviews()
    //
    //        let width = CGRectGetWidth(frame)
    //
    //        let someFrame = CGRect(x: 0, y: 205, width: 375, height: 100)
    //        autoCompleteTableView!.frame = someFrame
    //    }
    
    
    
    private func redrawTable()
    {
        if self.dynamicType.autoCompleteTableView != nil
        {
            var newFrame = self.dynamicType.autoCompleteTableView!.frame
            newFrame.size.height = autoCompleteTableHeight!
            self.dynamicType.autoCompleteTableView!.frame = newFrame
        }
    }
    
    //MARK: - UITableViewDataSource
    public func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return autoCompleteStrings != nil ? (autoCompleteStrings!.count > maximumAutoCompleteCount ? maximumAutoCompleteCount : autoCompleteStrings!.count) : 0
    }
    
    public func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cellIdentifier = "autocompleteCellIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if cell == nil
        {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        
        if enableAttributedText
        {
            cell!.textLabel!.attributedText = attributedAutoCompleteStrings![indexPath.row]
            println(cell!.textLabel!.attributedText = attributedAutoCompleteStrings![indexPath.row])
        }
        else
        {
            cell?.textLabel?.font = autoCompleteTextFont
            cell?.textLabel?.textColor = autoCompleteTextColor
            cell?.textLabel?.text = autoCompleteStrings![indexPath.row]
            println(cell?.textLabel?.text = autoCompleteStrings![indexPath.row])
        }
        
        return cell!
        
    }
    
    //MARK: - UITableViewDelegate
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        onSelect(cell!.textLabel!.text!, indexPath)
        
        println(cell)
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            
            tableView.hidden = self.hidesWhenSelected
        })
    }
    
    public func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if cell.respondsToSelector("setSeparatorInset:")
        {
            cell.separatorInset = autoCompleteSeparatorInset
        }
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:")
        {
            cell.preservesSuperviewLayoutMargins = false
        }
        if cell.respondsToSelector("setLayoutMargins:")
        {
            cell.layoutMargins = autoCompleteSeparatorInset
        }
    }
    
    public func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return autoCompleteCellHeight
    }
    
    //MARK: - Private Interface
    private func reload()
    {
        if enableAttributedText
        {
            let attrs = [NSForegroundColorAttributeName:autoCompleteTextColor, NSFontAttributeName:UIFont.systemFontOfSize(12.0)]
            if attributedAutoCompleteStrings == nil
            {
                attributedAutoCompleteStrings = [NSAttributedString]()
            }
            else
            {
                if attributedAutoCompleteStrings?.count > 0
                {
                    attributedAutoCompleteStrings?.removeAll(keepCapacity: false)
                }
            }
            
            if autoCompleteStrings != nil
            {
                for i in 0..<autoCompleteStrings!.count
                {
                    let str = autoCompleteStrings![i] as NSString
                    let range = str.rangeOfString(text!, options: .CaseInsensitiveSearch)
                    var attString = NSMutableAttributedString(string: autoCompleteStrings![i], attributes: attrs)
                    attString.addAttributes(autoCompleteAttributes!, range: range)
                    attributedAutoCompleteStrings?.append(attString)
                }
            }
        }
        self.dynamicType.autoCompleteTableView?.reloadData()
    }
    
    //MARK: - Internal
    func textFieldDidChange(){
        onTextChange(text!)
        if text!.isEmpty{ autoCompleteStrings = nil }
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.dynamicType.autoCompleteTableView?.hidden =  self.hidesWhenEmpty! ? self.text!.isEmpty : false
        })
    }
}