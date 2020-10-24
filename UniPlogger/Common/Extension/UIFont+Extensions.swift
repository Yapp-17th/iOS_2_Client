//
//  UIFont+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

public enum Roboto{
    case black
    case blackItalic
    case bold
    case boldItalic
    case italic
    case light
    case lightItalic
    case medium
    case mediumItalic
    case regular
    case thin
    case thinItalic
    
    var name: String{
        switch self{
        case .black:
            return "Roboto-Black"
        case .blackItalic:
            return "Roboto-BlackItalic"
        case .bold:
            return "Roboto-Bold"
        case .boldItalic:
            return "Roboto-BoldItalic"
        case .italic:
            return "Roboto-Italic"
        case .light:
            return "Roboto-Light"
        case .lightItalic:
            return "Roboto-LightItalic"
        case .regular:
            return "Roboto-Regular"
        case .medium:
            return "Roboto-Medium"
        case .mediumItalic:
            return "Roboto-MediumItalic"
        case .thin:
            return "Roboto-Thin"
        case .thinItalic:
            return "Roboto-ThinItalic"
        }
    }
}
public enum NotoSans {
  case black
  case bold
  case demiLight
  case light
  case regular
  case medium
  case thin
  
  var name: String {
    switch self {
    case .black:
      return "NotoSansCJKkr-Black"
    case .bold:
      return "NotoSansCJKkr-Bold"
    case .demiLight:
      return "NotoSansCJKkr-DemiLight"
    case .light:
      return "NotoSansCJKkr-Light"
    case .regular:
      return "NotoSansCJKkr-Regular"
    case .medium:
      return "NotoSansCJKkr-Medium"
    case .thin:
      return "NotoSansCJKkr-Thin"
    }
  }
}

public protocol CustomFont {
    static func roboto(ofSize fontSize: CGFloat, weight: Roboto) -> UIFont
    static func notoSans(ofSize fontSize: CGFloat, weight: NotoSans) -> UIFont
}

extension UIFont: CustomFont {
    public static func roboto(ofSize fontSize: CGFloat, weight: Roboto) -> UIFont {
        return UIFont(name: weight.name, size: fontSize)!
    }
    public static func notoSans(ofSize fontSize: CGFloat, weight: NotoSans) -> UIFont {
        return UIFont(name: weight.name, size: fontSize)!
    }
}
