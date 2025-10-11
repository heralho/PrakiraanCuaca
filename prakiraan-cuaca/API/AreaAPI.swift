//
//  AreaAPI.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

protocol IAreaAPI {
    func getProvince() async throws -> Result<ProvinceResponseModel?, Error>
    func getCity(data: CityRequestModel) async throws -> Result<CityResponseModel?, Error>
    func getDistrict(data: DistrictRequestModel) async throws -> Result<DistrictResponseModel?, Error>
    func getSubdistrict(data: SubdistrictRequestModel) async throws -> Result<SubdistrictResponseModel?, Error>
}

class AreaAPI: IAreaAPI {
    
    static let shared = AreaAPI()
    
    func getProvince() async throws -> Result<ProvinceResponseModel?, Error> {
        return try await UrlSessionManager.shared.fetchUrl(method: .get, url: Constant.AreaUrl + "provinces.json")
    }
    
    func getCity(data: CityRequestModel) async throws -> Result<CityResponseModel?, Error> {
        guard let provinceCode = data.provinceCode else {
            return .failure(Errors(code: nil, message: "Province not available"))
        }
        
        return try await UrlSessionManager.shared.fetchUrl(method: .get, url: Constant.AreaUrl + "regencies/" + "\(provinceCode).json")
    }
    
    func getDistrict(data: DistrictRequestModel) async throws -> Result<DistrictResponseModel?, Error> {
        guard let cityCode = data.cityCode else {
            return .failure(Errors(code: nil, message: "City not available"))
        }
        
        return try await UrlSessionManager.shared.fetchUrl(method: .get, url: Constant.AreaUrl + "districts/" + "\(cityCode).json")
    }
    
    func getSubdistrict(data: SubdistrictRequestModel) async throws -> Result<SubdistrictResponseModel?, Error> {
        guard let districtCode = data.districtCode else {
            return .failure(Errors(code: nil, message: "District not available"))
        }
        
        return try await UrlSessionManager.shared.fetchUrl(method: .get, url: Constant.AreaUrl + "villages/" + "\(districtCode).json")
    }
}
