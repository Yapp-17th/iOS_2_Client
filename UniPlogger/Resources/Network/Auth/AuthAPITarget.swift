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
    case registration(email: String, password1: String, password2: String)
    case nickname(uid: Int, nickname: String)
    case initQuest
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
        case .registration:
            return "users/registration/"
        case let .nickname(uid, _):
            return "users/\(uid)/"
        case .initQuest:
            return "users/quest_to_user/"
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
        case .registration:
            return .post
        case .nickname:
            return .put
        case .initQuest:
            return .get
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
        case let .registration(email, password1, password2):
            return [
                "email": email,
                "password1": password1,
                "password2": password2
            ]
        case let .nickname(_, nickname):
            return [
                "nickname": nickname
            ]
        case .initQuest:
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
        case .withdraw:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .registration:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .nickname:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .initQuest:
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
