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
}

extension LogAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .getFeed:
            return "users/feed/"
        }
    }
    
    var method: Method{
        switch self{
        case .getFeed:
            return .get
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case .getFeed:
            return [:]
        }
    }
    
    var task: Task{
        switch self{
        case .getFeed:
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
