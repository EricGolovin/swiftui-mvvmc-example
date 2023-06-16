//
//  CoordinatorView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct CoordinatorView: View {

    @Environment(\.dismiss) private var dismiss
    @StateObject private var coordinator: BaseCoordinator

    var body: some View {
        ZStack {
            NavigationLink(
                isActive: $coordinator.isNavigationActive,
                destination: {
                    coordinator.isNavigationActive ? coordinator.nextFlowView : nil
                }, label: {
                    EmptyView()
                }
            )
            coordinator.startView
        }
        .sheet(isPresented: $coordinator.isSheetPresented) {
            NavigationView {
                coordinator.nextFlowView
            }
        }
        .onAppear {
            coordinator.setDismissAction(dismiss)
        }
    }

    init(coordinator: BaseCoordinator) {
        _coordinator = StateObject(wrappedValue: coordinator)
    }
}
