//
//  ChallengeViewController+UI.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension ChallengeViewController {
    func configuration() {
        
    }
    
    func setUpView() {
        [weekLabel, firstRankView, secondRankView, thirdRankView, rankTableView, infoButton].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setUpLayout() {
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
        firstRankView.snp.makeConstraints {
            $0.top.equalTo(weekLabel.snp.bottom).offset(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.view.frame.width/3)
            $0.height.equalTo(140)
        }
        secondRankView.snp.makeConstraints {
            $0.top.equalTo(weekLabel.snp.bottom).offset(79)
            $0.trailing.equalTo(firstRankView.snp.leading).offset(-31)
            $0.width.equalTo(firstRankView.snp.width)
            $0.height.equalTo(124)
        }
        thirdRankView.snp.makeConstraints {
            $0.top.equalTo(weekLabel.snp.bottom).offset(101)
            $0.leading.equalTo(firstRankView.snp.trailing).offset(18)
            $0.width.equalTo(firstRankView.snp.width)
            $0.height.equalTo(113)
        }
        rankTableView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(firstRankView.snp.bottom).offset(78)
        }
    }
}
