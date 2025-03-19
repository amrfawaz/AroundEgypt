//
//  ExperiencesViewModel.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import Foundation
import Combine
//import MovieDetails

final public class ExperiencesViewModel: ObservableObject {
    @Published var recentExperiences: [Experience] = []
    @Published var recommendedExperiences: [Experience] = []
    @Published var errorMessage: String = ""

    public var pageTitle: String {
        "Welcome!"
    }

    public var pageSubTitle: String {
        "Now you can explore any experience in 360 degrees and get all the details about it all in one place."
    }

    var isLoading: Bool = false

    private let fetchExperiencesUseCase: FetchExperiencesUseCase

    public init(fetchExperiencesUseCase: FetchExperiencesUseCase) {
        self.fetchExperiencesUseCase = fetchExperiencesUseCase
    }

    private func createExperiencesRequest(category: ExperienceCategory) -> FetchExperiencesRequest {
        switch category {
        case .recent:
            FetchRecentExperiencesRequest()
        case .recommended:
            FetchRecommendedExperiencesRequest()
        }
    }

    func resetExperiences() {
        DispatchQueue.main.async {
            self.recentExperiences = []
            self.recommendedExperiences = []
        }
        self.isLoading = false
    }
}

extension ExperiencesViewModel {
    func fetchExperiences(
        category: ExperienceCategory,
        refreshExperiences: Bool = false
    ) async {
        if refreshExperiences {
            resetExperiences()
        }

        guard !isLoading else { return }
        isLoading = true

        do {
            let response = try await fetchExperiencesUseCase.execute(request: createExperiencesRequest(category: category))
            DispatchQueue.main.async {
                switch category {
                case .recent:
                    self.recentExperiences.append(contentsOf: response.data)
                case .recommended:
                    self.recommendedExperiences.append(contentsOf: response.data)
                }
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        }
    }
}
