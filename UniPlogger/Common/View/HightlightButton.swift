//
//  HightlightingButton.swift
//  UniPlogger
//
//  Created by woong on 2020/10/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class HightlightButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if oldValue == false && isHighlighted {
                highlight()
            } else if oldValue == true && !isHighlighted {
                unHighlight()
            }
        }
    }
    
    func configureHighlight(alpha: CGFloat, duration: TimeInterval) {
        self.highlightAlpha = alpha
        self.highlightDuration = duration
    }
    
    // MARK: - Private for highlight
    
    private var normalAlpha: CGFloat = 1
    private var highlightAlpha: CGFloat = 0.8
    private var highlightDuration: TimeInterval = 0.1
    
    private func highlight() {
        normalAlpha = alpha
        animate(alpha: highlightAlpha, duration: highlightDuration)
    }

    private func unHighlight() {
        animate(alpha: normalAlpha, duration: highlightDuration)
    }
    
    private func animate(alpha: CGFloat, duration: TimeInterval) {
        UIView.animate(withDuration: highlightDuration) {
            // self.backgroundColor = color
            self.alpha = alpha
        }
    }
}
