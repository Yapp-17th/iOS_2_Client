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
        self.view.addSubview(scrollView)
        scrollView.addArrangedSubview(userInfoContainer)
        [characterImageView, leftStarImageView, rightStarImageView, levelTitleLabel, levelLabel, rankTitleLabel, rankLabel].forEach {
            userInfoContainer.addSubview($0)
        }
        scrollView.addArrangedSubview(collectionView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        userInfoContainer.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(-88)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.height * 0.36)
        }
        characterImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(userInfoContainer).offset(-self.view.frame.height * 0.047)
            make.width.equalTo(self.view.frame.width * 0.21)
            make.height.equalTo(characterImageView.snp.width).multipliedBy(1.67)
        }
        leftStarImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(userInfoContainer).offset(-self.view.frame.height * 0.093)
            make.trailing.equalTo(characterImageView.snp.leading).offset(-self.view.frame.width * 0.08)

        }
        rightStarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(leftStarImageView.snp.top)
            make.leading.equalTo(characterImageView.snp.trailing).offset(self.view.frame.width * 0.08)
        }
        levelTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(leftStarImageView)
            make.centerY.equalTo(leftStarImageView).offset(-7)
        }
        rankTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(rightStarImageView)
            make.centerY.equalTo(rightStarImageView).offset(-7)
        }
        levelLabel.snp.makeConstraints { (make) in
            make.top.equalTo(levelTitleLabel.snp.bottom).offset(-7)
            make.centerX.equalTo(levelTitleLabel)
        }
        rankLabel.snp.makeConstraints { (make) in
            make.top.equalTo(rankTitleLabel.snp.bottom).offset(-7)
            make.centerX.equalTo(rankTitleLabel)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(userInfoContainer.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
}
