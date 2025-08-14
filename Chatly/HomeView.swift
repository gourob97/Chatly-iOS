//
//  HomeView.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Text("This is Home View")
        Button(role: .destructive) {
            session.signOut()
        } label: {
            Text("Log Out")
        }
        .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    HomeView()
        .environmentObject(SessionStore(repo: FirebaseAuthRepository()))
}
