//
//  APIWallet+Dummy.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation
@testable import Ebury

extension APIWallet {
    static func dummy(
        accountId: String = UUID().uuidString,
        companyName: String = "default_company_name",
        amount: APIAmount = .dummy(),
        creditDebitIndicator: String = "default_credit_debit_indicator",
        datetime: String = "default_datetime"
    ) -> Self {
        .init(
            accountId: accountId,
            companyName: companyName,
            amount: amount,
            creditDebitIndicator: creditDebitIndicator,
            datetime: datetime
        )
    }
}
