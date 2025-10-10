//
//  Navigator.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import Foundation
import SwiftUI

enum Routes: Hashable{
    case main
    case detail(adm4: String)
    
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .main:
            MainView()
        case .detail(let adm4):
            DetailView()
        }
    }
}

class Navigator: ObservableObject {
    @Published var navigationPath: [Routes] = []
    @Published var startingPath: Routes = .main
    
    func navigateTo(_ route: Routes) {
        navigationPath.append(route)
    }
    
    func pop() {
        navigationPath.removeLast()
    }
    
    func setRoot(_ route: Routes) {
        startingPath = route
    }
}

