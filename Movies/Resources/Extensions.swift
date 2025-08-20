//
//  Extensions.swift
//  Movies
//
//  Created by Mehmet Ali Bunsuz on 20.08.2025.
//

import Foundation

// MARK: - String Extensions
extension String {
    /// Capitalizes only the first letter of the string and makes the rest lowercase.
    /// Example: "hELLO" → "Hello"
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
