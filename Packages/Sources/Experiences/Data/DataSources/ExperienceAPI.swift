//
//  ExperienceAPI.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import EnvironmentVariables
import Networking

public protocol ExperienceAPIProtocol {
    func fetchExperiences(request: FetchExperiencesRequest) async throws -> FetchExperiencesResponse
}

public class ExperienceAPI: ExperienceAPIProtocol {    
    private let networkManager: NetworkManager
    private let urlSession = URLSession.shared
    private let realmService = RealmService()


    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    public func fetchExperiences(request: FetchExperiencesRequest) async throws -> FetchExperiencesResponse {
        guard let url = request.request?.url else { throw NetworkError.invalidURL }

        print(url.absoluteString)

        guard let urlRequest = request.request else { throw NetworkError.invalidRequest }
        
        do {
            let response = try await networkManager.request(request: urlRequest, of: FetchExperiencesResponse.self)
            self.realmService.cacheExperiences(experiences: response.data, category: request.category.rawValue)
            return response
        } catch {
            return FetchExperiencesResponse(data: self.realmService.fetchCachedExperiences(category: request.category.rawValue))
        }
    }
}
