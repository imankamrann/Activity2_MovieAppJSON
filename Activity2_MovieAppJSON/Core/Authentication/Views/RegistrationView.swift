//
//  RegistrationView.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-12.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var fullName: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 24){
            //image
            Image("movie_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.vertical,32)
            
            VStack(spacing: 24){
                InputView(test: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(test: $fullName, title: "Full Name", placeholder: "Enter your name")
                
                InputView(test: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                 
                ZStack(alignment: .trailing){
                    InputView(test: $confirmPassword,
                              title: "Confirm Password",
                              placeholder: "Confirm your password",
                              isSecureField: true)
                    if !password.isEmpty && !confirmPassword.isEmpty{
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                        
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email,
                                                   password: password,
                                                   fullname: fullName)
                }
            } label: {
                HStack{
                    Text("SIGN UP")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(Color.white)
                .frame(width: UIScreen.main.bounds.width - 32, height: 48)
            }
            .background(Color.blue)
            .disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            .cornerRadius(10)
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label : {
                HStack(spacing:3){
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                    
                }
                .font(.system(size: 14))
            }
            
            
        }
    }
}

extension RegistrationView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmPassword == password
        && !fullName.isEmpty
    }
}

#Preview {
    RegistrationView()
}
