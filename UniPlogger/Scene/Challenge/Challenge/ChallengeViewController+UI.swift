//
//  ChallengeViewController+UI.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension ChallengeViewController {
    
    func setUpView() {
        [backgroundImageView, weekLabel, rankTableView, infoButton, scoreInfoView, dimView].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        scoreInfoView.isHidden = true
    }
    
    func setUpLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        weekLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(57)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(24)
        }
        infoButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54)
            $0.trailing.equalToSuperview().offset(-20)
            $0.width.height.equalTo(24)
        }
        rankTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(weekLabel.snp.bottom)
        }
        scoreInfoView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        dimView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
}
