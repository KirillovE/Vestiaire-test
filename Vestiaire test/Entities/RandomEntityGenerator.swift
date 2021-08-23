//
//  RandomEntityGenerator.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// A type that can generate itself with random values
///
/// It is useful when testing UI without actual data
protocol RandomEntityGenerator {
    
    associatedtype T
    
    /// Entity initialized with random values
    static var random: T { get }

}
