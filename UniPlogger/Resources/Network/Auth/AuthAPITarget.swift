//
//  AuthAPITarget.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

enum AuthAPITarget{
    //쓰레기통 CRUD
    case login(email: String, password: String)
}

extension AuthAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .login:
            return "users/login/"
        }
    }
    
    var method: Method{
        switch self{
        case .login:
            return .post
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case let .login(email, password):
            return [
              "email": email,
              "password": password
            ]
        }
    }
    
    var task: Task{
        switch self{
        case .login:
            return .requestParameters(parameters: parameters, encoding: encoding)
        }
    }
    
    public var sampleData: Data{
      switch self {
      default:
        return Data()
      }
    }
    
}
