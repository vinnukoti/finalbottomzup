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
    var liqobjvodka = liqvodka()
    
    var restnamevodka:String!
    var avgprice:String!
    var distancevodka:String!
    
    var vodkaarray:[liqvodka] = [liqvodka]()
    var further:[liqvodka] = [liqvodka]()
    
    init()
    {
        liqobjvodka = liqvodka()
        
        restnamevodka = String()
        avgprice = String()
        distancevodka = String()
        
        vodkaarray = [liqvodka]()
    }
    


}