//
//  SettingRouter.swift
//  UniPlogger
//
//  Created by 손병근 on 2021/02/09.
//  Copyright © 2021 손병근. All rights reserved.
//

import UIKit

protocol SettingRoutingLogic {
  
}

protocol SettingDataPassing {
  var dataStore: SettingDataStore? { get set }
}

class SettingRouter: NSObject, SettingRoutingLogic, SettingDataPassing {
  weak var viewController: SettingViewController?
  var dataStore: SettingDataStore?
}
