//
//  CurrencyCellView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 23/6/24.
//

import SwiftUI

struct CurrencyCellView: View {
    let wallet: Wallet
    
    var body: some View {
        content
    }
    
    private var content: some View {
        HStack(spacing: .zero) {
            Image(wallet.currency.iconName)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.trailing, 8)
            
            VStack(
                alignment: .leading,
                spacing: 4
            ) {
                Text(wallet.currency.abbreviation)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                
                Text(wallet.currency.name)
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
            
            Text(wallet.amount)
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
}

#Preview {
    CurrencyCellView(
        wallet: .init(
            id: UUID().uuidString,
            amount: "8000000,50",
            currency: .usd
        )
    )
}
