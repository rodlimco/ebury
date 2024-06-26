//
//  WalletMapperTests.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import XCTest
@testable import Ebury

final class WalletMapperTests: XCTestCase {
    func test_Map_Single_Wallet() {
        let apiWallet: APIWallet = .dummy()
        let mappedWallet = WalletMapper.map(apiWallet: apiWallet)

        XCTAssertEqual(apiWallet.accountId, mappedWallet.id)
        XCTAssertEqual(apiWallet.amount.currency, mappedWallet.currency.abbreviation)
    }
    
    func test_Map_MultipleWallets() {
        let apiWallets: [APIWallet] = [
            .dummy(),
            .dummy()
        ]
        let mappedWallets = WalletMapper.map(apiWallets: apiWallets)
        
        XCTAssertEqual(apiWallets.count, mappedWallets.count)
        XCTAssertEqual(apiWallets.first!.accountId, mappedWallets.first!.id)
        XCTAssertEqual(apiWallets.first!.amount.currency, mappedWallets.first!.currency.abbreviation)
    }
}
