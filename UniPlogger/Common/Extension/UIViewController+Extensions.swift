//
//  UIViewController+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/04.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension UIViewController{
  func errorAlert(title: String, message: String?, completion: ((UIAlertAction) -> Void)?){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: completion))
    self.present(alert, animated: true, completion: nil)
  }
}
