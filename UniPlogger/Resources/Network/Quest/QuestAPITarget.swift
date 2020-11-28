//
//  QuestAPITarget.swift
//  UniPlogger
//
//  Created by woong on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

enum QuestAPITarget {
    case list
    case detail(id: Int)
    case start(id: Int)
    case abandon(id: Int)
    case delete(id: Int)
    case success(id: Int)
}

extension QuestAPITarget: BaseTarget {
    
    var path: String {
        switch self {
            case .list: return "users/questlist/"
            case .detail(let id): return "users/questlist/\(id)/"
            case .abandon(let id): return "users/questlist/\(id)/abandon/"
            case .delete(let id): return "users/questlist/\(id)/delete/"
            case .start(let id): return "users/questlist/\(id)/start/"
            case .success(let id): return "users/questlist/\(id)/success/"
        }
    }
    
    var parameters: [String : Any] {
        return [:]
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: encoding)
    }
}
