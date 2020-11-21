//
//  ReportItemCell.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ReportItemCell: UICollectionViewCell {
    
    var content: String = "" {
        didSet {
            setUpLayout()
        }
    }
    static let ID = "reportItemCell"
    
    lazy var itemLabel = ReportItemLabel(text: content).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview($0)
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        self.content = ""
        super.init(frame: .zero)
    }
    
    private func setUpLayout() {
        itemLabel.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
        }
    }
    
}
