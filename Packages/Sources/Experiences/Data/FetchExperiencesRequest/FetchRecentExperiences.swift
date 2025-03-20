//
//  FetchRecentExperiencesRequest.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import EnvironmentVariables

struct FetchRecentExperiencesRequest: FetchExperiencesRequest {
    var endPoint: String {
        return EnvironmentVariables.recentExperiences
    }
    var category: ExperienceCategory {
        .recent
    }
}
