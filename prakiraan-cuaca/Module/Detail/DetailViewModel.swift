//
//  DetailViewModel.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import Foundation

@MainActor
protocol DetailViewModelType {
    
}

@Observable
class DetailViewModel: DetailViewModelType {
    
    private let api: IBMKGAPI = BMKGAPI.shared
    private var weatherData: [Weather] = []
    
    func fetchData(_ adm4: String) async {
        do {
            let result = try await api.fetchBMKGData(data: BMKGRequestData(adm4: adm4))
            switch result {
            case .success(let success):
                weatherData = success?.data?.first?.weather ?? []
            case .failure(let failure):
                print(failure)
            }
        } catch {
            print(error)
        }
    }
    
    func getWeatherData() -> [Weather] {
        return weatherData
    }
}


