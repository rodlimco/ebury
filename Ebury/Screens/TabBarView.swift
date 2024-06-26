//
//  TabBarView.swift
//  Ebury
//
//  Created by Rodrigo Limpias Cossio on 21/6/24.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            NavigationStack() {
                HomeView()
                    .navigationTitle("Home")
            }
            .tabItem {
                Text("Home")
                Image(selectedIndex == 0 ? "home_selected" : "home_unselected")
            }
            .tag(0)
            
            NavigationStack() {
                ProductsView()
                    .navigationTitle("Profile")
            }
            .tabItem {
                Text("Products")
                Image(selectedIndex == 1 ? "products_selected" : "products_unselected")
            }
            .tag(1)
        }
    }
}

#Preview {
    TabBarView()
}
