//
//  UserListViewModel.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import Foundation
import Combine

final class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        loadUsers()
    }
    
    private func loadUsers() {
        //mock fetch users
        users = [
            User(id: UUID(), name: "John", email: nil),
            User(id: UUID(), name: "Abdul", email: "abdul@email.com"),
            User(id: UUID(), name: "Ching", email: "cing@hotmail.com"),
        ]
    }
}
