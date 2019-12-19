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
    
    lazy var weatherManager = APIWeatherManager(apiKey: "d157c9719cdbab4ff40e1975f14f511a")
    let coordinates = Coordinates(latitude: 55.754030, longitude: 37.620768)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            switch result {
            case .Success(let currentWeather):
                self.updateUIWith(currentWeather: currentWeather)
            case .Failure(let error as NSError):
                
                let alertController = UIAlertController(title: "Unable to get data ", message: "\(error.localizedDescription)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func updateUIWith(currentWeather: CurrentWeather) {
        
        self.imageView.image = currentWeather.icon
        self.pressureLbl.text = currentWeather.pressureString
        self.temperatureLbl.text = currentWeather.temperatureString
        self.apparentTempLbl.text = currentWeather.apparentTemperatureString
        self.humidityLbl.text = currentWeather.humidityString
    }
    
}


