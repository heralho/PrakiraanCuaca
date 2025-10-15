//
//  MainViewModelTests.swift
//  prakiraan-cuacaTests
//
//  Created by Heraldy Dwifany on 15/10/25.
//

import Testing
@testable import prakiraan_cuaca

struct MainViewModelTests {

    @Test func getSelectedProvince() async throws {
        let sut = try makeSUT()
        
        await sut.setSelectedProvince("1")
        #expect(sut.getSelectedProvince() == "1")
        
        await sut.setSelectedProvince("2")
        #expect(sut.getSelectedProvince() != "1")
    }
    
    @Test func getSelectedCity() async throws {
        let sut = try makeSUT()
        
        await sut.setSelectedCity("4")
        #expect(sut.getSelectedCity() == "4")
        
        await sut.setSelectedCity("1")
        #expect(sut.getSelectedCity() != "4")
        
        await sut.setSelectedProvince("5")
        #expect(sut.getSelectedCity() == "")
    }
    
    @Test func getProvince() async throws {
        let sut = try makeSUT()
        
        await sut.fetchData()
        
        #expect(!sut.getProvinceData().isEmpty)
        #expect(sut.getProvinceData().count == 2)
    }
    
    private func makeSUT(api: IAreaAPI? = nil) throws -> MainViewModelType {
        let api = api ?? AreaAPIMock()
        let sut = MainViewModel()
        sut.api = api
        return sut
    }
}

fileprivate class AreaAPIMock: IAreaAPI {
    let isError: Bool
    
    init(isError: Bool = false) {
        self.isError = isError
    }
    
    func getProvince() async throws -> Result<ProvinceResponseModel?, Error> {
        guard !isError else {
            return .failure(Errors(code: 500, message: "Server error"))
        }
        
        return .success(ProvinceResponseModel(data: [AreaDataItem(code: "1", name: "One"),
                                                     AreaDataItem(code: "2", name: "Two")], meta: nil))
    }
    
    func getCity(data: CityRequestModel) async throws -> Result<CityResponseModel?, Error> {
        guard !isError else {
            return .failure(Errors(code: 500, message: "Server error"))
        }
        
        return .failure(Errors(code: nil, message: nil))
    }
    
    func getDistrict(data: DistrictRequestModel) async throws -> Result<DistrictResponseModel?, Error> {
        guard !isError else {
            return .failure(Errors(code: 500, message: "Server error"))
        }
        
        return .failure(Errors(code: nil, message: nil))
    }
    
    func getSubdistrict(data: SubdistrictRequestModel) async throws -> Result<SubdistrictResponseModel?, Error> {
        guard !isError else {
            return .failure(Errors(code: 500, message: "Server error"))
        }
        
        return .failure(Errors(code: nil, message: nil))
    }
}
