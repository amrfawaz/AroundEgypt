//
//  FetchExperienceDetailsUseCase.swift
//  
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import Networking

public protocol FetchExperienceDetailsUseCase {
    func execute<T: FetchExperienceDetailsRequest>(request: T) async throws -> FetchExperienceDetailsResponse
}

public final class DefaultFetchMovieDetailsUseCase: FetchExperienceDetailsUseCase {
    private let repository: ExperienceDetailsRepository

    public init(repository: ExperienceDetailsRepository) {
        self.repository = repository
    }

    public func execute<T: FetchExperienceDetailsRequest>(request: T) async throws -> FetchExperienceDetailsResponse {
        return try await repository.fetchExperienceDetails(request: request)
    }
}

// MARK: - Mocks

#if DEBUG
final class MockDefaultFetchMovieDetailsUseCase: FetchExperienceDetailsUseCase {
    var responseData: Data?
    var responseError: NetworkError?

    func execute<T>(request: T) async throws -> FetchExperienceDetailsResponse where T : FetchExperienceDetailsRequest {
        if let error = responseError {
            throw error
        }

        guard let data = responseData else {
            throw NetworkError.noData
        }

        do {
            let decodedResponse = try JSONDecoder().decode(FetchExperienceDetailsResponse.self, from: data)
            return decodedResponse
        } catch {
            throw NetworkError.decodingError
        }
    }
}
#endif
