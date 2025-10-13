//
//  MainView.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var navigator: Navigator
    @State private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(alignment: .leading,
                   spacing: 16) {
                CustomFieldView(title: "Provinsi",
                                placeholder: "Ketik provinsi di sini",
                                text: $viewModel.filter)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.getProvinceData(), id: \.code) { data in
                            CellBubleView(title: data.name ?? "",
                                          id: data.code ?? "",
                                          isSelected: data.code == viewModel.getSelectedProvince()) { province in
                                Task {
                                    do {
                                        await viewModel.setSelectedProvince(province)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .animation(.default, value: viewModel.getProvinceData().count)
                }
                .scrollIndicators(.hidden)
                if viewModel.showCity() {
                    VStack(alignment: .leading) {
                        Text("Kota")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.getCityData(), id: \.code) { data in
                                    CellBubleView(title: data.name ?? "",
                                                  id: data.code ?? "",
                                                  isSelected: data.code == viewModel.getSelectedCity()) { city in
                                        Task {
                                            do {
                                                await viewModel.setSelectedCity(city)
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal, 16)
                        }
                        .scrollIndicators(.hidden)
                    }
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                }
                if viewModel.showDistrict() {
                    VStack(alignment: .leading) {
                        Text("Kecamatan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.getDistrictData(), id: \.code) { data in
                                    CellBubleView(title: data.name ?? "",
                                                  id: data.code ?? "",
                                                  isSelected: data.code == viewModel.getSelectedDistrict()) { district in
                                        Task {
                                            do {
                                                await viewModel.setSelectedDistrict(district)
                                            }
                                        }
                                    }
                                }
                            }.padding(.horizontal, 16)
                        }
                        .scrollIndicators(.hidden)
                    }
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                }
                if viewModel.showSubdistrict() {
                    VStack(alignment: .leading) {
                        Text("Kelurahan")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 16)
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(viewModel.getSubdistrictData(), id: \.code) { data in
                                    CellBubleView(title: data.name ?? "",
                                                  id: data.code ?? "",
                                                  isSelected: data.code == viewModel.getSelectedSubdistrict()) { subdistrict in
                                        Task {
                                            do {
                                                await viewModel.setSelectedSubdistrict(subdistrict)
                                            }
                                        }
                                    }
                                }
                            }.padding(.horizontal, 16)
                        }
                        .scrollIndicators(.hidden)
                    }
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                }
                Spacer(minLength: 16)
                if !viewModel.getSelectedSubdistrict().isEmpty {
                    VStack(alignment: .center) {
                        Button(action: {
                            navigateToDetail(viewModel.getSelectedSubdistrict())
                        }) {
                            Text("Lihat Prakiraan Cuaca")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .frame(height: 44)
                                .background(Color.blueSpray)
                                .cornerRadius(8)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.horizontal, 16)
                        .shadow(color: Color.black.opacity(0.2), radius: 3, x: 0, y: 0)
                    }
                    .transition(AnyTransition.opacity.animation(.linear(duration: 0.2)))
                }
            }
        }
        .task {
            await viewModel.fetchData()
        }
    }
    
    // MARK: Navigation
    private func navigateToDetail(_ adm4: String) {
        navigator.navigateTo(.detail(adm4: adm4))
    }
}

#Preview {
    MainView()
}
