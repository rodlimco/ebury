//
//  StubsType.swift
//  EburyTests
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

enum StubsType {
    case wallets
    case walletDetail
    
    var filename: String {
        switch self {
        case .wallets: return "APIWallets.json"
        case .walletDetail: return "APIWalletDetail.json"
        }
    }
}
