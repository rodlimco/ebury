//
//  HomeView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 23/6/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var showErrorAlert = false
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        content
            .onAppear {
                loadWallets()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("There was an error loading your wallets. Please try again."),
                    dismissButton: .default(
                        Text("OK"), action: {
                            showErrorAlert = false
                            loadWallets()
                        }
                    )
                )
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .empty:
            // TODO: implement
            Color.clear
        case .error:
            errorView
        case .loading:
            loadingView
        case .success:
            sucessView
        }
    }
    
    private var sucessView: some View {
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
                
                ForEach(viewModel.wallets, id: \.id) { wallet in
                    NavigationLink(destination: mockAccountDetailView(wallet: wallet)) {
                        CurrencyCellView(wallet: wallet)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(24)
        }
    }
    
    private var loadingView: some View {
        SheetContainer {
            VStack {
                Spacer()
                ProgressView()
                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
    
    private var errorView: some View {
        Color.clear
            .onAppear {
                showErrorAlert = true
            }
    }
    
    private func mockAccountDetailView(wallet: Wallet) -> some View {
        VStack {
            Text("Account Detail View")
            Text(wallet.currency.name)
        }
    }
    
    private func loadWallets() {
        Task {
            await viewModel.loadWallets()
        }
    }
}

#Preview {
    HomeView()
}
