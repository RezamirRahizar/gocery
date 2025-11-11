//
//  AppCoordinator.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func start() -> some View {
//        UserListView(viewModel: UserListViewModel()) { user in
//            self.showUserDetail(for: user)
//        }
        UserListView()
            .navigationDestination(for: User.self) { user in
                UserDetailView(viewModel: UserDetailViewModel(user: user))
            }
    }
    
    private func showUserDetail(for user: User) {
        path.append(user)
    }
}
