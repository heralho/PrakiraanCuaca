//
//  ContentView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var navigator = Navigator()

    var body: some View {
        NavigationStack(path: $navigator.navigationPath) {
            navigator.startingPath.view()
                .environmentObject(navigator)
                .navigationBarBackButtonHidden(true)
                .padding()
                .navigationDestination(for: Routes.self) { route in
                    route.view()
                        .environmentObject(navigator)
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(
                            leading: CustomBackButton()
                                .environmentObject(navigator)
                        )
                }
        }
    }
}
