//
//  ReportItemView.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol ReportDelegate: class {
    func selectItem(_ item: ReportItem)
}

class ReportItemLabel: UILabel {
    
    let item: ReportItem
    var isSelected = false
    var delegate: ReportDelegate?
    
    init(item: ReportItem) {
        self.item = item
        super.init(frame: .zero)
        self.text = item.description
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        self.item = .sexualDispleasure
        super.init(frame: .zero)
    }
    
    private func setUpLabel() {
        font = .notoSans(ofSize: 14, weight: .regular)
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.769, green: 0.769, blue: 0.769, alpha: 0.5).cgColor
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapReportLabel)))
    }

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + 32, height: size.height + 20)
    }
    
    @objc private func tapReportLabel() {
        isSelected = !isSelected
        self.layer.backgroundColor = isSelected ? UIColor(named: "rankColor")!.cgColor : UIColor(named: "reportColor")!.cgColor
        delegate?.selectItem(item)
    }
}
