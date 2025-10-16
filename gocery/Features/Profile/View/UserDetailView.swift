//
//  UserDetailView.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI

struct UserDetailView: View {
    @ObservedObject var viewModel: UserDetailViewModel
    
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
