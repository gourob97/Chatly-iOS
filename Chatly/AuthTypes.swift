//
//  AuthTypes.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import Foundation

struct AuthUser: Equatable {
    let uid: String
    let email: String?
}

protocol AuthRepository {
    var authState: AsyncStream<AuthUser?> { get }
    func signUp(email: String, password: String) async throws
    func signIn(email: String, password: String) async throws
    func signOut() async throws
}
