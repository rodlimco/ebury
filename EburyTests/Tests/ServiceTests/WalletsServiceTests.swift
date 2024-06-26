//
//  WalletsServiceTests.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import XCTest
@testable import Ebury

final class WalletsServiceTests: XCTestCase {
    var urlSession: URLSession!
    var walletsService: WalletsServiceable!

    override func setUpWithError() throws {
        urlSession = .test
        walletsService = WalletsService(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        urlSession = nil
        walletsService = nil
    }

    func test_GetWallets_ReturnsResult() async throws {
        let mockData = try TestsBundle.test.loadData(for: StubsType.wallets.filename)

        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let response = try await walletsService.getWallets()

        XCTAssertFalse(response.isEmpty)
    }
    
    func test_GetWallets_ThrowsError() async throws {
        let _ = urlResponseExpectation(data: nil)

        do {
            let response = try await walletsService.getWallets()
            XCTFail("Unexpected value: \(response)")
        } catch {

        }

        await waitForExpectations(timeout: 0.1)
    }
    
    func test_GetWalletWithId_ReturnsResult() async throws {
        let mockData = try TestsBundle.test.loadData(for: StubsType.walletDetail.filename)
        let accountId = "3230bd7e-cb4c-553c-bcd3-607f3a3f8e20"
        MockURLProtocol.requestHandler = { _ in
            (HTTPURLResponse(), mockData)
        }

        let response = try await walletsService.getWallet(withId: accountId)

        XCTAssertEqual(response.accountId, accountId)
    }
    
    func test_GetWalletWithId_ThrowsError() async throws {
        let _ = urlResponseExpectation(data: nil)
        let accountId = UUID().uuidString

        do {
            let response = try await walletsService.getWallet(withId: accountId)
            XCTFail("Unexpected value: \(response)")
        } catch {

        }

        await waitForExpectations(timeout: 0.1)
    }
    
    private func urlResponseExpectation(
        data: Data?,
        response: HTTPURLResponse = .init()
    ) -> XCTestExpectation {

        let urlResponseExpectation = expectation(description: "urlResponseExpectation")
        MockURLProtocol.requestHandler = { _ in
            urlResponseExpectation.fulfill()
            guard let data = data else { throw MockError.💣 }
            return (response, data)
        }
        return urlResponseExpectation
    }

}
