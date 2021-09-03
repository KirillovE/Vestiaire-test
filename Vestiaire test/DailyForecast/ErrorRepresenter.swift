//
//  ErrorRepresenter.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 23.08.2021.
//

/// A type that able to represent error text somehow
protocol ErrorRepresenter: AnyObject {
    
    /// Show error to user
    /// - Parameter error: Error text to be shown
    func showError(_ error: String)
    
}
