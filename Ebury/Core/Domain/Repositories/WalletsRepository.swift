//
//  WalletsRepository.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

protocol WalletsRepositoryProtocol {
    func getWallets() async throws -> [Wallet]
    func getWallet(withId id: String) async throws  -> Wallet
}

class WalletsRepository: WalletsRepositoryProtocol {
    private let service: WalletsServiceable

    init(service: WalletsServiceable = WalletsService()) {
        self.service = service
    }

    func getWallets() async throws -> [Wallet] {
        let apiWallets = try await service.getWallets()
        return WalletMapper.map(apiWallets: apiWallets)
    }

    func getWallet(withId id: String) async throws  -> Wallet {
        let apiWallet = try await service.getWallet(withId: id)
        return WalletMapper.map(apiWallet: apiWallet)
    }
}
