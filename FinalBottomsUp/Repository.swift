//
//  Repo.swift
//  FinalBottomsUp
//
//  Created by Appsriv Technologies on 16/09/15.
//  Copyright (c) 2015 Appsriv Technologies. All rights reserved.
//

import Foundation

import UIKit


class Repository
{
    
    var res_name: String?
    var distance: String?
    var res_liq_brand_price: String?
    
    init(json: NSDictionary)
    {
        self.res_name = json["res_name"] as? String
        self.distance = json["distance"] as? String
        self.res_liq_brand_price = json["res_liq_brand_price"] as? String
    }
}