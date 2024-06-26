//
//  CurrencyCellView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 23/6/24.
//

import SwiftUI

struct CurrencyCellView: View {
    let account: AccountBalance
    
    var body: some View {
        content
    }
    
    private var content: some View {
        HStack(spacing: .zero) {
            Circle()
                .fill(Color.blue)
                .frame(width: 32, height: 32)
                .padding(.trailing, 8)
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                Text(account.abbreviation)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                
                Text(account.name)
                    .font(.subheadline)
                    .foregroundColor(
                        Color(
                            red: 142 / 250,
                            green: 142 / 250,
                            blue: 147 / 250,
                            opacity: 1
                        )
                    )
            }
            
            Spacer()
            
            Text(formattedBalance(account.balance))
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .lineLimit(1)
        }
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    Color(
                        red: 233 / 250,
                        green: 233 / 250,
                        blue: 234 / 250,
                        opacity: 1
                    ),
                    lineWidth: 1
                )
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // TODO: take this to a ViewModel
    func formattedBalance(_ balance: String) -> String {
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

#Preview {
    CurrencyCellView(
        account: .usd("8000000000,50")
    )
}
