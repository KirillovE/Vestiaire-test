//
//  DayCell.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

final class DayCell: UITableViewCell {
    
    override func layoutSubviews() {
        contentView.layer.cornerRadius = 16
    }

    func configure(with summmary: DayWeatherSummary) {
        let designedContent = contentView as? DayCellContent
        designedContent?.dayLabel.text = summmary.weakday
        designedContent?.datelabel.text = summmary.date
        designedContent?.weatherImageView.image = UIImage(named: summmary.conditionsIconName)
        designedContent?.maxTemperatureLabel.text = "\(summmary.maxTemperature)"
        designedContent?.minTemperatureLabel.text = "\(summmary.minTemperature)"
    }

}
