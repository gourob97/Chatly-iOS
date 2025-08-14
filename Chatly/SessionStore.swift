//
//  SessionStore.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import SwiftUI

@MainActor
final class SessionStore: ObservableObject {
    @Published private(set) var user: AuthUser? = nil
    var isAuthenticated: Bool { user != nil }
    
    @Published private(set)
    var isLoading: Bool = true
    
    private let repo: AuthRepository
    private var task: Task<Void, Never>?
    
    init(repo: AuthRepository) {
        self.repo = repo
        task = Task {
            for await u in repo.authState {
                self.user = u
                self.isLoading = false
            }
        }
    }
    deinit { task?.cancel() }
    
    // Expose tiny API for views
    func signUp(email: String, password: String) { Task { try? await repo.signUp(email: email, password: password) } }
    func signIn(email: String, password: String) { Task { try? await repo.signIn(email: email, password: password) } }
    func signOut() { Task { try? await repo.signOut() } }
}
