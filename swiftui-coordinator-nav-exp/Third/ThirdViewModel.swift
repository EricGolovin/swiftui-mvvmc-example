//
//  ThirdViewModel.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine

final class ThirdViewModel: ObservableObject {

    @Published var currentIdentifier = String(Int.random(in: 0...100))
    @Published var previousIdentifier: String

    private let flowCoordinator: any ThirdFlowCoordinator

    init(previousIdentifier: String, flowCoordinator: any ThirdFlowCoordinator) {
        self.previousIdentifier = previousIdentifier
        self.flowCoordinator = flowCoordinator
    }

    func nextTapped() {
        flowCoordinator.next(path: .fourth(thirdIdentifier: currentIdentifier))
    }

    func showDescriptionTapped() {
        flowCoordinator.next(path: .description)
    }

    func dismissTapped() {
        flowCoordinator.dismiss()
    }
}
