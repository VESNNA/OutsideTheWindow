//
//  ViewController.swift
//  WeatherApp
//
//  Created by Nikita Vesna on 19.12.2019.
//  Copyright © 2019 Nikita Vesna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var humidityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var apparentTempLbl: UILabel!
    @IBOutlet weak var refreshBtn: UIButton!
    
    @IBAction func refreshBtnPressed(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let icon = WeatherIconManager.Rain.image
        let currentWeather = CurrentWeather(temperature: 10.0, apparentTemperature: 5.0, humidity: 30, pressure: 750, icon: icon)
        updateUIWith(currentWeather: currentWeather)
    }

    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLbl.text = currentWeather.pressureString
        self.temperatureLbl.text = currentWeather.temperatureString
        self.apparentTempLbl.text = currentWeather.apparentTemperatureString
        self.humidityLbl.text = currentWeather.humidityString
    }

}


