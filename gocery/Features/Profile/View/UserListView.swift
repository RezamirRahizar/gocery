//
//  UserListView.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import SwiftUI

struct UserListView: View {
    @ObservedObject var viewModel: UserListViewModel
    var onUserSelected: (User) -> Void
    
    var body: some View {
       NavigationView {
           List(viewModel.users) { user in
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
    
    
}

#Preview {
    UserListView(viewModel: .init(), onUserSelected: { _ in })
}
