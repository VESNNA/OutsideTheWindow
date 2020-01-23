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
        //toggleActivityIndicator(active: true)
        getCurrentWeatherData()
    }
    
    /* Activity inicator on downloading
    func toggleActivityIndicator(active: Bool) {
        refreshBtn.isEnabled = active
        if active {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    */
    
    lazy var weatherManager = APIWeatherManager(apiKey: "8ed4a42d3c54264f52124709334fd797")
    let coordinates = Coordinates(latitude: 55.754030, longitude: 37.620768)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentWeatherData()
    }
    
    func getCurrentWeatherData() {
        weatherManager.fetchCurrentWeatherWith(coordinates: coordinates) { (result) in
            
            //self.toggleActivityIndicator(active: false)
            
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
        
        //self.imageView.image = currentWeather.icon
        pressureLbl.text = currentWeather.pressureString
        temperatureLbl.text = currentWeather.temperatureString
        apparentTempLbl.text = currentWeather.apparentTemperatureString
        humidityLbl.text = currentWeather.humidityString
        locationLbl.text = currentWeather.location
    }
    
}


