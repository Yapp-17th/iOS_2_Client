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

public enum NotoSansKR {
    case black
    case bold
    case light
    case medium
    case regular
    case thin
    
    var name: String {
        switch self{
        case .black:
            return "NotoSansKR-Black"
        case .bold:
            return "NotoSansKR-Bold"
        case .light:
            return "NotoSansKR-Light"
        case .regular:
            return "NotoSansKR-Regular"
        case .medium:
            return "NotoSansKR-Medium"
        case .thin:
            return "NotoSansKR-Thin"
        }
    }
}

public protocol CustomFont {
    static func roboto(ofSize fontSize: CGFloat, weight: Roboto) -> UIFont
    static func notoSansKR(ofSize fontSize: CGFloat, weight: NotoSansKR) -> UIFont
}

extension UIFont: CustomFont {
    public static func roboto(ofSize fontSize: CGFloat, weight: Roboto) -> UIFont {
        return UIFont(name: weight.name, size: fontSize)!
    }
    public static func notoSansKR(ofSize fontSize: CGFloat, weight: NotoSansKR) -> UIFont {
        return UIFont(name: weight.name, size: fontSize)!
    }
}
