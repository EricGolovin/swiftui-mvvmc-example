//
//  SecondView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct SecondView: View {

    @StateObject private var viewModel: SecondViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("previousIdentifier = \(viewModel.previousIdentifier)")
            Text("currentIdentifier = \(viewModel.currentIdentifier)")
            Button("Push third view") {
                viewModel.nextTapped()
            }
            Button("Show description") {
                viewModel.showDescriptionTapped()
            }
            Button("Dismiss") {
                viewModel.dismissTapped()
            }
        }.navigationTitle("Second View")
    }

    init(viewModel: SecondViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
