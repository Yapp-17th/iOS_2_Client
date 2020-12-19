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
        [backgroundImageView, ploggingImageViewContainer, shareButtonView].forEach {
            self.view.addSubview($0)
        }
        ploggingImageViewContainer.addSubview(ploggingImageView)
        shareButtonView.addSubview(shareButton)
    }
    
    func setUpLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(-88)
            $0.bottom.leading.trailing.equalToSuperview()
        }
        ploggingImageViewContainer.snp.makeConstraints {
            $0.width.height.equalTo(340)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(179)
        }
        
        ploggingImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        shareButtonView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(ploggingImageView.snp.bottom)
        }
        shareButton.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.centerX.centerY.equalTo(shareButtonView)
        }
        shareButtonView.isHidden = true
    }
    
}
