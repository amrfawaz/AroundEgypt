//
//  FetchExperiencesUseCase.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation

import Foundation
import Networking

public class FetchExperiencesUseCase {
    private let repository: ExperienceRepository

    public init(repository: ExperienceRepository) {
        self.repository = repository
    }

    func execute<T: FetchExperiencesRequest>(request: T) async throws -> FetchExperiencesResponse {
        return try await repository.fetchExperiences(request: request)
    }
}

// MARK: - Mocks

#if DEBUG
final class MockFetchExperiencesUseCase: FetchExperiencesUseCase {
    var responseData: Data?
    var responseError: NetworkError?

    override func execute<T>(request: T) async throws -> FetchExperiencesResponse where T : FetchExperiencesRequest {
        if let error = responseError {
            throw error
        }

        guard let data = responseData else {
            throw NetworkError.noData
        }

        do {
            let decodedResponse = try JSONDecoder().decode(FetchExperiencesResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingError
        }
    }
}
#endif
