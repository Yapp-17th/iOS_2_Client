//
//  ChallengeAPITarget.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

import Moya

enum ChallengeAPITarget {
    case startChallenge(startDate: String, endDate: String, userCount: Int)
    case fetchPlanet
}

extension ChallengeAPITarget: BaseTarget {
  
    var path: String{
        switch self{
        case .startChallenge:
            return "planets/"
        case .fetchPlanet:
            return "planets/"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .startChallenge:
            return .post
        case .fetchPlanet:
            return .get
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case let .startChallenge(startDate, endDate, userCount):
            return [
                "start_date": startDate,
                "end_date": endDate,
                "user_cnt": userCount
            ]
        case .fetchPlanet:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .startChallenge:
            return .requestParameters(parameters: parameters, encoding: encoding)
        case .fetchPlanet:
            return .requestPlain
        }
    }
    
    public var sampleData: Data {
        switch self {
        default:
        return Data()
        }
    }
    
}
