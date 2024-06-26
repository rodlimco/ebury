//
//  HomeView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 23/6/24.
//

import SwiftUI

struct HomeView: View {
    
    // TODO: implemente ViewModel
    private let accounts: [AccountBalance] = [
        .usd("50,000.50"),
        .eur("8,000.00"),
        .gbp("20,000.00")
        ]

    var body: some View {
        content
    }

    private var content: some View {
        SheetContainer {
            VStack(spacing: 16) {
                HStack {
                    Text("Your currencies")
                        .font(.body)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: Text("All Currencies View"),
                        label: {
                            Text("View all")
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(
                                    Color(
                                        red: 0 / 255,
                                        green: 190 / 255,
                                        blue: 240 / 255,
                                        opacity: 1
                                    )
                                )
                        }
                    )
                }
                
                ForEach(accounts, id: \.self) { account in
                    NavigationLink(destination: mockAccountDetailView(account: account)) {
                        CurrencyCellView(account: account)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(24)
        }
    }
    
    private func mockAccountDetailView(account: AccountBalance) -> some View {
        VStack {
            Text("Account Detail View")
            Text(account.name)
        }
    }
}

#Preview {
    HomeView()
}
