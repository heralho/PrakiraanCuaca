//
//  BMKGModel.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

struct BMKGRequestData: Codable {
    let adm4: String
}

struct BMKGResponseData: Codable {
    let data: [BMKGData]?
}

// MARK: - BMKG Data
struct BMKGData: Codable {
    let location: Location?
    private let cuaca: [[Weather]]?
    var weather: [Weather]? {
        return cuaca?.first
    }
    
    enum CodingKeys: String, CodingKey {
        case location = "lokasi"
        case cuaca = "cuaca"
    }
}

// MARK: - Weather
struct Weather: Codable {
    let datetime: String?
    let t: Double?
    let tcc: Double?
    let tp: Double?
    let weather: Double?
    let weatherDesc: String?
    let weatherDescEn: String?
    let wdDeg: Double?
    let wd: String?
    let wdTo: String?
    let ws: Double?
    let hu: Double?
    let vs: Double?
    let vsText: String?
    let timeIndex: String?
    let analysisDate: String?
    let image: String?
    let utcDatetime: String?
    let localDatetime: String?

    enum CodingKeys: String, CodingKey {
        case datetime, t, tcc, tp, weather
        case weatherDesc = "weather_desc"
        case weatherDescEn = "weather_desc_en"
        case wdDeg = "wd_deg"
        case wd
        case wdTo = "wd_to"
        case ws, hu, vs
        case vsText = "vs_text"
        case timeIndex = "time_index"
        case analysisDate = "analysis_date"
        case image
        case utcDatetime = "utc_datetime"
        case localDatetime = "local_datetime"
    }
}

// MARK: - Location
struct Location: Codable {
    let adm1: String?
    let adm2: String?
    let adm3: String?
    let adm4: String?
    let province: String?
    let city: String?
    let district: String?
    let subdistrict: String?
    let lon: Double?
    let lat: Double?
    let timezone: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case adm1, adm2, adm3, adm4, lon, lat, timezone, type
        case province = "provinsi"
        case city = "kotkab"
        case district = "kecamatan"
        case subdistrict = "desa"
    }
}
