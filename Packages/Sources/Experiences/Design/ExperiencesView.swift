//
//  ExperiencesView.swift
//
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import SwiftUI
import CoreInterface
//import MovieDetails

public struct ExperiencesView: View {
    @ObservedObject private var viewModel: ExperiencesViewModel
    @State private var path = NavigationPath()

    public init(viewModel: ExperiencesViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        NavigationStack(path: $path) {
            content
                .padding(.all, Style.Spacing.md)
                .task {
                    await viewModel.fetchExperiences(category: .recommended)
                    await viewModel.fetchExperiences(category: .recent)
                }
                .alert(isPresented: Binding<Bool>(
                    get: { !viewModel.errorMessage.isEmpty },
                    set: { newValue in
                        if !newValue {
                            viewModel.errorMessage = ""
                        }
                    }
                )) {
                    Alert(
                        title: Text("Error"),
                        message: Text(viewModel.errorMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
        }
    }

    private var content: some View {
        ScrollView {
            if viewModel.isLoading {
                ProgressView()
            }
            VStack(spacing: Style.Spacing.md) {
                header
                    .padding(.bottom, Style.Spacing.sm)

                carouselView

                list
            }
        }
        .refreshable {
            await viewModel.fetchExperiences(category: .recent)
            await viewModel.fetchExperiences(category: .recommended)
        }
    }

    
}

// MARK: - Extenstion Carousel View
private extension ExperiencesView {
    var carouselView: some View {
        VStack(
            alignment: .leading,
            spacing: Style.Spacing.xxs
        ) {
            recommendedExperienceTitle

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: Style.Spacing.md) {
                    ForEach(viewModel.recommendedExperiences) { experience in
                        let expericeCardViewModel = ExpericeCardViewModel(experience: experience)

                        ExpericeCardView(viewModel: expericeCardViewModel)
                            .frame(width: Style.Size.experienceCardWidth)
                            .onReceive(expericeCardViewModel.subject) { action in
                                switch action {
                                case .didTabHeartButton:
                                    expericeCardViewModel.like()
                                case .didTapExperienceCard:
                                    path.append(experience)
                                }
                            }
                    }
                }
            }
        }
    }

    var recommendedExperienceTitle: some View {
        Text(ExperienceCategory.recommended.title)
            .typography(.heading02)
            .foregroundStyle(.black)
    }
}

// MARK: - Extenstion List View

private extension ExperiencesView {
    var list: some View {
        LazyVStack {
            ForEach(viewModel.recentExperiences) { experience in
                let expericeCardViewModel = ExpericeCardViewModel(experience: experience)

                ExpericeCardView(viewModel: expericeCardViewModel)
                    .onReceive(expericeCardViewModel.subject) { action in
                        switch action {
                        case .didTabHeartButton:
                            expericeCardViewModel.like()
                        case .didTapExperienceCard:
                            path.append(experience)
                        }
                    }
            }
        }
    }
}

// MARK: - Extenstion ExperiencesView

private extension ExperiencesView {
    private var header: some View {
        VStack(
            alignment: .leading,
            spacing: Style.Spacing.xxs
        ) {
            title
            subTitle
        }
    }

    private var title: some View {
        Text(viewModel.pageTitle)
            .typography(.heading02)
            .foregroundStyle(.black)
    }

    private var subTitle: some View {
        Text(viewModel.pageSubTitle)
            .typography(.body02)
            .foregroundStyle(.black)
    }
}
