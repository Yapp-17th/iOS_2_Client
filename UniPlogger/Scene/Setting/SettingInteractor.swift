//
//  SettingInteractor.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol SettingBusinessLogic {
    func getUser()
    func updatePush()
}

protocol SettingDataStore {
  
}

class SettingInteractor: SettingBusinessLogic {
    var presenter: SettingPresentationLogic?
    let worker = SettingWorker()
    
    func getUser() {
        worker.getUser { [weak self] (response) in
            self?.presenter?.presentGetUser(response: response)
        }
    }
    
    func updatePush() {
        worker.updatePush { [weak self] (response) in
            self?.presenter?.presentGetUser(response: response)
        }
    }
}
