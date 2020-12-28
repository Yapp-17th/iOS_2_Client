//
//  SplashInteractor.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/24.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SplashBusinessLogic {
    func setPushNotification()
    func checkLogin()
    func setData()
}

protocol SplashDataStore {
    //var name: String { get set }
}

class SplashInteractor: SplashBusinessLogic, SplashDataStore {
    var presenter: SplashPresentationLogic?
    var worker = SplashWorker()
    //var name: String = ""
    
    func setPushNotification() {
        worker.setPushNotification {
            self.checkLogin()
        }
    }
    
    func checkLogin(){
        
        if AuthManager.shared.userToken != nil,
           let user = AuthManager.shared.user{
            //Todo Login with userToken
            AuthAPI.shared.getUser(uid: user.id) { (response) in
                switch response{
                case .success(let value):
                    if value.success, let user = value.data {
                        AuthManager.shared.user = user
                        let response = Splash.CheckLogin.Response(isLogined: true)
                        self.presenter?.presentCheckLogin(response: response)
                    } else {
                        let response = Splash.CheckLogin.Response(isLogined: false)
                        self.presenter?.presentCheckLogin(response: response)
                    }
                case .failure(let error):
                    let response = Splash.CheckLogin.Response(isLogined: false)
                    self.presenter?.presentCheckLogin(response: response)
                }
            }
        } else {
            let response = Splash.CheckLogin.Response(isLogined: false)
            self.presenter?.presentCheckLogin(response: response)
        }
    }
    
    func setData() {
        AuthManager.shared.autoSave = true
    }
}
