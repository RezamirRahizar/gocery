//
//  User.swift
//  gocery
//
//  Created by Rezamir Rahizar on 16/10/2025.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: UUID
    let name: String
    let email: String?
}

