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
        ScrollView(.horizontal) {
            VStack {
                Color.blueFrenchPass
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
