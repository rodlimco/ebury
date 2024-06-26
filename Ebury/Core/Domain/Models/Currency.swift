//
//  Currency.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

enum Currency {
    case chf
    case eur
    case gbp
    case jpy
    case usd
    case unknown
    
    init?(rawValue: String) {
        switch rawValue.uppercased() {
        case "CHF": self = .chf
        case "EUR": self = .eur
        case "GBP": self = .gbp
        case "JPY": self = .jpy
        case "USD": self = .usd
        default: self = .unknown
        }
    }
    
    var abbreviation: String {
        switch self {
        case .chf:
            return "CHF"
        case .eur:
            return "EUR"
        case .gbp:
            return "GBP"
        case .jpy:
            return "JPY"
        case .usd:
            return "USD"
        default:
            return "-"
        }
    }
    
    var name: String {
        switch self {
        case .chf:
            return "Swiss Franc"
        case .eur:
            return "Euro"
        case .gbp:
            return "British Pounds"
        case .jpy:
            return "Japanese Yen"
        case .usd:
            return "US Dollars"
        default:
            return "-"
        }
    }
    
    var iconName: String {
        self.abbreviation.lowercased()
    }
}
