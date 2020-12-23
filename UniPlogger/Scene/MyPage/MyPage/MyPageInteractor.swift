//
//  MyPageInteractor.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol MyPageBusinessLogic {
    func getUserInfo()
}

protocol MyPageDataStore {
    var level: Int { get set }
    var rank: Int { get set }
}

class MyPageInteractor: MyPageBusinessLogic, MyPageDataStore {
    
    var presenter: MyPagePresentationLogic?
    var worker = LogWorker()
    var level: Int = 0
    var rank: Int = 0
    
    func getUserInfo() {
        guard let user = AuthManager.shared.user else { return }
        self.worker.getUser(uid: user.id) { [weak self] (response) in
            guard let self = self else { return }
            guard let user = response.response else { return }
            self.level = user.level
            self.rank = Int(user.rank)
            self.presenter?.presentUserInfo(level: self.level, rank: self.rank)
        
        }
    }
}
