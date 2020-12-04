//
//  UIApplication+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/04.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension UIApplication {
  class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
    if let naviController = base as? UINavigationController {
      return topViewController(base: naviController.visibleViewController)
    }
    if let tabController = base as? UITabBarController {
      if let selected = tabController.selectedViewController {
        return topViewController(base: selected)
      }
    }
    if let presented = base?.presentedViewController {
      return topViewController(base: presented)
    }
    return base
  }
}
