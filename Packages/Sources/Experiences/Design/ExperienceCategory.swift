//
//  ExperienceCategory.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation

public enum ExperienceCategory: String {
    case recent
    case recommended

    var title: String {
        switch self {
        case .recent:
            "Most Recent"
        case .recommended:
            "Recommended Experiences"
        }
    }
}
