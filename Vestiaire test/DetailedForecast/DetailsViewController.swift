//
//  DetailsViewController.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

final class DetailsViewController: UITableViewController {

    @IBOutlet weak var detailsTableView: UITableView!
    var weatherDetails: DayWeatherDetails?
    
}

// MARK: - UITableViewDataSource

extension DetailsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        DetailRow.rowsCounts.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        DetailRow.rowsCounts[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let row = DetailRow(from: indexPath),
            let details = weatherDetails
        else { return .init() }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: row.rawValue)
        let cell = tableView.dequeueReusableCell(withIdentifier: row.rawValue, for: indexPath)
        
        switch row {
        case .iconDescription:
            cell.imageView?.image = UIImage(named: details.conditionIconName)
            cell.textLabel?.text = details.conditionReachDescription
        case .date:
            cell.textLabel?.text = "Weather at \(details.date)"
        case .sunrise:
            cell.textLabel?.text = "Sun rises at \(details.sunriseTime)"
        case .sunset:
            cell.textLabel?.text = "Sun sets at \(details.sunsetTime)"
        case .morning:
            cell.textLabel?.text = "\(details.temperature.morning)º at morning"
        case .day:
            cell.textLabel?.text = "\(details.temperature.day)º at day"
        case .evening:
            cell.textLabel?.text = "\(details.temperature.evening)º at evening"
        case .night:
            cell.textLabel?.text = "\(details.temperature.night)º at night"
        case .morningFeels:
            cell.textLabel?.text = "\(details.feelsLike.morning)º at morning"
        case .dayFeels:
            cell.textLabel?.text = "\(details.feelsLike.day)º at day"
        case .eveningFeels:
            cell.textLabel?.text = "\(details.feelsLike.evening)º at evening"
        case .nightFeels:
            cell.textLabel?.text = "\(details.feelsLike.night)º at night"
        case .wind:
            cell.textLabel?.text = "Wind speed: \(details.windSpeed) m/sec"
        case .clouds:
            cell.textLabel?.text = "Cloudiness: \(details.cloudiness) %"
        case .humidity:
            cell.textLabel?.text = "Humidity: \(details.humidity) %"
        case .pop:
            cell.textLabel?.text = "Probality of percipitation: \(details.precipitationProbability) %"
        }
        
        return cell
    }
}
