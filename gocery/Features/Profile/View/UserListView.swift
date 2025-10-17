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
    //Combine
    @ObservedObject var viewModel: UserListViewModel
    
    //RxSwift
    let vm: UserListViewModel
    @StateObject private var rxUserWrapper: ObservableObjectWrapper<[User]>
    
    var onUserSelected: (User) -> Void
    
    init(viewModel: UserListViewModel, onUserSelected: @escaping (User) -> Void) {
        self.viewModel = viewModel
        self.vm = viewModel
        _rxUserWrapper = StateObject(
            wrappedValue: ObservableObjectWrapper(
                viewModel.rxUsers.asObservable(),
                initial: viewModel.rxUsers.value
            )
        )
        self.onUserSelected = onUserSelected
    }
    
    var body: some View {
       NavigationView {
           List(getUserData()) { user in
               Button {
                   onUserSelected(user)
               } label: {
                   HStack {
                       VStack(alignment: .leading) {
                           Text(user.name)
                               .font(.headline)
                           Text(user.email ?? "No email provided")
                               .font(.subheadline)
                               .foregroundColor(.gray)
                       }
                   }
               }
           }
           .navigationTitle("Users")
       }
   }
    
    private func getUserData() -> [User] {
        let randNumber = Int.random(in: 0..<1)
        switch randNumber {
        case 0:
            return viewModel.users
        case 1:
            return rxUserWrapper.value
        default:
            return []
        }
        
    }
    
    
}

#Preview {
    UserListView(viewModel: .init(), onUserSelected: { _ in })
}
