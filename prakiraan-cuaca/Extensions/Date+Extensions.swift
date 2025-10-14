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
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let _date = formatter.date(from: date) else {
            print("Failed to parse date")
            return Date()
        }
        return _date
        
    }
    
    func toTimeFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }
    
    func toDateFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMMM"
        return formatter.string(from: self)
    }
}
