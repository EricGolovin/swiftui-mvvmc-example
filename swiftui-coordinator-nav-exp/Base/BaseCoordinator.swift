//
//  BaseCoordinator.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import Combine
import SwiftUI

protocol BaseFlowCoordinator: AnyObject {
    func dismiss()
}

enum NextPresentationStyle {
    case navigation
    case sheet
}

class BaseCoordinator: BaseFlowCoordinator, ObservableObject {

    @Published var isNavigationActive = false
    @Published var isSheetPresented = false

    var startView: AnyView {
        fatalError("Has to be overridden by the concrete type.")
    }

    var nextFlowView: CoordinatorView {
        assertionFailure("Has to be overridden by the concrete type.")
        return CoordinatorView(coordinator: BaseCoordinator())
    }

    final var coordinatorView: CoordinatorView {
        CoordinatorView(coordinator: self)
    }

    private var dismissAction: DismissAction?
    
    func setDismissAction(_ dismissAction: DismissAction) {
        self.dismissAction = dismissAction
    }

    func setNextPresentationStyle(_ nextPresentationStyle: NextPresentationStyle) {
        switch nextPresentationStyle {
        case .navigation:
            isNavigationActive = true
        case .sheet:
            isSheetPresented = true
        }
    }

    func dismiss() {
        dismissAction?()
    }
}
