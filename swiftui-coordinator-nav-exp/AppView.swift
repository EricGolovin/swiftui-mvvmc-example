//
//  AppView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

@main
struct AppView: App {

    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    FirstCoordinator().coordinatorView
                }
            } else {
                NavigationView {
                    FirstCoordinator().coordinatorView
                }
            }
        }
    }
}
