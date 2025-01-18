//
//  Auth.swift
//  BillMate
//
//  Created by william wu on 1/17/25.
//
import FirebaseAuth

class AuthenticationManager {
    
    static let shared = AuthenticationManager()

    private init() {}

    func signUp(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, "Successfully signed up!")
            }
        }
    }

    func login(email: String, password: String, completion: @escaping (Bool, String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, "Successfully logged in!")
            }
        }
    }
}

