//
//  ViewState.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import Foundation

enum ViewState: Equatable {
    case empty
    case error
    case loading
    case success
}

extension ViewState {
    var isLoading: Bool {
        self == .loading
    }

    var isEmpty: Bool {
        self == .empty
    }
}
