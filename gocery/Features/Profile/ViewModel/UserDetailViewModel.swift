//
//  UserDetailViewModel.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import Foundation
import Combine
import RxSwift
import RxCocoa

final class UserDetailViewModel: ObservableObject {
    let user: User
    
    let name: BehaviorRelay<String>
    let email: BehaviorRelay<String?>
    
    init(user: User) {
        self.user = user
        
        self.name = BehaviorRelay(value: user.name)
        self.email = BehaviorRelay(value: user.email)
    }
}
