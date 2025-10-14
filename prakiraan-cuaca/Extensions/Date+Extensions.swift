//
//  Date+Extensions.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 14/10/25.
//

import Foundation

extension Date {
    static func fromAPI(date: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DDTHH:mm:ssZ"
        return formatter.date(from: date) ?? Date()
        
    }
    
    func toTimeFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
}
