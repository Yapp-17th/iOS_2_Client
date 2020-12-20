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

public struct UPStyle {
    public enum Attribute {
        case font(UIFont)
        case color(UIColor)
        case style(NSMutableParagraphStyle)
        case kern(Float)
        case underline
        
        var key: NSAttributedString.Key {
            switch self {
            case .font: return .font
            case .color: return .foregroundColor
            case .style: return .paragraphStyle
            case .kern: return .kern
            case .underline: return .underlineStyle
            }
        }
        
        var value: Any {
            switch self {
            case let .font(font): return font
            case let .color(color): return color
            case let .style(style): return style
            case let .kern(kern): return kern
            case .underline: return NSUnderlineStyle.single.rawValue
            }
        }
    }
    
    var attrs: [Attribute] = []
    var style: NSMutableParagraphStyle {
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        return style
    }
    
    public func font(_ font: UIFont) -> Self {
        return set(.font(font))
    }
    
    public func color(_ color: UIColor) -> Self {
        return set(.color(color))
    }
    
    public func style(alignment: NSTextAlignment, minimumLineHeight: CGFloat) -> Self {
        let style = NSMutableParagraphStyle()
        style.alignment = alignment
        style.minimumLineHeight = minimumLineHeight
        return set(.style(style))
    }
    
    public func underlineStyle() -> Self {
        return set(.underline)
    }
    
    public func kern(_ kern: Float) -> Self {
        return set(.kern(kern))
    }
    
    private func set(_ attr: Attribute) -> Self {
        var new = self
        new.attrs.append(attr)
        return new
    }
    func apply(to text: String) -> NSMutableAttributedString {
        let attributes = attrs.reduce([NSAttributedString.Key : Any]()) { (result, attr) in
            var result = result
            result.updateValue(attr.value, forKey: attr.key)
            return result
        }
        return NSMutableAttributedString(string: text, attributes: attributes)
    }
    
    var attributes: [NSAttributedString.Key : Any]? {
        let attributes = attrs.reduce([NSAttributedString.Key : Any]()) { (result, attr) in
            var result = result
            result.updateValue(attr.value, forKey: attr.key)
            return result
        }
        return attributes
    }
}
