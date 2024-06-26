//
//  WalletsRepositoryTests.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import XCTest
@testable import Ebury

final class WalletsRepositoryTests: XCTestCase {
    
    var walletsService: WalletsServiceMock!
    var walletsRepository: WalletsRepositoryProtocol!

    override func setUpWithError() throws {
        walletsService = WalletsServiceMock()
        walletsRepository = WalletsRepository(service: walletsService)
    }

    override func tearDownWithError() throws {
        walletsService = nil
        walletsRepository = nil
    }

    func test_GetWallets_ReturnsResult() async throws {
        let apiWallets: [APIWallet] = [.dummy()]
        
        walletsService.getWalletsClosure = {
            apiWallets
        }
        
        let wallets = try await walletsRepository.getWallets()
        
        XCTAssertFalse(wallets.isEmpty)
        XCTAssertEqual(wallets.first!.id, apiWallets.first!.accountId)
    }
    
    func test_GetGameProducts_ThrowsError() async throws {
        walletsService.getWalletsClosure = {
            throw NetworkError.invalidRequest
        }
        
        let throwingExpectation = expectation(description: "throwingExpectation")
        
        do {
            let response = try await walletsRepository.getWallets()
            XCTFail("Unexpected value: \(response)")
        } catch {
            throwingExpectation.fulfill()
        }

        await waitForExpectations(timeout: 0.1)
    }
    
    func test_GetWalletWithId_ReturnsResult() async throws {
        let accountId = "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20"
        let apiWallet: APIWallet = .dummy(accountId: accountId)
        
        walletsService.getWalletWithIdClosure = { _ in
            apiWallet
        }
        
        let wallet = try await walletsRepository.getWallet(withId: accountId)
        
        XCTAssertEqual(apiWallet.accountId, wallet.id)
    }
    
    
    func test_GetWalletWithId_ThrowsError() async throws {
        walletsService.getWalletWithIdClosure = { _ in
            throw NetworkError.invalidRequest
        }
        
        let throwingExpectation = expectation(description: "throwingExpectation")

        do {
            let response = try await walletsRepository.getWallet(withId: UUID().uuidString)
            XCTFail("Unexpected value: \(response)")
        } catch {
            throwingExpectation.fulfill()
        }

        await waitForExpectations(timeout: 0.1)
    }

}
