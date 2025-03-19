//
//  Container.swift
//  
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import ExperienceDetails

final class Container {
    static func getExperienceDetailsViewModel(experienceId: String) -> ExperienceDetailsViewModel {
        var fetchExperienceDetailsUseCase: FetchExperienceDetailsUseCase {
            let experienceDetailsRepository = ExperienceDetailsRepositoryImpl(api: ExperienceDetailsAPI())
            return DefaultFetchMovieDetailsUseCase(repository: experienceDetailsRepository)
        }

        return ExperienceDetailsViewModel(
            experienceId: experienceId,
            fetchExperienceDetailsUseCase: fetchExperienceDetailsUseCase
        )
    }
}
