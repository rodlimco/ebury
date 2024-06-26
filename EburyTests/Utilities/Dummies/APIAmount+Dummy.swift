//
//  APIAmount+Dummy.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation
@testable import Ebury

extension APIAmount {
    static func dummy(
        amount: String = "123456.50",
        currency: String = "USD"
    ) -> Self {
        .init(
            amount: amount,
            currency: currency
        )
    }
}
