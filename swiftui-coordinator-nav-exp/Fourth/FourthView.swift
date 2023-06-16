//
//  FourthView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct FourthView: View {

    @StateObject private var viewModel: FourthViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("previousIdentifier = \(viewModel.previousIdentifier)")
            Text("currentIdentifier = \(viewModel.currentIdentifier)")
            Button("Show description") {
                viewModel.showDescriptionTapped()
            }
            Button("Dismiss") {
                viewModel.dismissTapped()
            }
        }
    }

    init(viewModel: FourthViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
