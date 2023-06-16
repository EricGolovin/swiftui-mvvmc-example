//
//  DescriptionView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct DescriptionView: View {

    @StateObject var viewModel: DescriptionViewModel

    var body: some View {
        VStack(spacing: 20) {
            Button("Dismiss") {
                viewModel.dismissTapped()
            }
            Text(viewModel.title)
        }
    }

    init(viewModel: DescriptionViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
