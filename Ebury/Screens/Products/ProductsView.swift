//
//  ProductsView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 22/6/24.
//

import SwiftUI

struct ProductsView: View {
    var body: some View {
        content
    }
    
    private var content: some View {
        SheetContainer {
            VStack(
                alignment: .center,
                spacing: .zero
            ) {
                Spacer()

                Image("empty_state")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width * 0.64)
                    .padding(.bottom, 32)
                
                Text("Coming soon")
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(.bottom, 8)
                
                Text("We are currently working in more features to offer the best experience")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(
                        Color(
                            red: 60 / 250,
                            green: 60 / 250,
                            blue: 67 / 250,
                            opacity: 0.6
                        )
                    )
                    .padding(.horizontal, 35)

                Spacer()
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ProductsView()
}
