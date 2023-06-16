//
//  SecondCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol SecondFlowCoordinator: BaseFlowCoordinator {
    func next(path: SecondCoordinator.Path)
}

final class SecondCoordinator: BaseCoordinator {

    enum Path {
        case third(secondIdentifier: String)
        case description
    }

    override var startView: AnyView {
        SecondView(
            viewModel: SecondViewModel(
                previousIdentifier: previousIdentifier,
                flowCoordinator: self
            )
        ).eraseToAnyView()
    }

    override var nextFlowView: CoordinatorView {
        switch nextPath {
        case .third(let secondIdentifier):
            return ThirdCoordinator(previousIdentifier: secondIdentifier).coordinatorView
        case .description:
            return DescriptionCoordinator(title: "Second description").coordinatorView
        }
    }

    private var nextPath: Path = .third(secondIdentifier: "")
    private let previousIdentifier: String

    init(previousIdentifier: String) {
        self.previousIdentifier = previousIdentifier
    }
}

extension SecondCoordinator: SecondFlowCoordinator {

    func next(path: SecondCoordinator.Path) {
        nextPath = path
        switch path {
        case .third:
            setNextPresentationStyle(.navigation)
        case .description:
            setNextPresentationStyle(.sheet)
        }
    }
}
