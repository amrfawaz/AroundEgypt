//
//  EnvironmentVariables.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation

public enum EnvironmentVariables: String {
    case baseUrl = "aroundegypt.34ml.com/api"
    case version = "/v2"
    case experiencesEndPoint = "/experiences"
    case likeExperienceEndpoint = "/like"
    case accept = "application/json"
    case searchUrls = "https://api.dictionaryapi.dev/api/v2/entries/en"

    
    public var recommendedExperiencesUrl: String {
        EnvironmentVariables.baseUrl.rawValue +
        EnvironmentVariables.version.rawValue +
        EnvironmentVariables.experiencesEndPoint.rawValue +
        "?filter[recommended]=true"
    }

    public var recentExperiences: String {
        EnvironmentVariables.baseUrl.rawValue +
        EnvironmentVariables.version.rawValue +
        EnvironmentVariables.experiencesEndPoint.rawValue
    }

    public func experience(id: String) -> String {
        EnvironmentVariables.baseUrl.rawValue +
        EnvironmentVariables.version.rawValue +
        EnvironmentVariables.experiencesEndPoint.rawValue
        + id
    }

    public func likeexperience(id: String) -> String {
        EnvironmentVariables.baseUrl.rawValue +
        EnvironmentVariables.version.rawValue +
        EnvironmentVariables.experiencesEndPoint.rawValue +
        id +
        EnvironmentVariables.likeExperienceEndpoint.rawValue
    }
}
