//
//  AccountBalance.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

enum AccountBalance: Hashable {
    case eur(String)
    case gbp(String)
    case jpy(String)
    case usd(String)
    
    var abbreviation: String {
        switch self {
        case .eur:
            return "EUR"
        case .gbp:
            return "GBP"
        case .jpy:
            return "JPY"
        case .usd:
            return "USD"
        }
    }
    
    var name: String {
        switch self {
        case .eur:
            return "Euro"
        case .gbp:
            return "British Pounds"
        case .jpy:
            return "Japanese Yen"
        case .usd:
            return "US Dollars"
        }
    }
    
    var balance: String {
        switch self {
        case .eur(let balance), .gbp(let balance), .jpy(let balance), .usd(let balance):
            return balance
        }
    }
}
