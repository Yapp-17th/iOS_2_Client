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
        var headers = [
            "Content-type": "application/json",
        ]
        if let token = AuthManager.shared.userToken{
            headers["Authorization"] = "JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo5LCJ1c2VybmFtZSI6Imd1aW5uZXNzQHRlc3QuY29tIiwiZXhwIjoxNjA3NzUwNDE3LCJlbWFpbCI6Imd1aW5uZXNzQHRlc3QuY29tIiwib3JpZ19pYXQiOjE2MDcxNDU2MTd9.7AumPJ7VfIMhWEKg-dkIbFTRIws1S6JhZeZkD7nI2c8"
//            headers["Authorization"] = "JWT \(token)"
        }
        return headers

    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .post:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
}
