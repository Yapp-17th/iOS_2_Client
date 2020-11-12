//
//  SessionManager.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Moya

enum NetworkEnvironment: String{
    case distribution = "distribution url"
    case development = "development url"
}

class SessionManager: Session{
    static let environment: NetworkEnvironment = .development
    static let shared: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.headers = .default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return SessionManager(configuration: configuration)
    }()
}

