//
//  ExperienceDetailsView.swift
//
//
//  Created by Amr Abd-Elhakim on 19/03/2025.
//

import SwiftUI
import CoreInterface

public struct ExperienceDetailsView: View {
    @ObservedObject var viewModel: ExperienceDetailsViewModel
    @Binding var path: NavigationPath

    public init(
        viewModel: ExperienceDetailsViewModel,
        path: Binding<NavigationPath>
    ) {
        self.viewModel = viewModel
        self._path = path
    }

    public var  body: some View {
        ScrollView {
            VStack(spacing: .zero) {
                ZStack(alignment: .topLeading) {
                    backgroundImage

                    headerButtons
                        .padding()
                }
                .frame(height: Style.Size.experienceImageCoverHeight)

                details

                Spacer()
            }
            .navigationBarBackButtonHidden(true)
            .task {
                await viewModel.fetchExperienceDetails()
            }
        }
        .onReceive(viewModel.subject) { action in
            switch action {
            case .didTabHeartButton:
                viewModel.like()
            case .didTapShareButton:
                share()
            }
        }

    }
}

// MARK: - Top Image View
private extension ExperienceDetailsView {
    var backgroundImage: some View {
        VStack {
            if let url = URL(string: viewModel.coverPhoto) {
                Rectangle()
                    .asyncImage(url: url)
            }
        }
    }

    var headerButtons: some View {
        HStack {
            backButton
            Spacer()
        }
    }

    var backButton: some View {
        Button(action: {
            path.removeLast()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.black)
                .padding(10)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 3)
        }
    }

    var titleView: some View {
        VStack(
            alignment: .leading,
            spacing: Style.Spacing.xs
        ) {
            HStack(alignment: .center) {
                title

                Spacer()
                
                iconsView
            }
        }
    }

    var title: some View {
        Text(viewModel.experienceTitle)
            .typography(.heading03)
            .foregroundStyle(.black)
    }

    var iconsView: some View {
        HStack(
            alignment: .center,
            spacing: Style.Spacing.sm
        ) {
            shareButton
                .onTapGesture {
                    viewModel.subject.send(.didTapShareButton)
                }

            heartButton
                .onTapGesture {
                    viewModel.subject.send(.didTabHeartButton)
                }

            likesCount
        }
    }

    var shareButton: some View {
        Image(systemName: "square.and.arrow.up")
            .resizable()
            .frame(width: 20, height: 22)
            .foregroundColor(.black)
    }

    var heartButton: some View {
        Image(systemName: viewModel.isLiked ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 20, height: 18)
            .foregroundColor(.red)
    }

    var likesCount: some View {
        Text(viewModel.numberOfLikes)
            .typography(.button02)
            .foregroundStyle(.black)
    }

    func share() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [viewModel.shareLink], applicationActivities: nil)
        rootViewController.present(activityViewController, animated: true, completion: nil)
    }
}

// MARK: - Views View

private extension ExperienceDetailsView {
    var viewsView: some View {
        HStack(
            alignment: .center,
            spacing: Style.Spacing.xs
        ) {
            viewsCount
            eyeIcon
        }
    }

    var viewsCount: some View {
        Text(viewModel.numberOfViews)
            .typography(.button02)
            .foregroundStyle(.white)
    }

    var eyeIcon: some View {
        Image(systemName: "eye")
            .resizable()
            .frame(width: 15, height: 10)
            .foregroundColor(.white)
    }
}

// MARK: - Details View

extension ExperienceDetailsView {
    var details: some View {
        VStack(
            alignment: .leading,
            spacing: Style.Spacing.lg
        ) {
            titleView

            infoView(
                title: "Description",
                value: viewModel.detailedDescription
            )
        }
        .padding()
    }

    func infoView(title: String, value: String) -> some View {
        VStack(
            alignment: .leading,
            spacing: Style.Spacing.xxs
        ) {
            Text(title)
                .typography(.heading02)
                .foregroundStyle(.black)

            Text(value)
                .typography(.caption02)
                .foregroundStyle(.black)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}
