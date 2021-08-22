//
//  RandomEntityGenerator.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// A type that can generate itself with random values
protocol RandomEntityGenerator {
    associatedtype T
    
    /// Entity initialized with random values
    static var random: T { get }
}
