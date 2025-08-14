//
//  ContentView.swift
//  Chatly
//
//  Created by Gourob Mazumder on 15/8/25.
//

import SwiftUI

struct AuthView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                
            }label: {
                 Text("Login")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
    }
}

#Preview {
    AuthView()
}
