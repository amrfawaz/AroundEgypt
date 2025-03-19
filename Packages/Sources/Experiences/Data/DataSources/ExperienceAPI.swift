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
    private lazy var response = FetchExperiencesResponse(data: [])

    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    public func fetchExperiences(request: FetchExperiencesRequest) async throws -> FetchExperiencesResponse {
        guard let url = request.request?.url else { throw NetworkError.invalidURL }

        print(url.absoluteString)

        guard let request = request.request else { throw NetworkError.invalidRequest }

        do {
            return try await networkManager.request(request: request, of: FetchExperiencesResponse.self)
        } catch {
            throw error
        }
    }
}
