//
//  FourthViewModel.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine

final class FourthViewModel: ObservableObject {

    @Published var currentIdentifier = String(Int.random(in: 0...100))
    @Published var previousIdentifier: String

    private let flowCoordinator: any FourthFlowCoordinator

    init(previousIdentifier: String, flowCoordinator: any FourthFlowCoordinator) {
        self.previousIdentifier = previousIdentifier
        self.flowCoordinator = flowCoordinator
    }

    func showDescriptionTapped() {
        flowCoordinator.next(path: .description)
    }

    func dismissTapped() {
        flowCoordinator.dismiss()
    }
}

