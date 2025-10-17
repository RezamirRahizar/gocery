//
//  UserDetailView.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI
import RxSwift
import RxRelay

struct UserDetailView: View {
    //Combine
    @ObservedObject var viewModel: UserDetailViewModel
    
    //RxSwift
    let rxVm: UserDetailViewModel
    @StateObject private var rxNameWrapper: ObservableObjectWrapper<String>
    @StateObject private var rxEmailWrapper: ObservableObjectWrapper<String?>
    
    init(viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        self.rxVm = viewModel
        
        _rxNameWrapper = StateObject(
            wrappedValue: ObservableObjectWrapper(
                viewModel.name.asObservable(),
                initial: viewModel.name.value
            )
        )
        
        _rxEmailWrapper = StateObject(
            wrappedValue: ObservableObjectWrapper(
                viewModel.email.asObservable(),
                initial: viewModel.email.value)
        )
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.user.name)
                .font(.largeTitle)
                .bold()
            Text(viewModel.user.email ?? "No email found")
                .font(.title2)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationTitle("User Details")
    }
}

#Preview {
    UserDetailView(viewModel: .init(user: User(id: UUID(), name: "John", email: nil)))
}
