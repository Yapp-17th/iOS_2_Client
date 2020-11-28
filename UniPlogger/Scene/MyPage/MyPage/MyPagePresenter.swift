//
//  MyPagePresenter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol MyPagePresentationLogic {
    func presentUserInfo(level: Int, rank: Int)
}

class MyPagePresenter: MyPagePresentationLogic {
    weak var viewController: MyPageDisplayLogic?
    
    func presentUserInfo(level: Int, rank: Int) {
        let userInfo = MyPage.User.UserInfo(level: level, rank: rank)
        self.viewController?.displayUserInfo(level: userInfo.level, rank: "\(userInfo.rank)%")
    }
}
