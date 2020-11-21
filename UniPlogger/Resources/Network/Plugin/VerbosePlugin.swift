//
//  VerbosePlugin.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/12.
//  Copyright © 2020 손병근. All rights reserved.
//


import Moya

struct VerbosePlugin: PluginType {
    let verbose: Bool
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        #if DEBUG
        if let body = request.httpBody,
           let str = String(data: body, encoding: .utf8) {
            print("request to send: \(str))")
        }
        #endif
        return request
    }
    
    func willSend(_ request: RequestType, target: TargetType) {
        let headers = request.request?.allHTTPHeaderFields ?? [:]
        let url = request.request?.url?.absoluteString.removingPercentEncoding ?? "nil"
        if let body = request.request?.httpBody {
            let bodyString = String(bytes: body, encoding: String.Encoding.utf8) ?? "nil"
            print("""
        [\(Date().debugDescription)] Request
        ⬆️ \(request.request?.method?.rawValue ?? "") \(url)
        Headers : \(headers)
        Body: \(bodyString)
        
        
        """)
        } else {
            print("""
        [\(Date().debugDescription)] Request
        
        ⬆️ \(request.request?.method?.rawValue ?? "") \(url)
        Headers : \(headers)
        Body: nil
        
        
        """)
        }
    }
    
    func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
        #if DEBUG
        switch result {
        case .success(let body):
            if verbose {
                print("""
          [\(Date().debugDescription)] Response
          ⬇️ \(body.request?.method?.rawValue ?? "") \(body.request?.url?.absoluteString.removingPercentEncoding ?? "nil") (✅ \(body.statusCode) OK)
          Response:
          """)
                if let responseJSONString = body.data.prettyPrintedJSONString{
                    print(responseJSONString)
                }
                
            }
        case .failure(let error):
            print("""
        [\(Date().debugDescription)]

        ⬇️ (❌ \(error.errorCode) Failure)
        \(error.localizedDescription)
        \(error.failureReason ?? "")
        
        
      """)
        }
        #endif
    }
}
