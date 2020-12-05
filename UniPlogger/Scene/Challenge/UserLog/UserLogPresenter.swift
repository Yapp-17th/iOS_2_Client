//
//  UserLogPresenter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol UserLogPresentationLogic {
    func presentGetFeed(response: Log.GetFeed.Response) 
}

class UserLogPresenter: UserLogPresentationLogic {
    weak var viewController: UserLogDisplayLogic?
    
    func presentGetFeed(response: Log.GetFeed.Response) {
        guard let user = AuthManager.shared.user, let list = response.feedList, response.error == nil else {
            print(response.error)
            return
        }
        let viewModel = Log.GetFeed.ViewModel(feedList: list)
        self.viewController?.displayGetFeed(viewModel: viewModel)
        
    }
    
}
