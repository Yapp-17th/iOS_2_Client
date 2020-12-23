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
    func getOtherUser()
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
        self.worker?.getFeed(uid: playerId) { [weak self] response in
            self?.presenter?.presentGetFeed(response: response)
        }
        
    }
    
    func getOtherUser() {
        UPLoader.shared.show()
        guard let playerId = playerId else {
            UPLoader.shared.hidden()
            return
        }
        worker = UserLogWorker()
        worker?.updateLevel {
            self.worker?.updateRank {
                self.worker?.getOtherUser(uid: playerId, completion: { (response) in
                    self.presenter?.presentUserInfo(response: response)
                })
            }
        }
        
    }
    
}
