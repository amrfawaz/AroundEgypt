//
//  ExperienceDetailsRepository.swift
//  
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation

public protocol ExperienceDetailsRepository {
    func fetchExperienceDetails<T: FetchExperienceDetailsRequest>(request: T) async throws -> FetchExperienceDetailsResponse
}
