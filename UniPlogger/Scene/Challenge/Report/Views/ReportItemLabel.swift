//
//  ReportItemView.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ReportItemLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    private func setUpLabel() {
        font = .notoSans(ofSize: 14, weight: .regular)
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.5).cgColor
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + 20, height: size.height + 20)
    }
    
}
