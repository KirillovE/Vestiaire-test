//
//  DayCell.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

/// Cell tat represents a one day weather summary
final class DayCell: UITableViewCell {
    
    @IBOutlet weak var weakdayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    /// Configure cell with proper view data
    /// - Parameter summmary: One day weather summary
    func configure(with summmary: DayWeatherSummary) {
        weakdayLabel.text = summmary.weakday
        dateLabel.text = summmary.date
        weatherIconImageView.image = UIImage(named: summmary.conditionsIconName)
        maxTemperatureLabel.text = "\(summmary.maxTemperature)º"
        minTemperatureLabel.text = "\(summmary.minTemperature)º"
    }

}
