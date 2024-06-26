//
//  URLSession+.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

extension URLSession {
    static var test: URLSession {
        let mockConfiguration = URLSessionConfiguration.default
        mockConfiguration.protocolClasses = [MockURLProtocol.self]
        return URLSession(configuration: mockConfiguration)
    }
}
