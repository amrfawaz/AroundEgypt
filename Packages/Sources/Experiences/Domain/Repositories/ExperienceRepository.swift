//
//  ExperienceRepository.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation

public protocol ExperienceRepository {
    func fetchExperiences<T: FetchExperiencesRequest>(request: T) async throws -> FetchExperiencesResponse
    func likeExperience<T: FetchExperiencesRequest>(request: T) async throws -> LikeExperienceResponse
}
