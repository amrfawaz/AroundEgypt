//
//  LikeExperienceRequest.swift
//  
//
//  Created by Amr Abd-Elhakim on 21/03/2025.
//

import Foundation
import EnvironmentVariables

struct LikeExperienceRequest: FetchExperiencesRequest {
    let id: String

    var endPoint: String {
        return EnvironmentVariables.likeExperience(id: id)
    }
    var category: ExperienceCategory {
        .recent
    }
}
