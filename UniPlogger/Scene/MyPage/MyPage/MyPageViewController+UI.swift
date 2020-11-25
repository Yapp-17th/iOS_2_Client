//
//  MyPageViewController+UI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension MyPageViewController {
    
    func setUpViews() {
        [backgroundImageView, characterImageView, leftStarImageView, rightStarImageView, infoView, itemTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.height * 0.36)
        }
        characterImageView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(backgroundImageView).offset(-self.view.frame.height * 0.047)
            make.width.equalTo(self.view.frame.width * 0.21)
            make.height.equalTo(characterImageView.snp.width).multipliedBy(1.67)
        }
        leftStarImageView.snp.makeConstraints { (make) in
            make.bottom.equalTo(backgroundImageView).offset(-self.view.frame.height * 0.093)
            make.trailing.equalTo(characterImageView.snp.leading).offset(-self.view.frame.width * 0.08)
//            make.width.equalTo(self.view.frame.width * 0.213)
//            make.height.equalTo(leftStarImageView.snp.width)
        }
        rightStarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(leftStarImageView.snp.top)
            make.leading.equalTo(characterImageView.snp.trailing).offset(self.view.frame.width * 0.08)
//            make.width.height.equalTo(leftStarImageView)
        }
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImageView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        itemTableView.snp.makeConstraints { (make) in
            make.top.equalTo(infoView.snp.top).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(207.5)
        }
    }
    
}
