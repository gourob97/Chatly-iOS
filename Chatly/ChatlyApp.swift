//
//  ChatlyApp.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import SwiftUI
import FirebaseCore

@main
struct ChatlyApp: App {
    init() {
        FirebaseApp.configure()
    }
    @StateObject private var session = SessionStore(repo: FirebaseAuthRepository())
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(session)
        }
    }
}
