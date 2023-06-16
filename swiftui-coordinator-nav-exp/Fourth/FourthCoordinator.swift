//
//  FourthCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol FourthFlowCoordinator: BaseFlowCoordinator {
    func next(path: FourthCoordinator.Path)
}

final class FourthCoordinator: BaseCoordinator {

    enum Path {
        case description
    }

    override var startView: AnyView {
        FourthView(
            viewModel: FourthViewModel(
                previousIdentifier: previousIdentifier,
                flowCoordinator: self
            )
        ).eraseToAnyView()
    }

    override var nextFlowView: CoordinatorView {
        switch nextPath {
        case .description:
            return DescriptionCoordinator(title: "Second description").coordinatorView
        }
    }

    private var nextPath: Path = .description
    private let previousIdentifier: String

    init(previousIdentifier: String) {
        self.previousIdentifier = previousIdentifier
    }
}

extension FourthCoordinator: FourthFlowCoordinator {

    func next(path: FourthCoordinator.Path) {
        nextPath = path
        switch path {
        case .description:
            setNextPresentationStyle(.sheet)
        }
    }
}
