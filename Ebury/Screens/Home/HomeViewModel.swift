//
//  HomeViewModel.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    private let walletsRepository: WalletsRepositoryProtocol
    
    @Published private(set) var state: ViewState = .empty
    @Published private(set) var wallets: [Wallet] = []
    
    init(walletsRepository: WalletsRepositoryProtocol = WalletsRepository()) {
        self.walletsRepository = walletsRepository
    }

    @MainActor
    func loadWallets() async {
        guard !state.isLoading else { return }
        state = .loading

        do {
            wallets = try await walletsRepository.getWallets()
            state = .success
        } catch {
            state = .error
        }
    }
}
