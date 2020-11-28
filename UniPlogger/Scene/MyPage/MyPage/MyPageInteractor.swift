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
        // user 정보 얻어와서 넣어주기
        level = 2
        rank = 7
        print("interactor")
        presenter?.presentUserInfo(level: level, rank: rank)
    }
}
