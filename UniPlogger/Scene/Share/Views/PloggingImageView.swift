//
//  PloggingImageView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class PloggingImageView: UIImageView {
    
    init() {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
    }

}
