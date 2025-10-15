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
        
        let str = String(format: "%.1f", value)
        let strArr = str.split(separator: ".")
        return strArr.last == "0" ? String(strArr[0]) : str
    }
}

extension Double {
    func toString() -> String {
        let str = String(format: "%.1f", self)
        let strArr = str.split(separator: ".")
        return strArr.last == "0" ? String(strArr[0]) : str
    }
}
