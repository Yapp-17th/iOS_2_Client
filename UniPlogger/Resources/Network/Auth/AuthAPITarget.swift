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
    case withdraw(uid: Int)
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
        case let .withdraw(uid):
            return "users/\(uid)/"
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
        case .withdraw:
            return .delete
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
        case let .withdraw(uid):
            return [
                "id":uid
            ]
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
        case .withdraw:
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
