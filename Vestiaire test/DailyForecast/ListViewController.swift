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
    private var weatherData: GeneralDailyWeather?
    private var interactor: Interactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherTable.dataSource = self
        weatherTable.delegate = self
        
        interactor = Interactor(weatherRepresenter: self, errorRepresenter: self)
        interactor?.loadWeather()
        activityIndicator.startAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "showDetails",
            let detailsController = segue.destination as? DetailsViewController,
            let selectedRow = weatherTable.indexPathForSelectedRow?.row,
            let selectedData = weatherData?.daySummaries[selectedRow]
        else { return }
        
        detailsController.weatherDetails = selectedData.details
    }
    
    private func setTitle() {
        title = weatherData.map { $0.cityName + ", " + $0.countryName }
    }
    
}

// MARK: - UITableViewDataSource

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

// MARK: - UITableViewDelegate

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


// MARK: - WeatherRepresenter

extension ListViewController: WeatherRepresenter {
    
    func showWeather(_ weather: GeneralDailyWeather) {
        self.weatherData = weather
        DispatchQueue.main.async {
            self.weatherTable.reloadSections([0], with: .automatic)
            self.setTitle()
            self.activityIndicator.stopAnimating()
        }
    }
    
}


// MARK: - ErrorRepresenter

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
