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
        case .startChallenge:
            return [:]
        case .fetchPlanet:
            return [:]
        }
    }
    
    var task: Task {
        switch self {
        case .startChallenge:
            return .requestPlain
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
