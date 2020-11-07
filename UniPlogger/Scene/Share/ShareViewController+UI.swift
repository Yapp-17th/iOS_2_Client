//
//  ShareViewController+UI.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension ShareViewController {
    func configuration() {
        
    }
    
    func setUpView() {
        [backgroundImageView, ploggingImageView, dismissButton, shareButtonView, shareButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        ploggingImageView.snp.makeConstraints {
            $0.width.height.equalTo(340)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(179)
        }
        dismissButton.snp.makeConstraints {
            $0.width.height.equalTo(40)
            $0.top.equalToSuperview().offset(58)
            $0.trailing.equalToSuperview().offset(-16)
        }
        shareButtonView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(ploggingImageView.snp.bottom)
        }
        shareButton.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.centerY.equalTo(shareButtonView)
        }
    }
}
