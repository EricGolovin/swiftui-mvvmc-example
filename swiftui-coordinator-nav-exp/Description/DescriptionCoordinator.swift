//
//  DescriptionCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol DescriptionFlowCoordinator: BaseFlowCoordinator { }

class DescriptionCoordinator: BaseCoordinator {

    override var startView: AnyView {
        DescriptionView(
            viewModel: DescriptionViewModel(
                title: title,
                flowCoordinator: self
            )
        ).eraseToAnyView()
    }

    private let title: String

    init(title: String) {
        self.title = title
    }
}

extension DescriptionCoordinator: DescriptionFlowCoordinator { }
