//
//  SettingPresenter.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol SettingPresentationLogic {
    func presentGetUser(response: Setting.GetUser.Response)
}

class SettingPresenter: SettingPresentationLogic {
    weak var viewController: SettingViewController?
    func presentGetUser(response: Setting.GetUser.Response) {
        guard let user = response.user, response.error == nil else {
            
            return
        }
        
        let viewModel = Setting.GetUser.ViewModel(pushAgree: user.agreePush)
        self.viewController?.displayGetUser(viewModel: viewModel)
    }
}
