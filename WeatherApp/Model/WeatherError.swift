//
//  WeatherErroe.swift
//  WeatherApp
//
//  Created by Екатерина on 02.07.2018.
//  Copyright © 2018 Екатерина. All rights reserved.
//

import Foundation

enum JSONWeatherError: Error{
    case invalidCode
    case invalidWeatherArray
}
