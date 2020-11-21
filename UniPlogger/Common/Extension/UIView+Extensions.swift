//
//  UIView+Extensions.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/09/27.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func asImage() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    
    func shadow(radius: CGFloat, color: UIColor?, offset: CGSize, opacity: Float) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
    }
}
