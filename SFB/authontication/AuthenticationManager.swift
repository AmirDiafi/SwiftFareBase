//
//  AuthonticationManager.swift
//  SFB
//
//  Created by Amir Diafi on 4/1/23.
//

import Foundation
import FirebaseAuth

struct AuthUserModel {
    let uid: String
    let email: String?
    let photoURL: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoURL = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    static let shared = AuthenticationManager()
    
    private init () { }
    
    func getSignedUser() throws -> User {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return user
    }
    
    func createUser(email: String, password: String) async throws -> AuthUserModel {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthUserModel(user: authResult.user)
        return result
    }
    
    func signIn(email: String, password: String) async throws -> AuthUserModel {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        let result = AuthUserModel(user: authResult.user)
        return result
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
}
