//
//  AuthManager.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class AuthManager{
    static let shared: AuthManager = AuthManager()
    
    var userToken: String? {
        get {
            guard let userToken = UserDefaults.standard.string(forDefines: .userToken) else { return nil }
            return userToken
        }
        set {
            UserDefaults.standard.set(newValue, forDefines: .userToken)
        }
    }
    
    var user: User?{
        get{
            guard let user = UserDefaults.standard.object(User.self, with: .user) else { return nil }
            return user
        }
        set{
            UserDefaults.standard.set(object: newValue, forKey: .user)
        }
    }
    
    var getPush: Bool {
        get {
            return UserDefaults.standard.bool(forDefines: .getPush)
        }
        set {
            UserDefaults.standard.set(newValue, forDefines: .getPush)
        }
    }
    
    var autoSave: Bool {
        get {
            return UserDefaults.standard.bool(forDefines: .autoSave)
        }
        set {
            UserDefaults.standard.set(newValue, forDefines: .autoSave)
        }
    }
}
