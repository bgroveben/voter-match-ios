//
//  AppUser.swift
//  votematch
//
//  Created by Looker, Shawn on 8/14/14.
//  Copyright (c) 2014 CodeForVegas.org. All rights reserved.
//

import Foundation

class AppUser {
    var userId: String
    var address1: String
    var address2: String
    var city: String
    var state: String
    var zipcode: String
    
    init(userId: String, address1: String, address2: String?, city: String, state: String, zipcode: String) {
        self.userId = userId
        self.address1 = address1
        self.address2 = address2!
        self.city = city
        self.state = state
        self.zipcode = zipcode
        
    }
}