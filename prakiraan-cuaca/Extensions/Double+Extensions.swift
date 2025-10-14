//
//  Double+Extensions.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import Foundation

extension Double? {
    func toString() -> String {
        guard let value = self else {
            return "-"
        }
        
        return String(format: "%.1f", value)
    }
}

extension Double {
    func toString() -> String {
        return String(format: "%.1f", self)
    }
}
