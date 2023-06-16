//
//  ThirdCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol ThirdFlowCoordinator: BaseFlowCoordinator {
    func next(path: ThirdCoordinator.Path)
}

final class ThirdCoordinator: BaseCoordinator {

    enum Path {
        case fourth(thirdIdentifier: String)
        case description
    }

    override var startView: AnyView {
        ThirdView(
            viewModel: ThirdViewModel(
                previousIdentifier: previousIdentifier,
                flowCoordinator: self
            )
        ).eraseToAnyView()
    }

    override var nextFlowView: CoordinatorView {
        switch nextPath {
        case .description:
            return DescriptionCoordinator(title: "Third description").coordinatorView
        case .fourth(thirdIdentifier: let thirdIdentifier):
            return FourthCoordinator(previousIdentifier: thirdIdentifier).coordinatorView
        }
    }

    private var nextPath: Path = .description
    private let previousIdentifier: String

    init(previousIdentifier: String) {
        self.previousIdentifier = previousIdentifier
    }
}

extension ThirdCoordinator: ThirdFlowCoordinator {

    func next(path: ThirdCoordinator.Path) {
        nextPath = path
        switch path {
        case .description:
            setNextPresentationStyle(.sheet)
        case .fourth:
            setNextPresentationStyle(.navigation)
        }
    }
}

