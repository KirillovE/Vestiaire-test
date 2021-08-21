//
//  TextualError.swift
//  
//
//  Created by Евгений Кириллов on 21.08.2021.
//

/// API error representation
struct TextualError: Error, CustomStringConvertible {
    let description: String
}

extension TextualError: ExpressibleByStringLiteral {
    
    init(stringLiteral value: String) {
        description = value
    }
}
