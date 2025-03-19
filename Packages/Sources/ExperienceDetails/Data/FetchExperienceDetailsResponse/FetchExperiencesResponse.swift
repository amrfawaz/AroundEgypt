//
//  FetchExperienceDetailsResponse.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import SharedModels

public struct FetchExperienceDetailsResponse: Codable {
    let data: Experience

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
