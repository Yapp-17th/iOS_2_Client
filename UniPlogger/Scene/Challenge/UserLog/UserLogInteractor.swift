//
//  UserLogInteractor.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol UserLogBusinessLogic {
    func getFeed()
}

protocol UserLogDataStore {
    var playerId: Int? { get set }
}

class UserLogInteractor: UserLogBusinessLogic, UserLogDataStore {
    
    var playerId: Int?
    var presenter: UserLogPresentationLogic?
    var worker: UserLogWorker?

    func getFeed() {
        guard let playerId = playerId else { return }
        worker = UserLogWorker()
        worker?.getFeed(uid: playerId) { [weak self] response in
            print(response)
            self?.presenter?.presentGetFeed(response: response)
        }
    }
    
}
