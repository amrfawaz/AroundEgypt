//
//  ExperienceDetailsRepositoryImpl.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import Networking

public final class ExperienceDetailsRepositoryImpl: ExperienceDetailsRepository {
    private let api: ExperienceDetailsAPI

    public init(api: ExperienceDetailsAPI) {
        self.api = api
    }

    public func fetchExperienceDetails<T: FetchExperienceDetailsRequest>(request: T) async throws -> FetchExperienceDetailsResponse {
        return try await api.fetchExperienceDetails(request: request)
    }
}

// MARK: - Mocks

#if DEBUG
final class MockExperienceRepository: ExperienceDetailsRepository {
    var result: Result<FetchExperienceDetailsResponse, Error>?
    
    func fetchExperienceDetails<T>(request: T) async throws -> FetchExperienceDetailsResponse where T : FetchExperienceDetailsRequest {
        print("Mock fetchExperience Details called with request: \(request)")
        switch result {
        case .success(let response)?:
            return response
        case .failure(let error)?:
            throw error
        case .none:
            fatalError("Mock result not set")
        }
    }
}
#endif
