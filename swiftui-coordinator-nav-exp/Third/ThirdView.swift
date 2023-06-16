//
//  ThirdView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct ThirdView: View {

    @StateObject private var viewModel: ThirdViewModel

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
        }.navigationTitle("Third View")
    }

    init(viewModel: ThirdViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
