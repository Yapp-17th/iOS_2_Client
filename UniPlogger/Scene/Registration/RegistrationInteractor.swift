//
//  RegistrationInteractor.swift
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

protocol RegistrationBusinessLogic {
    func fetchNickname()
    func validateAccount(request: Registration.ValidateAccount.Request)
    func validatePassword(request: Registration.ValidatePassword.Request)
    func validatePasswordConfirm(request: Registration.ValidatePasswordConfirm.Request)
    func validateNickname(request: Registration.ValidateNickname.Request)
    func registration(request: Registration.Registration.Request)
}

protocol RegistrationDataStore {
    var nickname: String? { get set }
}

class RegistrationInteractor: RegistrationBusinessLogic, RegistrationDataStore {
    var presenter: RegistrationPresentationLogic?
    var worker = RegistrationWorker()
    
    var nickname: String?
    
    func fetchNickname(){
        guard let nickname = self.nickname else { return }
        let response = Registration.FetchNickname.Response(nickname: nickname)
        self.presenter?.presentFetchNickname(response: response)
    }
    
    func validateAccount(request: Registration.ValidateAccount.Request){
        let text = request.account
        let result = worker.validateAccount(text: text)
        presenter?.presentValidateAccount(response: .init(isValid: result))
    }
    
    func validatePassword(request: Registration.ValidatePassword.Request){
        let text = request.password
        let result = worker.validatePassword(text: text)
        presenter?.presentValidatePassword(response: .init(isValid: result))
    }
    
    func validatePasswordConfirm(request: Registration.ValidatePasswordConfirm.Request){
        let text = request.password
        let result = worker.validatePassword(text: text)
        presenter?.presentValidatePasswordConfirm(response: .init(isValid: result))
    }
    
    func validateNickname(request: Registration.ValidateNickname.Request) {
        let text = request.nickname
        let result = worker.validateNickname(text: text)
        presenter?.presentValidateNickname(response: .init(isValid: result))
    }
    
    func registration(request: Registration.Registration.Request) {
        worker.registration(request: request) { [weak self] (response) in
            self?.presenter?.presentRegistration(response: response)
        }
    }
}
