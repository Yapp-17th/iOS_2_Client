//
//  RegistrationWorker.swift
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

class RegistrationWorker {
    func validateAccount(text: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: text)
    }
    
    func validatePassword(text: String) -> Bool{
        return text.count >= 8 && text.count <= 20
    }

    func validatePasswordConfirm(password: String, passwordConfirm: String) -> Bool{
        return validatePassword(text: passwordConfirm) && password == passwordConfirm
    }
    
    func validateNickname(text: String) -> Bool{
        return text.count >= 1 && text.count <= 6
    }
    
    func registration(request: Registration.Registration.Request, completion: @escaping (Registration.Registration.Response) -> Void){
        AuthAPI.shared.registration(email: request.email, password1: request.password1, password2: request.password2, nickname: request.nickname) { (response) in
            switch response {
            case let .success(value):
                if value.success, let loginResponse = value.data{
                    AuthManager.shared.userToken = loginResponse.token
                    AuthManager.shared.user = loginResponse.user
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        AuthAPI.shared.initQuest()
                        if let id = loginResponse.user?.id, let pushToken = UserDefaults.standard.string(forDefines: .pushToken) {
                            AuthAPI.shared.updateToken(uid: id, token: pushToken)
                        }
                    }
                    let response = Registration.Registration.Response(request: request, response: loginResponse)
                    completion(response)
                } else {
                    let response = Registration.Registration.Response(request: request, error: .server(value.message))
                    completion(response)
                }
            case let .failure(error):
                let response = Registration.Registration.Response(request: request, error: .error(error))
                completion(response)
            }
        }
    }
    
}
