//
//  UserListView.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI
import RxSwift
import RxRelay


struct UserListView: View {
    init() {
        
    }

    var body: some View {
        NavigationView {
            UserListContentView()
        }
    }
}

private struct UserListContentView: UIViewControllerRepresentable {
    typealias UIViewControllerType = UserListViewController
    
    
    func makeUIViewController(context: Context) -> UserListViewController {
        let viewModel = UserListViewModel()
        return UserListViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: UserListViewController, context: Context) {
        // Update the ViewController here
    }
    
}

#Preview {
    UserListView()
}
