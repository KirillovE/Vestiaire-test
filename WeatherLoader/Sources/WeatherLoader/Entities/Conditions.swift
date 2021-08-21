//
//  Conditions.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Weather condion descriptions
struct Conditions: Decodable {
    
    /// Weather condition id
    let id: Int
    
    /// Group of weather parameters (Rain, Snow, Extreme etc.)
    let main: String
    
    /// Weather condition within the group
    let description: String
    
    /// Weather icon id
    let icon: String
}
