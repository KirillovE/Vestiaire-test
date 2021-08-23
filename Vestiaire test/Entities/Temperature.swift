//
//  Temperature.swift
//  Vestiaire test
//
//  Created by Евгений Кириллов on 22.08.2021.
//

/// Temperature view data
struct Temperature {
    
    let morning: Int
    let day: Int
    let evening: Int
    let night: Int
    
}

// MARK: - RandomEntityGenerator

extension Temperature: RandomEntityGenerator {
    
    static var random: Temperature {
        .init(
            morning: .random(in: -40...40),
            day: .random(in: -40...40),
            evening: .random(in: -40...40),
            night: .random(in: -40...40)
        )
    }

}
