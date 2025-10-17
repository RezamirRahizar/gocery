//
//  UserListViewModel.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import Foundation
import Combine
import RxSwift
import RxCocoa

final class UserListViewModel: ObservableObject {
    @Published var users: [User] = []
    
    let rxUsers: BehaviorRelay<[User]> = BehaviorRelay(value: [])
    
    private let disposeBag = DisposeBag()
    
    init() {
        let rand = Int.random(in: 0...1)
        switch rand {
        case 0:
            loadUsers()
        case 1:
            loadRxUsers()
        default:
            print("Do nothing")
        }
    }
    
    //loading users using Combine
    private func loadUsers() {
        print("Loading Combine users")
        users = [
            User(id: UUID(), name: "John", email: nil),
            User(id: UUID(), name: "Abdul", email: "abdul@email.com"),
            User(id: UUID(), name: "Ching", email: "cing@hotmail.com"),
        ]
    }
    
    //loading users using RxSwift
    private func loadRxUsers() {
        print("Loading Rx Users")
        Observable.just([
            User(id: UUID(), name: "John", email: nil),
            User(id: UUID(), name: "Abdul", email: "abdul@email.com"),
            User(id: UUID(), name: "Ching", email: "cing@hotmail.com"),
        ])
        .delay(.milliseconds(500), scheduler: MainScheduler.instance)
        .bind(to: rxUsers)
        .disposed(by: disposeBag)
    }
}
