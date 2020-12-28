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
import UserNotifications
import Firebase
import FirebaseMessaging

@_exported import Moya

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private let gcmMessageIDKey = "gcm.message_id"
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        configureGoogle()
        
        
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
    
    func configureGoogle() {
        // Firebase
        FirebaseApp.configure()
        
        // FCM
        Messaging.messaging().delegate = self
        Messaging.messaging().isAutoInitEnabled = true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate, MessagingDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
      Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(fcmToken ?? "")")
      
//      UserDefaults.standard.setFCMToken(fcmToken)
        let dataDict:[String: String] = ["token": fcmToken ?? ""]
          NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
      Messaging.messaging().appDidReceiveMessage(userInfo)
      
      if let messageID = userInfo[gcmMessageIDKey] {
        debugPrint("Message ID: \(messageID)")
      }
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      Messaging.messaging().appDidReceiveMessage(userInfo)
      
      if let messageID = userInfo[gcmMessageIDKey] {
        debugPrint("Message ID: \(messageID)")
      }
      completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
      let userInfo = notification.request.content.userInfo
      
      if let messageID = userInfo[gcmMessageIDKey] {
        debugPrint("Message ID: \(messageID)")
      }
      
      completionHandler([.alert, .badge, .sound])
    }
    
    // 백그라운드 상태에서 Notification Action을 통해서 앱이 실행되는 경우
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
      let userInfo = response.notification.request.content.userInfo
      
      if let messageID = userInfo[gcmMessageIDKey] {
        debugPrint("Message ID: \(messageID)")
      }
      /*let storyboard = UIStoryboard(name: "Splash", bundle: nil)
      if let splashVC = storyboard.instantiateInitialViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = splashVC
        window?.makeKeyAndVisible()
      }*/
      completionHandler()
    }
}
