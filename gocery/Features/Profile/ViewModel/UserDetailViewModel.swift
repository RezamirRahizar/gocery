//
//  UserDetailViewModel.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import Foundation
import Combine

final class UserDetailViewModel: ObservableObject {
    let user: User
    
    init(user: User) {
        self.user = user
    }
}
