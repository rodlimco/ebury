//
//  WalletsServiceMock.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation
@testable import Ebury

class WalletsServiceMock: WalletsServiceable {
    var getWalletsClosure: (() async throws -> [APIWallet])!
    func getWallets() async throws -> [Ebury.APIWallet] {
        try await getWalletsClosure()
    }
    
    var getWalletWithIdClosure: ((String) async throws -> APIWallet)!
    func getWallet(withId id: String) async throws -> Ebury.APIWallet {
        try await getWalletWithIdClosure(id)
    }
}
