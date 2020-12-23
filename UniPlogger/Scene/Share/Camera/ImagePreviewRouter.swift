//
//  ImagePreviewRouter.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/13.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

class ImagePreviewRouter {
    weak var viewController: ImagePreviewViewController?
    var dataStore: CameraDataStore?
    
    func routeToShare() {
        let destinationVC = ShareViewController()
        var destinationDS = destinationVC.router!.dataStore!
        passDataToShare(source: dataStore!, destination: &destinationDS)
        navigateToShare(source: viewController!, destination: destinationVC)
    }
    
    func navigateToShare(source: ImagePreviewViewController, destination: ShareViewController){
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func passDataToShare(source: CameraDataStore, destination: inout ShareDataStore){
        destination.ploggingData = source.ploggingData
        destination.ploggingData?.items = source.ploggingData!.items
        
        destination.image = viewController?.imageView.asImage()
        passDataToQuest(ploggingData: destination.ploggingData)
    }
    
    func passDataToQuest(ploggingData: PloggingData?) {
        guard let data = ploggingData,
              let tabBarVC = viewController?.presentingViewController as? MainTabBarController,
              let questNav = (tabBarVC.viewControllers?[1] as? QuestNavigationController),
              let questVC = questNav.viewControllers.first as? QuestViewController
        else {
            return
        }
        
        questVC.router?.dataStore.questManager.finish(plogging: data)
    }
}
