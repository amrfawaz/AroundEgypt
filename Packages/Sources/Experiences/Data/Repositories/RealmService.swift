//
//  RealmService.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import RealmManager
import SharedModels

public class RealmService {
    public init() {}

    public func fetchCachedExperiences(category: String) -> [Experience] {
        let loadedRealmExperiences: [RealmExperience] = RealmManager.shared.load(RealmExperience.self)
        let loadedExperiences = loadedRealmExperiences
            .filter { $0.type == category }
            .map { Experience(realmExperience: $0) }
        return loadedExperiences
    }

    func cacheExperiences(
        experiences: [Experience],
        category: String
    ) {
        let realmExperiences = experiences.map {
            RealmExperience(
                experience: $0,
                type: category
            )
        }
        RealmManager.shared.save(realmExperiences)
    }
}
