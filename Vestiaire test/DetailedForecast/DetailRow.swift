//
//  DetailRow.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

import Foundation

/// Representation of row in weather details table
enum DetailRow: String, CaseIterable {
    case iconDescription, date, sunrise, sunset
    case morning, day, evening, night
    case morningFeels, dayFeels, eveningFeels, nightFeels
    case wind, clouds, humidity, pop
    
    /// Count of rows in specific section
    ///
    /// Index represents section number, value represents count of rows in this section
    ///
    /// - Note: You should keep this arrray associated with cases of enumeration
    static var rowsCounts: [Int] {
        [4, 4, 4, 4]
    }
}

extension DetailRow {
    init?(from indexPath: IndexPath) {
        switch indexPath {
        case .init(row: 0, section: 0):
            self = .iconDescription
        case .init(row: 1, section: 0):
            self = .date
        case .init(row: 2, section: 0):
            self = .sunrise
        case .init(row: 3, section: 0):
            self = .sunset
        case .init(row: 0, section: 1):
            self = .morning
        case .init(row: 1, section: 1):
            self = .day
        case .init(row: 2, section: 1):
            self = .evening
        case .init(row: 3, section: 1):
            self = .night
        case .init(row: 0, section: 2):
            self = .morningFeels
        case .init(row: 1, section: 2):
            self = .dayFeels
        case .init(row: 2, section: 2):
            self = .eveningFeels
        case .init(row: 3, section: 2):
            self = .nightFeels
        case .init(row: 0, section: 3):
            self = .wind
        case .init(row: 1, section: 3):
            self = .clouds
        case .init(row: 2, section: 3):
            self = .humidity
        case .init(row: 3, section: 3):
            self = .pop
        default:
            return nil
        }
    }
}
