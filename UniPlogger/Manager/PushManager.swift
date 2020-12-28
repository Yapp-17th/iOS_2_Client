//
//  PushManager.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import UserNotifications

class PushManager: NSObject, UNUserNotificationCenterDelegate{
  func registPushNotification(completion: @escaping ((Bool) -> Void)){
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    let options: UNAuthorizationOptions = [.alert, .badge, .sound]
    center.requestAuthorization(options: options) { (granted, error) in
      if let error = error{
        print(error.localizedDescription)
        completion(false)
        return
      }
      completion(granted)
    }
  }
  
  func getPushStatus(completion:@escaping((UNAuthorizationStatus) -> Void)) {
      UNUserNotificationCenter.current().getNotificationSettings(){ (settings) in
          completion(settings.authorizationStatus)
      }
  }
}
