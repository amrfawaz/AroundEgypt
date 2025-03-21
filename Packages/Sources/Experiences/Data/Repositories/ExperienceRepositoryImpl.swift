//
//  ExperienceRepositoryImpl.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import Networking

public class ExperienceRepositoryImpl: ExperienceRepository {
    private let api: ExperienceAPI

    public init(api: ExperienceAPI) {
        self.api = api
    }

    public func fetchExperiences<T: FetchExperiencesRequest>(request: T) async throws -> FetchExperiencesResponse {
        return try await api.fetchExperiences(request: request)
    }

    public func likeExperience<T: FetchExperiencesRequest>(request: T) async throws -> LikeExperienceResponse {
        return try await api.likeExperience(request: request)
    }
}

// MARK: - Mocks
#if DEBUG
final class MockExperienceRepository: ExperienceRepository {
    var result: Result<FetchExperiencesResponse, Error>?
    var likeExperienceResult: Result<LikeExperienceResponse, Error>?
    
    func fetchExperiences<T>(request: T) async throws -> FetchExperiencesResponse where T : FetchExperiencesRequest {
        print("Mock fetchExperiences called with request: \(request)")
        switch result {
        case .success(let response)?:
            return response
        case .failure(let error)?:
            throw error
        case .none:
            fatalError("Mock result not set")
        }
    }

    public func likeExperience<T: FetchExperiencesRequest>(request: T) async throws -> LikeExperienceResponse {
        print("Mock Like Experiences called with request: \(request)")
        switch likeExperienceResult {
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
