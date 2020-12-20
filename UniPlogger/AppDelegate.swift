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
@_exported import Moya

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
        if url.scheme == "uniplogger" {
            // Today Extension으로 진입하는 경우ㄱ
            switch url.host {
            // 위젯 프랜차이즈 리스트 편집
            case "resetPassword":
                if let queryItems = URLComponents(url: url, resolvingAgainstBaseURL: true)?.queryItems {
                    var uid: String = ""
                    var token: String = ""
                    for query in queryItems {
                        if query.name == "uid", let value = query.value {
                            uid = value
                        } else if query.name == "token", let value = query.value {
                            token = value
                        }
                    }
                    
                    if uid != "", token != "", let viewcontroller = UIApplication.topViewController(), let loginVC = viewcontroller as? LoginViewController {
                        let destinationVC = ResetPasswordViewController()
                        var destinationDS = destinationVC.router!.dataStore!
                        destinationDS.uid = uid
                        destinationDS.token = token.replacingOccurrences(of: "/", with: "")
                        loginVC.navigationController?.pushViewController(destinationVC, animated: true)
                    }
                }
                // 앱이 실행된 경우
                
            default:
                break
            }
            
        }
        return false
    }
}

