//
//  FirstCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol FirstFlowCoordinator: BaseFlowCoordinator {
    func next(path: FirstCoordinator.Path)
}

final class FirstCoordinator: BaseCoordinator {

    enum Path {
        case second(firstIdentifier: String)
        case description
    }

    override var startView: AnyView {
        FirstView(
            viewModel: FirstViewModel(flowCoordinator: self)
        ).eraseToAnyView()
    }

    override var nextFlowView: CoordinatorView {
        switch nextPath {
        case .second(let firstIdentifier):
            return SecondCoordinator(previousIdentifier: firstIdentifier).coordinatorView
        case .description:
            return DescriptionCoordinator(title: "First description").coordinatorView
        }
    }

    private var nextPath: Path = .second(firstIdentifier: "")
}

extension FirstCoordinator: FirstFlowCoordinator {

    func next(path: FirstCoordinator.Path) {
        nextPath = path
        switch path {
        case .second:
            setNextPresentationStyle(.navigation)
        case .description:
            setNextPresentationStyle(.sheet)
        }
    }
}
