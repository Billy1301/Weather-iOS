//
//  Location.swift
//  WeatherApp
//
//  Created by Billy on 1/10/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
