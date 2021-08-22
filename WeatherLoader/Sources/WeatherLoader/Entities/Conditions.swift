//
//  Conditions.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

import Foundation

/// Weather condion descriptions
public struct Conditions: Decodable {
    
    /// Weather condition id
    public let id: Int
    
    /// Group of weather parameters (Rain, Snow, Extreme etc.)
    public let main: String
    
    /// Weather condition within the group
    public let description: String
    
    /// Weather icon id
    public let icon: String
}
