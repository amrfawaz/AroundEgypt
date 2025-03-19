//
//  FetchRecommendedExperiencesRequest.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import EnvironmentVariables

struct FetchRecommendedExperiencesRequest: FetchExperiencesRequest {
    var endPoint: String {
        return EnvironmentVariables.recommendedExperiencesUrl
    }
}
