//
//  UrlSessionManager.swift
//  prakiraan-cuaca
//
//  Created by Heraldy Dwifany on 10/10/25.
//

import Foundation

protocol IUrlSessionManager {
    func fetchUrl<T: Codable>(method: HttpMethod, url: String, body: Codable?) async throws -> Result<T?, Error>
}

class UrlSessionManager: IUrlSessionManager {
    
    static let shared = UrlSessionManager()
    
    func fetchUrl<T: Codable>(method: HttpMethod, url: String, body: Codable? = nil) async throws -> Result<T?, Error> {
        guard let url = URL(string: url) else {
            return .failure(Errors(code: nil, message: "Bad url"))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let httpBody = body {
            request.httpBody = try JSONEncoder().encode(httpBody)
        }
       
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let _ = response as? HTTPURLResponse else {
            return .failure(Errors(code: nil, message: "Invalid response"))
        }
        
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            return .success(parsedData)
        } catch {
            return .failure(error)
        }
    }
}
