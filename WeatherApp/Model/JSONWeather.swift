//
//  JSONWeather.swift
//  WeatherApp
//
//  Created by Екатерина on 02.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import Foundation
class WeatherObject {
    
    var degree:Double?
    var nameCity:String?
    var iconString:String?
    var main:String?
    var describtion:String?
    var code:String?
    
    init(data:Data) throws{
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any] else{
            print("Error of vreating json")
            throw JSONWeatherError.invalidWeatherArray
        }
        code = "\(json["cod"]!)"
        
        if(code != "200"){
            print("Error of code json")
            throw JSONWeatherError.invalidCode
        }
        let dict = (json["weather"] as! NSArray)[0] as! NSDictionary
        main = dict["main"] as? String
        describtion = dict["description"] as? String
        iconString = dict["icon"] as? String
        let mainDict = json["main"] as? NSDictionary
        degree = mainDict!["temp"] as? Double
        nameCity = json["name"] as? String
    }
}
