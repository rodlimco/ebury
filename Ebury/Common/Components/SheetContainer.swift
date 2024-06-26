//
//  SheetContainer.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 26/6/24.
//

import SwiftUI

struct SheetContainer<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()

        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }

    var body: some View {
        VStack {
            Spacer()
            content
                .background(
                    Color(
                        red: 250 / 255,
                        green: 250 / 255,
                        blue: 250 / 255,
                        opacity: 1.0
                    )
                )
                .cornerRadius(24, corners: [.topLeft, .topRight])
        }
        .background(
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.top)
        )
    }
}

#Preview {
    SheetContainer {
        VStack {
            Text("Screen 1")
                .font(.largeTitle)
            
            Text("Screen 1 Content")
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

