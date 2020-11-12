//
//  BaseTarget.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

protocol BaseTarget: TargetType {
    var parameters: [String: Any] { get }
}

extension BaseTarget {
    public var baseURL: URL {
        guard let url = URL(string: SessionManager.environment.rawValue) else { fatalError("baseURL could not be configured") }
        return url
    }
    
    public var headers: [String : String]? {
        return [
            "Content-type": "application/json"
        ]
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post:
            return URLEncoding.default
        default:
            return URLEncoding.default
        }
    }
}
