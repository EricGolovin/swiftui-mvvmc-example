//
//  FirstViewModel.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine

final class FirstViewModel: ObservableObject {

    @Published var currentIdentifier: String

    private let flowCoordinator: any FirstFlowCoordinator

    init(flowCoordinator: any FirstFlowCoordinator) {
        self.flowCoordinator = flowCoordinator
        currentIdentifier = String(Int.random(in: 2...100))
    }

    func nextTapped() {
        flowCoordinator.next(path: .second(firstIdentifier: currentIdentifier))
    }

    func showDescriptionTapped() {
        flowCoordinator.next(path: .description)
    }
}

