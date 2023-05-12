//
//  AuthManager.swift
//  Instagram
//
//  Created by Nurmukhanbet Sertay on 11.05.2023.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username, password: password) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    guard error == nil, authResult != nil else {
                        completion(false)
                        return
                    }
                    
                    DatabaseManager.shared.insertNewUser(with: email, username: username, password: password) { success in
                        if success {
                            completion(true)
                            return
                        } else {
                            completion(false)
                            return
                        }
                    }
                    
                }
            } else {
                completion(false)
            }
        }
    }
    
    static func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                completion(true)
            }
            
        }
    }
}
 
