//
//  RootView.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import SwiftUI


struct RootView: View {
    @EnvironmentObject private var session: SessionStore
    var body: some View {
        Group {
            if session.isLoading {
                Text("Loading...")
                    .transition(.opacity.combined(with: .scale))
            } else if session.isAuthenticated {
                HomeView()
                    .transition(.opacity.combined(with: .scale))
            } else {
                AuthView()
                    .transition(.opacity.combined(with: .scale))
            }
        }
        .animation(.easeInOut, value: session.isAuthenticated)
    }
}
