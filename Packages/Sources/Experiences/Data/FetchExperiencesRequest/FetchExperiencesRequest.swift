//
//  FetchExperiencesRequest.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import EnvironmentVariables
import Networking

public protocol FetchExperiencesRequest {
    var endPoint: String { get }
    var request: URLRequest? { get }
}

extension FetchExperiencesRequest {
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
