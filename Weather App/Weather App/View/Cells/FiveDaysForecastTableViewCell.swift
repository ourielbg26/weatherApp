//
//  FiveDaysForecastTableViewCell.swift
//  Weather App
//
//  Created by Itzik Bar-Noy on 18/06/2020.
//  Copyright © 2020 Itzik Bar-Noy. All rights reserved.
//

import UIKit

class FiveDaysForecastTableViewCell: UITableViewCell {
    
    // MARK: Outlets
    @IBOutlet weak var dayInTheWeekLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var minMaxLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!

    // MARK: Properties
    public static let identifier = "FiveDaysForecastCell"
    
    // MARK: Functions
    public func configureCell(with threeHoursForecast: ThreeHoursForecast) {
        let middleIndex = threeHoursForecast.list.count / 2
        let minMax = getMinMax(from: threeHoursForecast.list)
        let weatherDescription = threeHoursForecast.list[middleIndex].weather[0].weatherDescription
        let icon = threeHoursForecast.list[middleIndex].weather[0].icon
        
        dayInTheWeekLabel.text = threeHoursForecast.dayInTheWeek.rawValue
        descriptionLabel.text = weatherDescription
        minMaxLabel.text = minMax
        iconImageView.image = UIImage(named: icon)
    }
    
    private func getMinMax(from list: [List]) -> String {
        let tempMin = list.reduce(0.0) { $0 + $1.main.tempMin } / Double(list.count)
        let tempMax = list.reduce(0.0) { $0 + $1.main.tempMax } / Double(list.count)
        var result = ""
        
        if TemperatureFormatter.instance.currentFormat == .Celsius {
            result = "\((tempMin).toString2Digits())-\((tempMax).toString2Digits()) °C"
        }
        
        if TemperatureFormatter.instance.currentFormat == .Fahrenheit {
            result = "\((tempMin * 1.8 + 32).toString2Digits())-\((tempMax * 1.8 + 32).toString2Digits()) °F"
        }
        
        return result
    }
}
