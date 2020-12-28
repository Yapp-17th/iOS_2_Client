//
//  SettingWorker.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class SettingWorker {
    func getUser(completion: @escaping (Setting.GetUser.Response) -> Void) {
        guard let uid = AuthManager.shared.user?.id else { return }
        AuthAPI.shared.getUser(uid: uid) { (response) in
            switch response{
            case let .success(value):
                if value.success, let user = value.data{
                    let response = Setting.GetUser.Response(user: user)
                    completion(response)
                } else {
                    let response = Setting.GetUser.Response(error: .server(value.message))
                    completion(response)
                }
            case let .failure(error):
                let response = Setting.GetUser.Response(error: .error(error))
                completion(response)
            }
        }
        
    }
    
    func updatePush(completion: @escaping (Setting.GetUser.Response) -> Void) {
        guard let uid = AuthManager.shared.user?.id else { return }
        AuthAPI.shared.updatePush(uid: uid) { (response) in
            switch response{
            case let .success(value):
                if value.success, let user = value.data{
                    let response = Setting.GetUser.Response(user: user)
                    completion(response)
                } else {
                    let response = Setting.GetUser.Response(error: .server(value.message))
                    completion(response)
                }
            case let .failure(error):
                let response = Setting.GetUser.Response(error: .error(error))
                completion(response)
            }
        }
        
    }
}
