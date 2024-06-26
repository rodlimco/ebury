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
    private let baseUrl = "http://localhost:3000"
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func getWallets() async throws -> [APIWallet] {
        guard let url = URL(string: "\(baseUrl)/wallets") else {
            throw NetworkError.invalidUrl
        }

        let response: [APIWallet] = try await urlSession.request(request: URLRequest(url: url))
        return response
    }
    
    func getWallet(withId id: String) async throws -> APIWallet {
        guard let url = URL(string: "\(baseUrl)/wallets/\(id)") else {
            throw NetworkError.invalidUrl
        }
        
        let response: APIWallet = try await urlSession.request(request: URLRequest(url: url))
        return response
    }
}
