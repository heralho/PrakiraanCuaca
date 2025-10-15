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
                if viewModel.getWeatherData().isEmpty {
                    ProgressView()
                        .containerRelativeFrame(.horizontal)
                        .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                } else {
                    ForEach(viewModel.getWeatherData(), id: \.datetime) { data in
                        VStack {
                            WeatherCardView(data: data)
                        }
                        .padding(16)
                        .containerRelativeFrame(.horizontal)
                    }
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
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
