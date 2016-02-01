//
//  Restaurant.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 29/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit



class Restaurant
{
    var bool = false
    var two = liqclass()
    var color = false
    
    var restname:String!
    var minp:Int!
    var maxp:Int!
    var distance:String!
    var happystart:String!
    var happyend:String!
    var ishappy:String!
    var rest_offers_happy_hour:String!
    var Restaurantlatitude: Double!
    var Restaurantlongitude: Double!
    var Place:String!
    var Phoneone:String!
    var Phonetwo:String!
    var restaddress:String!
    
    
    var amp:[liqclass] = [liqclass]()
    var further:[liqclass] = [liqclass]()
    
    init()
    {
        two = liqclass()
        
        Place = String()
        restname = String()
        minp = Int()
        maxp = Int()
        distance = String()
        happystart = String()
        happyend = String()
        ishappy = String()
        rest_offers_happy_hour = String()
        
        amp = [liqclass]()
        Phoneone = String()
        Phonetwo = String()
        restaddress = String()
        
        Restaurantlatitude = Double()
        Restaurantlongitude = Double()
    }


}
