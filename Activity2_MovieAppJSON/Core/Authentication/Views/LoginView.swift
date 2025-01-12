//
//  LoginView.swift
//  Activity2_MovieAppJSON
//
//  Created by Iman on 2025-01-12.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack{
            VStack{
                //image
                Image("movie_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.vertical,32)
                
                //form field
                VStack(spacing: 24){
                    InputView(test: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(test: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                     
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                //sign in btn
                
                Button {
                    Task {
                      try await  viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack{
                        Text("SIGN IN")
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
                
                //sign up btn
                NavigationLink{
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing:3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                        
                    }
                    .font(.system(size: 14))
                }
            }
        }
    }
}

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}

#Preview {
    LoginView()
}
