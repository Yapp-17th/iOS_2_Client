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
}

extension LogAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .getFeed:
            return "users/feed/"
        case .getUserFeed:
            return "users/feed/others_feed/"
        }
    }
    
    var method: Method{
        switch self{
        case .getFeed:
            return .get
        case .getUserFeed:
            return .post
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case .getFeed:
            return [:]
        case .getUserFeed:
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
        }
    }
    
    public var sampleData: Data{
      switch self {
      default:
        return Data()
      }
    }
    
}
