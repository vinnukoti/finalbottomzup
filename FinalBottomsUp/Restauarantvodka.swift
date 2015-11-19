//
//  Restauarantvodka.swift
//  Bottomzup
//
//  Created by Appsriv Technologies on 08/10/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import UIKit

class Restauarantvodka
{
    var bool1 = false
    var liqobjvodka = liqvodka()
    
    var restnamevodka:String!
    var avgprice:Int!
    var distancevodka:String!
    var vodkahappystart: String!
    var vodkahappyend: String!
    var vodkaishappy: String!
    
    var vodkaarray:[liqvodka] = [liqvodka]()
    var vodkasendarray:[liqvodka] = [liqvodka]()
    var further:[liqvodka] = [liqvodka]()
    
    var Restaurantlatitudevodka: Double!
    var Restaurantlongitudevodka: Double!
    
    init()
    {
        liqobjvodka = liqvodka()
        bool1 = false
        restnamevodka = String()
        avgprice = Int()
        distancevodka = String()
        
        vodkahappystart = String()
        vodkahappyend = String()
        vodkaishappy = String()
        
        vodkaarray = [liqvodka]()
        vodkasendarray = [liqvodka]()
        
        Restaurantlatitudevodka = Double()
        Restaurantlongitudevodka = Double()
        
        
    }
    


}
