//
//  ListViewController.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import UIKit

final class ListViewController: UIViewController {
    
    @IBOutlet weak var weatherTable: UITableView!
    let weatherData: GeneralDailyWeather = .random
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = weatherData.cityName + ", " + weatherData.countryName
        weatherTable.dataSource = self
    }
    
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherData.daySummaries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DayCell", for: indexPath) as? DayCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: weatherData.daySummaries[indexPath.row])
        return cell
    }
    
}
