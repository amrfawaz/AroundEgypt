//
//  ExpericeCardViewModel.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import EnvironmentVariables
import Combine
import SharedModels

enum ExpericesCardViewAction {
    case didTapExperienceCard
    case didTabHeartButton
}

final class ExpericeCardViewModel: ObservableObject {
    @Published private var experience: Experience

    let subject = PassthroughSubject<ExpericesCardViewAction, Never>()

    init(experience: Experience) {
        self.experience = experience
    }

    var experienceId: String {
        experience.id
    }

    var experienceTitle: String {
        experience.title
    }

    var coverPhoto: String {
        experience.coverPhoto
    }

    var description: String {
        experience.description
    }

    var numberOfLikes: String {
        "\(experience.numberOfLikes)"
    }

    var numberOfViews: String {
        "\(experience.viewsCount)"
    }

    var isLiked: Bool {
        experience.isLiked ?? false
    }

    func like() {
        experience.isLiked = experience.isLiked == true ? false : true

        if experience.isLiked == true {
            experience.numberOfLikes += 1
        } else {
            experience.numberOfLikes -= 1
        }
    }
}

#if DEBUG
extension ExpericeCardViewModel {
    static var mockListCard: ExpericeCardViewModel {
        ExpericeCardViewModel(experience: .mockedExperience)
    }
}
#endif
