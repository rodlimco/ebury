//
//  URLSession+.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

extension URLSession {
    func request<T: Decodable>(
        decoder: JSONDecoder = JSONDecoder(),
        request: URLRequest?
    ) async throws -> T {
        guard let request else {
            throw NetworkError.invalidRequest
        }

        let (data, _) = try await data(for: request)
        let decoded = try decoder.decode(T.self, from: data)
        return decoded
    }
}
