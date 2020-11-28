//
//  MyPageRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

protocol MyPageRoutingLogic {
    func routeToNextVC(infoItem: InfoItemType)
}


class MyPageRouter: NSObject, MyPageRoutingLogic {
    weak var viewController: MyPageViewController?
    
    func routeToNextVC(infoItem: InfoItemType) {
        let destinationVC = infoItem.nextScene
        destinationVC.infoItem = infoItem
        navigateToSetting(source: viewController!, destination: destinationVC)
    }
    
    func navigateToSetting(source: MyPageViewController, destination: InfoBaseViewController) {
        source.navigationController?.pushViewController(destination, animated: false)
    }
    
}
