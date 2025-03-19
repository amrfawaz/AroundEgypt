//
//  ExperienceDetailsAPI.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import Networking

public protocol ExperienceDetailsAPIProtocol {
    func fetchExperienceDetails(request: FetchExperienceDetailsRequest) async throws -> FetchExperienceDetailsResponse
}

public class ExperienceDetailsAPI: ExperienceDetailsAPIProtocol {
    private let networkManager: NetworkManager
    private let urlSession = URLSession.shared

    public init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }

    public func fetchExperienceDetails(request: FetchExperienceDetailsRequest) async throws -> FetchExperienceDetailsResponse {
        guard let url = request.request?.url else { throw NetworkError.invalidURL }

        print(url.absoluteString)

        guard let request = request.request else { throw NetworkError.invalidRequest }

        do {
            return try await networkManager.request(request: request, of: FetchExperienceDetailsResponse.self)
        } catch {
            throw error
        }
    }
}
