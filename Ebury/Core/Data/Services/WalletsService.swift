//
//  WalletsService.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

protocol WalletsServiceable {
    func getWallets() async throws -> [APIWallet]
    func getWallet(withId id: String) async throws -> APIWallet
}

class WalletsService: WalletsServiceable {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func getWallets() async throws -> [APIWallet] {
        // TODO: implement
        return []
    }
    
    func getWallet(withId id: String) async throws -> APIWallet {
        // TODO: implement
        .init(
            accountId: "",
            companyName: "",
            amount: .init(amount: "", currency: ""),
            creditDebitIndicator: "",
            datetime: ""
        )
    }
}
