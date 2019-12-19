//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Nikita Vesna on 19.12.2019.
//  Copyright © 2019 Nikita Vesna. All rights reserved.
//

import Foundation
import UIKit

struct CurrentWeather {
    let temperature: Double
    let appearentTemperature: Double
    let humidity: Double
    let pressure: Double
    let icon: UIImage
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure))mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity))%"
    }
    
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    
    var appearentTemperatureString: String {
        return "Feels like: \(Int(appearentTemperature))˚C"
    }
}
