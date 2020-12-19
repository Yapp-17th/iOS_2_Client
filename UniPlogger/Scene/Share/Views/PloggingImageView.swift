//
//  PloggingImageView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class PloggingImageView: UIImageView {
    lazy var ploggingInfoView = PloggingInfoView()
    
    init() {
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setUpView()
        setUpLayout()
    }

    func setUpView() {
        [ploggingInfoView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        ploggingInfoView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(145)
        }
    }

}
