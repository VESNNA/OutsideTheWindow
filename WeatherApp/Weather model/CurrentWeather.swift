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
    //let icon: UIImage
}

extension CurrentWeather: JSONDecodable {
    init?(JSON: [String: AnyObject]) {
        guard let main = JSON["main"] as? NSDictionary,
            
            let temperature = main["temp"] as? Double,
            let apparentTemperature = main["feels_like"] as? Double,
            let humidity = main["humidity"] as? Double,
            let pressure = main["pressure"] as? Double else {
                return nil
        }
        
        //let iconString = JSON["icon"] as? String
        
        //let icon = WeatherIconManager(rawValue: iconString).image
        
        self.temperature = temperature
        self.apparentTemperature = apparentTemperature
        self.humidity = humidity
        self.pressure = pressure
        //self.icon = icon
    }
}

extension CurrentWeather {
    var pressureString: String {
        return "\(Int(pressure * 0.750062))mm"
    }
    
    var humidityString: String {
        return "\(Int(humidity * 100))%"
    }
    
    var temperatureString: String {
        return "\(Int(5 / 9 * (temperature - 32)))˚C"
    }
    
    var apparentTemperatureString: String {
        return "Feels like: \(Int(5 / 9 * (apparentTemperature - 32)))˚C"
    }
}
