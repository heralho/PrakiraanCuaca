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
            LazyHStack(spacing: .zero) {
                ForEach(viewModel.getWeatherData(), id: \.datetime) { data in
                    VStack {
                        WeatherCardView(data: data)
                    }
                    .padding(16)
                    .containerRelativeFrame(.horizontal)
                }
            }
            .scrollTargetLayout()
        }
        .scrollIndicators(.hidden)
        .scrollTargetBehavior(.paging)
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
