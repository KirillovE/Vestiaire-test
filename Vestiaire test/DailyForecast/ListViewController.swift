//
//  ListViewController.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var weatherTable: UITableView!
    private var weatherData: GeneralDailyWeather? = .random
    private var interactor: Interactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = weatherData.map { $0.cityName + ", " + $0.countryName }
        weatherTable.dataSource = self
        weatherTable.delegate = self
        
        interactor = Interactor(weatherRepresenter: self, errorRepresenter: self)
        interactor?.loadWeather()
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        weatherData.map { "\($0.daysCount)-days forecast" }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData?.daySummaries.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayCell,
            let weatherSummary = weatherData?.daySummaries[indexPath.row]
        else {
            return UITableViewCell()
        }
        
        cell.configure(with: weatherSummary)
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ListViewController: WeatherRepresenter {
    func showWeather(_ weather: GeneralDailyWeather) {
        weatherData = weather
        DispatchQueue.main.async {
            self.weatherTable.reloadData()
        }
    }
}

extension ListViewController: ErrorRepresenter {
    func showError(_ error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(
                title: "Error",
                message: error,
                preferredStyle: .alert
            )
            alertController.addAction(UIAlertAction(title: "Close", style: .cancel))
            self.present(alertController, animated: true)
        }
    }
}
