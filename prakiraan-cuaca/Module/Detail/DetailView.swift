//
//  DetailView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct DetailView: View {
    let adm4: String
    
    @State private var viewModel: DetailViewModel = DetailViewModel()
    
    var body: some View {
        Text(adm4)
            .onAppear {
                print(adm4)
            }
            .task {
                do {
                    await viewModel.fetchData(adm4)
                }
            }
    }
}

#Preview {
    DetailView(adm4: "")
}
