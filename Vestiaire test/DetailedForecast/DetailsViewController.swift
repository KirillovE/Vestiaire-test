//
//  DetailsViewController.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import UIKit

final class DetailsViewController: UITableViewController {
    
    @IBOutlet weak var detailsTableView: UITableView!
    var weatherDetails: DayWeatherDetails? = .random

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

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
            cell.textLabel?.text = details.conditionDescription
        case .date:
            cell.textLabel?.text = details.date
        case .sunrise:
            cell.textLabel?.text = details.sunriseTime
        case .sunset:
            cell.textLabel?.text = details.sunsetTime
        case .morning:
            cell.detailTextLabel?.text = "\(details.temperature.morning)º"
        case .day:
            cell.detailTextLabel?.text = "\(details.temperature.day)º"
        case .evening:
            cell.detailTextLabel?.text = "\(details.temperature.evening)º"
        case .night:
            cell.detailTextLabel?.text = "\(details.temperature.night)º"
        case .morningFeels:
            cell.detailTextLabel?.text = "\(details.feelsLike.morning)º"
        case .dayFeels:
            cell.detailTextLabel?.text = "\(details.feelsLike.day)º"
        case .eveningFeels:
            cell.detailTextLabel?.text = "\(details.feelsLike.evening)º"
        case .nightFeels:
            cell.detailTextLabel?.text = "\(details.feelsLike.night)º"
        case .wind:
            cell.detailTextLabel?.text = "\(details.windSpeed) m/sec"
        case .clouds:
            cell.detailTextLabel?.text = "\(details.cloudiness) %"
        case .humidity:
            cell.detailTextLabel?.text = "\(details.humidity) %"
        case .pop:
            cell.detailTextLabel?.text = "\(details.precipitationProbability) %"
        }
        
        return cell
    }
}
