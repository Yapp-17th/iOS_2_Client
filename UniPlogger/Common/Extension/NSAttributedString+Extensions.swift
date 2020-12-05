//
//  NSAttributedString+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/06.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
  
  @discardableResult
  func string(_ value: String, font: UIFont, kern: Float = 0) -> NSMutableAttributedString {
    
    let attributes:[NSAttributedString.Key : Any] = [
      .font : font,
      .kern : kern
    ]
    
    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }
  
  @discardableResult
  func string(_ value: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
    
    let attributes:[NSAttributedString.Key : Any] = [
      .font : font,
      .foregroundColor : color
    ]
    
    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }
  
  /* Other styling methods */
  @discardableResult
  func highlight(_ value: String, font: UIFont, highlightColor: UIColor, backgroundColor: UIColor) -> NSMutableAttributedString {
    
    let attributes:[NSAttributedString.Key : Any] = [
      .font :  font,
      .foregroundColor : highlightColor,
      .backgroundColor : backgroundColor
    ]
    
    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }
  
  @discardableResult
  func underlined(_ value: String, font: UIFont, color: UIColor) -> NSMutableAttributedString {
    
    let attributes:[NSAttributedString.Key : Any] = [
      .font :  font,
      .foregroundColor : color,
      .underlineStyle : NSUnderlineStyle.single.rawValue
    ]
    
    self.append(NSAttributedString(string: value, attributes:attributes))
    return self
  }
}
