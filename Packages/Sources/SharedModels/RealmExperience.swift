//
//  RealmExperience.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import RealmSwift
import RealmManager

public class RealmExperience: Object, Codable {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var coverPhoto: String = ""
    @objc dynamic var shortDescription: String = ""
    @objc dynamic var viewsCount: Int = 0
    @objc dynamic var numberOfLikes: Int = 0
    @objc dynamic var detailedDescription: String = ""
    dynamic var isLiked: Bool? = false
    @objc dynamic var tourHtml: String = ""
    @objc public dynamic var type: String = ""
    @objc dynamic var uniqueKey: String = ""

    public override static func primaryKey() -> String? {
        return "uniqueKey"
    }
}

extension RealmExperience {
    public convenience init(
        experience: Experience,
        type: String
    ) {
        self.init()
        self.id = experience.id
        self.title = experience.title
        self.coverPhoto = experience.coverPhoto
        self.shortDescription = experience.description
        self.viewsCount = experience.viewsCount
        self.numberOfLikes = experience.numberOfLikes
        self.detailedDescription = experience.detailedDescription
        self.isLiked = experience.isLiked
        self.tourHtml = experience.tourHtml
        self.type = type
        self.updateUniqueKey()
    }

    public func updateUniqueKey() {
        self.uniqueKey = "\(id)_\(type)"
    }
}
