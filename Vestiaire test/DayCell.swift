//
//  DayCell.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

final class DayCell: UITableViewCell {
    
    @IBOutlet weak var weakdayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    
    func configure(with summmary: DayWeatherSummary) {
        weakdayLabel.text = summmary.weakday
        dateLabel.text = summmary.date
        weatherIconImageView.image = UIImage(named: summmary.conditionsIconName)
        maxTemperatureLabel.text = "\(summmary.maxTemperature)"
        minTemperatureLabel.text = "\(summmary.minTemperature)"
    }

}
