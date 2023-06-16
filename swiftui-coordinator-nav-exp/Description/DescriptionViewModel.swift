//
//  DescriptionViewModel.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine

final class DescriptionViewModel: ObservableObject {

    var title: String

    private let flowCoordinator: any DescriptionFlowCoordinator

    init(title: String, flowCoordinator: any DescriptionFlowCoordinator) {
        self.title = title
        self.flowCoordinator = flowCoordinator
    }

    func dismissTapped() {
        flowCoordinator.dismiss()
    }
}
