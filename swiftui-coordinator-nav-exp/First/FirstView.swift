//
//  FirstView.swift
//  swiftui-coordinator-nav-exp
//
//  Created by Eric Golovin on 16/6/23.
//

import SwiftUI

struct FirstView: View {

    @StateObject private var viewModel: FirstViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("currentIdentifier = \(viewModel.currentIdentifier)")
            Button("Push second view") {
                viewModel.nextTapped()
            }
            Button("Show description") {
                viewModel.showDescriptionTapped()
            }
        }.navigationTitle("First View")
    }

    init(viewModel: FirstViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
}
