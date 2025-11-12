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

final class UserListViewModel {
    let users: BehaviorRelay<[User]> = BehaviorRelay(value: [])
    
    private let disposeBag = DisposeBag()
    
    func loadUsers() {
        print("Loading Users")
        //Mock loading users
        Observable.just([
            User(id: UUID(), name: "Samad", email: "samad@gmail.com"),
        ])
        .delay(.milliseconds(500), scheduler: MainScheduler.instance)
        .bind(to: users)
        .disposed(by: disposeBag)
    }
}
