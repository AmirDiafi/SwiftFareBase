//
//  Login.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import SwiftUI

struct Login: View {
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Sign In with Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            Spacer()
        }
        .navigationTitle("Login")
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Login()
        }
    }
}
