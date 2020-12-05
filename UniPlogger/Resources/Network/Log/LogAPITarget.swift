//
//  LogAPITarget.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

enum LogAPITarget{
    //쓰레기통 CRUD
    case getFeed(uId: Int)
    case getUserFeed(uid: Int)
    case getOtherUser(uid: Int)
}

extension LogAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .getFeed:
            return "users/feed/"
        case .getUserFeed:
            return "users/feed/others_feed/"
        case let .getOtherUser(uid):
            return "users/\(uid)/"
        }
    }
    
    var method: Method{
        switch self{
        case .getFeed:
            return .get
        case .getUserFeed:
            return .post
        case .getOtherUser:
            return .get
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case .getFeed:
            return [:]
        case .getUserFeed:
            return [:]
        case .getOtherUser:
            return [:]
        }
    }

    var task: Task {
        switch self{
        case .getFeed:
            return .requestPlain
        case .getUserFeed(let uid):
            let uidData = MultipartFormData(provider: .data("\(uid)".data(using: .utf8)!), name: "id")
            return .uploadMultipart([uidData])
        case .getOtherUser:
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
