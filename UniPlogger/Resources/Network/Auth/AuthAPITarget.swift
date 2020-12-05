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
    case getUser(uid: Int)
    case logout
}

extension AuthAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .login:
            return "users/login/"
        case let .getUser(uid):
            return "users/\(uid)/"
        case .logout:
            return "users/logout/"
        }
    }
    
    var method: Method{
        switch self{
        case .login:
            return .post
        case .getUser:
            return .get
        case .logout:
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
        case .getUser:
            return [:]
        case .logout:
            return [:]
        }
    }
    
    var task: Task{
        switch self{
        case .login:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .getUser:
            return .requestPlain
        case .logout:
            return .requestPlain
        }
    }
    
    public var sampleData: Data{
      switch self {
      default:
        return Data()
      }
    }
    
}
