//
//  APIWallet.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

struct APIWallet: Codable {
    let accountId: String
    let companyName: String
    let amount: APIAmount
    let creditDebitIndicator: String
    let datetime: String
    
    enum CodingKeys: String, CodingKey {
        case accountId = "account_id"
        case companyName = "company_name"
        case amount
        case creditDebitIndicator = "credit_debit_indicator"
        case datetime
    }
}

struct APIAmount: Codable {
    let amount: String
    let currency: String
}
