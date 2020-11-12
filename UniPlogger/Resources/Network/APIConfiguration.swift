//
//  APIConfiguration.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//

import Alamofire

///URL Request를 구성하는데 도움을 주는 프로토콜
protocol APIConfiguration: URLRequestConvertible {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
}

extension APIConfiguration{
    var encoding: ParameterEncoding{
        switch method{
        case .post, .patch, .put, .delete:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
}
