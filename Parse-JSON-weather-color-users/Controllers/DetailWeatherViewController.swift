//
//  DetailWeatherViewController.swift
//  Parse-JSON-weather-color-users
//
//  Created by Liana Norman on 8/27/19.
//  Copyright © 2019 Liana Norman. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var weatherStatusLabel: UILabel!
    
    var cityWeather: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        currentTempLabel.text = "Celcius: \(cityWeather.main.temp.description)"
        weatherStatusLabel.text = cityWeather.weather[0].description
        
    }

}
