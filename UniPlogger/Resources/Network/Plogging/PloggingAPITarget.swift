//
//  PloggingAPITarget.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

enum PloggingAPITarget{
    //쓰레기통 CRUD
    case createTrash(latitude: Double, longitude: Double, address: String)
    case fetchTrashList
}

extension PloggingAPITarget: BaseTarget{
    var path: String{
        switch self{
        case .createTrash:
            return "trashcans/"
        case .fetchTrashList:
            return "trashcans/"
        }
    }
    
    var method: Method{
        switch self{
        case .createTrash:
            return .post
        case .fetchTrashList:
            return .get
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case let .createTrash(latitude, longitude, address):
            return [
              "latitude": latitude,
              "longitude": longitude,
              "address": address,
              "state": "C"
            ]
        case .fetchTrashList:
            return [:]
        }
    }
    
    var task: Task{
        switch self{
        case .createTrash:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .fetchTrashList:
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
