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
    let apparentTemperature: Double
    let humidity: Double
    let pressure: Double
    let location: String
    //let icon: UIImage
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String: AnyObject]) {
        guard let main = JSON["main"] as? NSDictionary,
            
            let temperature = main["temp"] as? Double,
            let apparentTemperature = main["feels_like"] as? Double,
            let humidity = main["humidity"] as? Double,
            let pressure = main["pressure"] as? Double,
            let location = JSON["name"] as? String else {
                return nil
        }
        
        //let iconString = JSON["icon"] as? String
        
        //let icon = WeatherIconManager(rawValue: iconString).image
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.pressure = pressure
        self.location = location
        //self.icon = icon
    }
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure * 0.750062))mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity))%"
    }
    
    var temperatureString: String {
        return "\(Int(temperature))˚C"
    }
    
    var apparentTemperatureString: String {
        return "Feels like: \(Int(apparentTemperature))˚C"
    }
}
