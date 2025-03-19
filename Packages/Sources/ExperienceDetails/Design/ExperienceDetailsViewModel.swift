//
//  ExperienceDetailsViewModel.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import Foundation
import EnvironmentVariables
import SharedModels
import Combine

public final class ExperienceDetailsViewModel: ObservableObject {
    enum ExpericeDetailsViewAction {
        case didTapShareButton
        case didTabHeartButton
    }

    @Published private var experience: Experience?

    let experienceId: String
    let subject = PassthroughSubject<ExpericeDetailsViewAction, Never>()

    private let fetchExperienceDetailsUseCase: FetchExperienceDetailsUseCase

    public init(
        experienceId: String,
        fetchExperienceDetailsUseCase: FetchExperienceDetailsUseCase
    ) {
        self.experienceId = experienceId
        self.fetchExperienceDetailsUseCase = fetchExperienceDetailsUseCase
    }

    var experienceTitle: String {
        experience?.title ?? ""
    }

    var coverPhoto: String {
        experience?.coverPhoto ?? ""
    }

    var description: String {
        experience?.description ?? ""
    }

    var detailedDescription: String {
        experience?.detailedDescription ?? ""
    }

    var numberOfLikes: String {
        "\(experience?.numberOfLikes ?? 0)"
    }

    var numberOfViews: String {
        "\(experience?.viewsCount ?? 0)"
    }

    var isLiked: Bool {
        experience?.isLiked ?? false
    }

    var shareLink: String {
        experience?.tourHtml ?? ""
    }

    func like() {
        experience?.isLiked = experience?.isLiked == true ? false : true

        if experience?.isLiked == true {
            experience?.numberOfLikes += 1
        } else {
            experience?.numberOfLikes -= 1
        }
    }
}

extension ExperienceDetailsViewModel {
    @MainActor
    func fetchExperienceDetails() async -> Void {
        
        do {
            let response = try await fetchExperienceDetailsUseCase.execute(request: ExperienceDetailsRequest(id: experienceId))
            DispatchQueue.main.async {
                self.experience = response.data
            }
        } catch {
            print("Fetch failed: \(error.localizedDescription)")
        }
    }
}
