//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Billy on 1/10/17.
//  Copyright © 2017 Billy. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let currentDate = dateFormatter.string(from: Date())
        _date = "Today, \(currentDate)"
        
        return _date
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        //Alamofire download
        
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL, method: .get).responseJSON { response in
            
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                // get the name
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
//                    print(self._cityName)
                }
                
                // pull weather type from json
                
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
//                        print(self._weatherType)
                    }
                }
                
                // this is to get tempature
                if let main = dict["main"] as? Dictionary<String, AnyObject> {
                    if let currentTempature = main["temp"] as? Double {
                        
                        let kelvinToFarenheitPreDiv = (currentTempature * (9/5) - 459.67)
                        
                        let kelvinToFarenheit = Double(round(10 * kelvinToFarenheitPreDiv/10))
                        
                        self._currentTemp = kelvinToFarenheit 
//                        print(self._currentTemp)
                    } // if let currentTempature
                } // if let main = dict
            } // if let dict = result.value
            
            //used after bracket  if let dict = result.value
            completed()
        }
        
    }
    
}
