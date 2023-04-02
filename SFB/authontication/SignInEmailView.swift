//
//  SignInEmailView.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import SwiftUI

final class AuthModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @EnvironmentObject var authState: AuthStateModel
    
    func signInWithEmail() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task {
            do {
                let createdUser = try await AuthenticationManager.shared.createUser(
                    email: email,
                    password: password
                )
                print("success")
                print(createdUser)
                authState.isPresented = true
            } catch {
                print("failed \(error)")
            }
        }
    }
    
}

struct SignInEmailView: View {
    @ObservedObject private var authModel = AuthModel()
    var body: some View {
        VStack {
            VStack {
                Text("Login with Email")
                    .font(.title)
                    .fontWeight(.heavy)
                TextField("Email", text: $authModel.email)
                    .padding(.leading, 15)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .circular
                        )
                        .stroke(lineWidth: 2)
                        .fill(.gray.opacity(0.2))
                    )
                
                SecureField("Password", text: $authModel.password)
                    .padding(.leading, 15)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(
                            cornerRadius: 10,
                            style: .circular
                        )
                        .stroke(lineWidth: 2)
                        .fill(.gray.opacity(0.2))
                    )
                
                Button {
                     authModel.signInWithEmail()
                } label: {
                    Text("Sign In with Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView()
    }
}
