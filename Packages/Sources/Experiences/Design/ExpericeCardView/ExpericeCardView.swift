//
//  ExpericesCardView.swift
//  
//
//  Created by Amr Abd-Elhakim on 18/03/2025.
//

import CoreInterface
import SwiftUI

struct ExpericeCardView: View {
    @ObservedObject private var viewModel: ExpericeCardViewModel

    init(viewModel: ExpericeCardViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottom) {
                backgroundImage
                overlayView
                HStack(alignment: .top) {
                    content
                }
            }
            .frame(height: Style.Size.experienceCardImageHeight)

            HStack(alignment: .top) {
                bottomView
            }
        }
        .frame(height: Style.Size.experienceCardHeight)
        .onTapGesture {
            viewModel.subject.send(.didTapExperienceCard)
        }
    }
}

// MARK: - Card Image

private extension ExpericeCardView {
    var backgroundImage: some View {
        VStack {
            if let url = URL(string: viewModel.coverPhoto) {
                Rectangle()
                    .asyncImage(url: url)
            }
        }
        .clipShape(.rect(cornerRadius: Style.Spacing.md))

    }

    var overlayView: some View {
        Rectangle()
            .foregroundStyle(.black)
            .opacity(0.1)
            .clipShape(.rect(cornerRadius: Style.Spacing.md))

    }
}

// MARK: - Content Views

private extension ExpericeCardView {
    var content: some View {
        HStack(
            alignment: .bottom,
            spacing: Style.Spacing.xs
        ) {
            viewsView
            
            Spacer()
        }
        .padding(.horizontal, Style.Spacing.xs)
        .padding(.bottom, Style.Spacing.xs)
    }
}

// MARK: - Bottom View

private extension ExpericeCardView {
    var bottomView: some View {
        HStack(alignment: .center) {
            title

            Spacer()

            heartView
        }
    }

    var title: some View {
        Text(viewModel.experienceTitle)
            .typography(.button01)
            .foregroundStyle(.black)
    }
}

// MARK: - Heart View

private extension ExpericeCardView {
    var heartView: some View {
        HStack(
            alignment: .center,
            spacing: Style.Spacing.xs
        ) {
            likesCount
            heartIcon
                .onTapGesture {
                    viewModel.subject.send(.didTabHeartButton)
                }
        }
    }

    var heartIcon: some View {
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
}

// MARK: - Views View

private extension ExpericeCardView {
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

// MARK: - Preview

#if DEBUG
struct ExpericeCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            experience(.mockListCard)
        }
    }
    
    private static func experience(_ viewModel: ExpericeCardViewModel) -> some View {
        ExpericeCardView(viewModel: viewModel)
    }
    
}
#endif
