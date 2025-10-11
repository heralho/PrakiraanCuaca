//
//  BMKGAPI.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

protocol IBMKGAPI {
    func fetchBMKGData(data: BMKGRequestData) async throws -> Result<BMKGResponseData?, Error>
}

class BMKGAPI: IBMKGAPI {
    
    static let shared = BMKGAPI()
    
    func fetchBMKGData(data: BMKGRequestData) async throws -> Result<BMKGResponseData?, Error> {
        return try await UrlSessionManager.shared.fetchUrl(method: .get,
                                                           url: Constant.BMKGUrl + "prakiraan-cuaca?adm4=" + data.adm4)
    }
}
