//
//  FetchExperiencesResponse.swift
//  
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation

public struct FetchExperiencesResponse: Codable {
    let data: [Experience]

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}
