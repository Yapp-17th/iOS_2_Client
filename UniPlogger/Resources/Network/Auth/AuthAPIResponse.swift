//
//  AuthAPIResponse.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

struct LoginResponse: Codable{
    var token: String?
    var user: User?
}
