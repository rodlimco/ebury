//
//  WalletMapper.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

enum WalletMapper {
    static func map(apiWallets: [APIWallet]) -> [Wallet] {
        apiWallets.map { map(apiWallet: $0) }
    }

    static func map(apiWallet: APIWallet) -> Wallet {
        .init(
            id: apiWallet.accountId,
            amount: formattedAmount(apiWallet.amount.amount),
            currency: Currency(rawValue: apiWallet.amount.currency) ?? .unknown
        )
    }
    
    private static func formattedAmount(_ balance: String) -> String {
        let defaultFormattedBalance = balance.replacingOccurrences(of: ".", with: ",")
        let replacedBalance = balance.replacingOccurrences(of: ",", with: ".")
        guard let doubleBalance = Double(replacedBalance) else {
            return defaultFormattedBalance
        }

        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        if doubleBalance >= 100_000_000 {
            let millions = doubleBalance / 1_000_000
            guard let formattedBalance = formatter.string(from: NSNumber(value: millions)) else {
                return defaultFormattedBalance
            }
            return "\(formattedBalance)M"
        } else {
            guard let formattedBalance = formatter.string(from: NSNumber(value: doubleBalance)) else {
                return defaultFormattedBalance
            }
            return formattedBalance
        }
    }
}
