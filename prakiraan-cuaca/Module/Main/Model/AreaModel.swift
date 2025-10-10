//
//  AreaModel.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

struct ProvinceResponseModel: Codable {
    let data: [AreaDataItem]?
    let meta: AreaMeta?
}

struct CityRequestModel: Codable {
    let provinceCode: String?
}

struct CityResponseModel: Codable {
    let data: [AreaDataItem]?
    let meta: AreaMeta?
}

struct DistrictRequestModel: Codable {
    let cityCode: String?
}

struct DistrictResponseModel: Codable {
    let data: [AreaDataItem]?
    let meta: AreaMeta?
}

struct SubdistrictRequestModel: Codable {
    let districtCode: String?
}

struct SubdistrictResponseModel: Codable {
    let data: [AreaDataItem]?
    let meta: AreaMeta?
}

struct AreaDataItem: Codable {
    let code: String?
    let name: String?
}

struct AreaMeta: Codable {
    let administrativeAreaLevel: Int?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case administrativeAreaLevel = "administrative_area_level"
        case updatedAt = "update_at"
    }
}
