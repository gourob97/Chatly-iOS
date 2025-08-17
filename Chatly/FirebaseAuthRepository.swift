//
//  FirebaseAuthRepository.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import Foundation
import FirebaseAuth

final class FirebaseAuthRepository: AuthRepository {
    private let auth = Auth.auth()
    
    var authState: AsyncStream<AuthUser?> {
        AsyncStream { cont in
            // Seed initial value
            cont.yield(self.auth.currentUser.map { AuthUser(uid: $0.uid, email: $0.email) })
            // Listen for changes
            let h = auth.addStateDidChangeListener { _, user in
                cont.yield(user.map { AuthUser(uid: $0.uid, email: $0.email) })
            }
            cont.onTermination = { [weak auth] _ in
                auth?.removeStateDidChangeListener(h)
            }
        }
    }
    
    func signUp(email: String, password: String) async throws {
        _ = try await auth.createUser(withEmail: email, password: password)
    }
    func signIn(email: String, password: String) async throws {
        _ = try await auth.signIn(withEmail: email, password: password)
    }
    func signOut() async throws {
        try auth.signOut()
    }
}
