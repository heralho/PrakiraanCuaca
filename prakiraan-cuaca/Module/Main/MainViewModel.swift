//
//  MainViewModel.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//
import SwiftUI

@MainActor
@Observable
class MainViewModel {
    private let api: IAreaAPI = AreaAPI.shared

    private var province: [AreaDataItem] = [AreaDataItem]()
    private var city: [AreaDataItem] = [AreaDataItem]()
    private var district: [AreaDataItem] = [AreaDataItem]()
    private var subdistrict: [AreaDataItem] = [AreaDataItem]()
    
    var filter: String = ""
    private var selectedProvince: String = ""
    private var selectedCity: String = ""
    private var selectedDistrict: String = ""
    private var selectedSubdistrict: String = ""
    
    func fetchData() async {
        do {
            let result = try await api.getProvince()
            switch result {
            case .success(let success):
                province = success?.data ?? []
            case .failure(let failure):
                print(failure)
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchCityData() async {
        do {
            let result = try await api.getCity(data: CityRequestModel(provinceCode: selectedProvince))
            switch result {
            case .success(let success):
                city = success?.data ?? []
            case .failure(let failure):
                print(failure)
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchDistrictData() async {
        do {
            let result = try await api.getDistrict(data: DistrictRequestModel(cityCode: selectedCity))
            switch result {
            case .success(let success):
                district = success?.data ?? []
            case .failure(let failure):
                print(failure)
            }
        } catch {
            print(error)
        }
    }
    
    private func fetchSubdistrictData() async {
        do {
            let result = try await api.getSubdistrict(data: SubdistrictRequestModel(districtCode: selectedDistrict))
            switch result {
            case .success(let success):
                subdistrict = success?.data ?? []
            case .failure(let failure):
                print(failure)
            }
        } catch {
            print(error)
        }
    }
    
    // Input
    func setSelectedProvince(_ province: String) async {
        selectedProvince = province
        selectedCity = ""
        selectedDistrict = ""
        selectedSubdistrict = ""
        city.removeAll()
        district.removeAll()
        subdistrict.removeAll()
        await fetchCityData()
    }
    
    func setSelectedCity(_ city: String) async {
        selectedCity = city
        selectedDistrict = ""
        selectedSubdistrict = ""
        district.removeAll()
        subdistrict.removeAll()
        await fetchDistrictData()
    }
    
    func setSelectedDistrict(_ district: String) async {
        selectedDistrict = district
        selectedSubdistrict = ""
        subdistrict.removeAll()
        await fetchSubdistrictData()
    }
    
    func setSelectedSubdistrict(_ subdistrict: String) async {
        selectedSubdistrict = subdistrict
    }
    
    // Output
    func getProvinceData() -> [AreaDataItem] {
        guard !filter.isEmpty else {
            return province
        }
        
        return province.filter({$0.name?.lowercased().contains(filter.lowercased()) ?? false})
    }
    
    func getCityData() -> [AreaDataItem] {
        return city
    }
    
    func getDistrictData() -> [AreaDataItem] {
        return district
    }
    
    func getSubdistrictData() -> [AreaDataItem] {
        return subdistrict
    }
    
    func getSelectedProvince() -> String {
        return selectedProvince
    }
    
    func getSelectedCity() -> String {
        return selectedCity
    }
    
    func getSelectedDistrict() -> String {
        return selectedDistrict
    }
    
    func getSelectedSubdistrict() -> String {
        return selectedSubdistrict
    }
    
    func showCity() -> Bool {
        return !city.isEmpty
    }
    
    func showDistrict() -> Bool {
        return !district.isEmpty
    }
    
    func showSubdistrict() -> Bool {
        return !subdistrict.isEmpty
    }
}

