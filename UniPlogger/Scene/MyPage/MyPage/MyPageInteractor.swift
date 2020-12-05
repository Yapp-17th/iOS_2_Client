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
    
    var level: Int = 0
    var rank: Int = 0
    
    func getUserInfo() {
        guard let user = AuthManager.shared.user else { return }
        getUser(uid: user.id) { [weak self] (response) in
            guard let self = self, let user = response.user else { return }
            self.level = user.level
            self.rank = Int(user.rank)
            self.presenter?.presentUserInfo(level: self.level, rank: self.rank)
        }
    }
    
    func getUser(uid: Int, completion: @escaping(Log.GetUser.Response) -> Void) {
        LogAPI.shared.getOtherUser(uid: uid) { (response) in
            switch response {
            case let .success(user):
                let response = Log.GetUser.Response(user: user)
                completion(response)
            case let .failure(error):
                let response = Log.GetUser.Response(error: .error(error))
                completion(response)
            }
        }
    }
}
