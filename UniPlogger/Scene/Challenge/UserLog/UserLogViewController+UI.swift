//
//  UserLogViewController+UI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension UserLogViewController {
    
    func setUpViews() {
        [nextButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        nextButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
}
