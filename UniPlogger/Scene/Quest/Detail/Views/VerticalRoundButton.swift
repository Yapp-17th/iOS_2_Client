//
//  RoundButtonView.swift
//  UniPlogger
//
//  Created by woong on 2020/10/23.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class VerticalRoundButton: HightlightButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height/2
    }
}
