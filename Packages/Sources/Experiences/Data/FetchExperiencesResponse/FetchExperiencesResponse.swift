//
//  FetchExperiencesResponse.swift
//  
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import SharedModels

public struct FetchExperiencesResponse: Codable {
    let data: [Experience]

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
