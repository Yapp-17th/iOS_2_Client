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
        guard let userToken = UserDefaults.standard.string(forDefines: .userToken) else { return nil }
        return userToken
    }
}
