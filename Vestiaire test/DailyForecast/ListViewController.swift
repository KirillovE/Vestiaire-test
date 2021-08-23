//
//  ListViewController.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var weatherTable: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var weatherData: GeneralDailyWeather? // = .random // you can uncomment this assignement for testing purpose
    private var interactor: Interactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTable.dataSource = self
        weatherTable.delegate = self
        
        interactor = Interactor(weatherRepresenter: self, errorRepresenter: self)
        interactor?.loadWeather()
        activityIndicator.startAnimating()
    }
    
    private func seetTitle() {
        title = weatherData.map { $0.cityName + ", " + $0.countryName }
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
        let deletionsIndexPaths = getIndexPaths(rowsCount: weatherData?.daysCount ?? 0)
        let insertionsIndexPaths = getIndexPaths(rowsCount: weather.daysCount)
        
        DispatchQueue.main.async {
            self.weatherTable.performBatchUpdates {
                self.weatherTable.deleteRows(at: deletionsIndexPaths, with: .fade)
                self.weatherData = weather
                self.weatherTable.insertRows(at: insertionsIndexPaths, with: .automatic)
            } completion: { _ in
                self.weatherTable.reloadData()
                self.seetTitle()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func getIndexPaths(rowsCount: Int) -> [IndexPath] {
        rowsCount <= 0
            ? []
            : (0...rowsCount-1).map { IndexPath(row: $0, section: 0) }
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
