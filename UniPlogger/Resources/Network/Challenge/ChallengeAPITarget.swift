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
    case startChallenge
    case fetchPlanet
    case report(id: Int)
}

extension ChallengeAPITarget: BaseTarget {
  
    var path: String{
        switch self{
        case .startChallenge:
            return "planets/"
        case .fetchPlanet:
            return "planets/"
        case .report(let id):
            return "users/feed/\(id)/report_feed/"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .startChallenge:
            return .post
        case .fetchPlanet:
            return .get
        case .report:
            return .get
        }
    }
    
    var parameters: [String : Any]{
        switch self{
        case .startChallenge:
            return [:]
        case .fetchPlanet:
            return [:]
        case .report:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .startChallenge:
            return .requestPlain
        case .fetchPlanet:
            return .requestPlain
        case .report:
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
