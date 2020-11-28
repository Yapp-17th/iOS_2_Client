//
//  DetailViewController+UI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension DetailViewController {
    
    func setUpViews() {
        super.setupViews()
        [backgroundImageView, ploggingImageView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        super.setupLayouts()
        backgroundImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-30)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        ploggingImageView.snp.makeConstraints {
            $0.width.height.equalTo(340)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.frame.height * 0.29)
        }
    }
    
}
