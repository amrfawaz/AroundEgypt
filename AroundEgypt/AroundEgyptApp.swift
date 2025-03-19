//
//  AroundEgyptApp.swift
//  AroundEgypt
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import SwiftUI
import Experiences

@main
struct WordFinderApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = ExperienceRepositoryImpl(api: ExperienceAPI())
            let experiencesUseCase = FetchExperiencesUseCase(repository: repository)
            let viewModel = ExperiencesViewModel(fetchExperiencesUseCase: experiencesUseCase)
            
            ExperiencesView(viewModel: viewModel)
        }
    }
}
