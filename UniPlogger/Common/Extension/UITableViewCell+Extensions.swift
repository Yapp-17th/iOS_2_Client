//
//  UITableViewCell+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2021/02/09.
//  Copyright © 2021 손병근. All rights reserved.
//

import UIKit

extension UITableViewCell {
  class var identifier: String {
    return String(describing: self)
  }
}
