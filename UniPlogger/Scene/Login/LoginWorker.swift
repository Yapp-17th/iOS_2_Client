//
//  LoginWorker.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class LoginWorker {
    func validateAccount(text: String) -> Bool{
        return text.count >= 1
    }
    
    func validatePassword(text: String) -> Bool{
        return text.count >= 8 && text.count <= 20
    }
    
    func login(request: Login.Login.Request, completion: @escaping (Login.Login.Response) -> Void) {
        AuthAPI.shared.login(email: request.account, password: request.password) { (response) in
            switch response{
            case .success(let value):
                let response = Login.Login.Response(request:request, response: value)
                completion(response)
            case .failure(let error):
                print(error.localizedDescription)
                let response = Login.Login.Response(request: request, error: .error(error))
                completion(response)
            }
        }
    }
}
