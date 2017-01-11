//
//  Constants.swift
//  WeatherApp
//
//  Created by Billy on 1/10/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "139d66bbc6fd309024eb2e7d1ceb69362a0"

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)-36\(LONGITUDE)123\(APP_ID)\(API_KEY)"
