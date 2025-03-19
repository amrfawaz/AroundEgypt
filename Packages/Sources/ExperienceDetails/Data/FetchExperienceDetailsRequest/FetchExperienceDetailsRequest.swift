//
//  FetchExperienceDetailsRequest.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import EnvironmentVariables
import Networking

public protocol FetchExperienceDetailsRequest {
    var id: String  { get }
    var endPoint: String { get }
    var request: URLRequest? { get }
}

extension FetchExperienceDetailsRequest {
    var request: URLRequest? {
        guard let url = URL(string: endPoint) else { return nil }

        let components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        guard let url = components?.url else { return nil }

        var request = URLRequest(url: url)
        request.setValue(EnvironmentVariables.accept.rawValue, forHTTPHeaderField: "accept")
        request.httpMethod = HTTPMethod.get.rawValue
        return request
    }
}


struct ExperienceDetailsRequest: FetchExperienceDetailsRequest {
    var id: String

    var endPoint: String {
        return EnvironmentVariables.recentExperiences + "/\(id)"
    }
}
