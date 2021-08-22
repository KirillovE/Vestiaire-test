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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
