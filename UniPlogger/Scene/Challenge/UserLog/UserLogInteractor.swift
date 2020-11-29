//
//  UserLogInteractor.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol UserLogBusinessLogic {
    func printId()
}

protocol UserLogDataStore {
    var playerId: Int? { get set }
}

class UserLogInteractor: UserLogBusinessLogic, UserLogDataStore {
    
    var playerId: Int?
    var presenter: UserLogPresentationLogic?
    var worker: UserLogWorker?
    
    func printId() {
        print("id:!!!@#!@#")
        print(playerId)
    }
    
}
