//
//  DailyCityForecastTableViewCell.swift
//  Weather App
//
//  Created by Itzik Bar-Noy on 08/06/2020.
//  Copyright © 2020 Itzik Bar-Noy. All rights reserved.
//

import UIKit

class DailyCityForecastTableViewCell: UITableViewCell {

    // MARK: Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minMaxLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: Properties
    static let identifier = "DailyCityForecastCell"
    
    // MARK: Functions
    public func configureCell(city: City) {
        cityNameLabel.text = city.name
        descriptionLabel.text = city.weather?[0].weatherDescription
        iconImageView.image = UIImage(named: city.weather?[0].icon ?? "")
        
        guard let tempMin = city.main?.tempMin, let tempMax = city.main?.tempMax else { return }
        
        if TemperatureFormatter.instance.currentFormat == .Celsius {
            minMaxLabel.text = "\(tempMin)-\(tempMax) °C"
        }
        
        if TemperatureFormatter.instance.currentFormat == .Fahrenheit {
            minMaxLabel.text = "\((tempMin * 1.8 + 32).toString2Digits())-\((tempMax * 1.8 + 32).toString2Digits()) °F"
        }
    }
}
