//
//  SignUpView.swift
//  Chatly
//
//  Created by Shahriar Alif on 15/8/25.
//

import SwiftUI

struct SignUpView: View {
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var phoneNumber: String = ""
    
    var body: some View {
        
        VStack (alignment : .leading, spacing : 20){
            
            Text("Sign Up")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            TextField("Name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.default)
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm Password", text: $confirmPassword)
                .keyboardType(.default)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Phone Number", text: $phoneNumber)
                .textContentType(.telephoneNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            
            Button {
                
            }label: {
                 Text("Sign Up")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 32)
        }
    }
    
    


#Preview {
    SignUpView()
}
