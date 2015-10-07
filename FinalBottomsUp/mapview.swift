//
//  mapview.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 06/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit
import MapKit


class mapview: UIViewController,MKMapViewDelegate
{

    @IBOutlet weak var myMap: MKMapView!

    override func viewDidLoad()
    {
//        if let url = NSURL(string: "https://www.google.co.in/maps"){
//            UIApplication.sharedApplication().openURL(url)
        
        
        let latitude:CLLocationDegrees = 28.63875
        let longitude: CLLocationDegrees = 77.07380
        
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        myMap.setRegion(region, animated: true)
        
        let Annotation = MKPointAnnotation()
        Annotation.coordinate = location
        Annotation.title = "Aangan Restaurant"
        Annotation.subtitle = "Bar and Restaurant"
        myMap.addAnnotation(Annotation)
    }

}
