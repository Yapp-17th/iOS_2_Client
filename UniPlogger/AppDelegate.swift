//
//  AppDelegate.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        window = UIWindow(frame: UIScreen.main.bounds)
        let nvc = UINavigationController(rootViewController: SplashViewController())
        nvc.isNavigationBarHidden = true
        window?.rootViewController = nvc
        window?.backgroundColor = .white
        
        window?.makeKeyAndVisible()
        
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        do{
            try CoreDataStore.shared.mainManagedObjectContext.save()
        } catch {
            print(#function, "coredata save error")
        }
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        return true
    }
}

