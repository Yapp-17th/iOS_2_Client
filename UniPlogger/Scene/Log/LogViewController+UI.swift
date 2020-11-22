//
//  LogViewController+UI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
extension LogViewController {
    func configuration() {
        // backgroundColor = .white
    }
    
    func setupView() {
        self.view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        setupScrollView()
        //PloggerContainer
        scrollView.addArrangedSubview(ploggerContainer)
        ploggerContainer.addSubview(nicknameLabel)
        ploggerContainer.addSubview(ploggerImageView)
        ploggerContainer.addSubview(yellowStarImageView)
        ploggerContainer.addSubview(pinkStarImageView)
        yellowStarImageView.addSubview(levelTitleLabel)
        yellowStarImageView.addSubview(levelLabel)
        pinkStarImageView.addSubview(rankTItleLabel)
        pinkStarImageView.addSubview(rankLabel)
        
    }
    
    func setupLayout() {
        setupPloggerContainer()
    }
    
    func updateView() {
        
    }
    
    func setupScrollView() {
        self.view.addSubview(scrollView)
        scrollView.containerView.snp.makeConstraints{
            $0.width.equalTo(self.view)
        }
        
        scrollView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    func setupPloggerContainer(){
        ploggerContainer.snp.makeConstraints{
            $0.height.equalTo(222)
        }
        nicknameLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(20)
        }
        ploggerImageView.snp.makeConstraints{
            $0.top.equalTo(nicknameLabel.snp.bottom).offset(19)
            $0.bottom.equalTo(-28)
            $0.centerX.equalToSuperview()
        }
        
        yellowStarImageView.snp.makeConstraints{
            $0.top.equalTo(ploggerImageView)
            $0.trailing.equalTo(ploggerImageView.snp.leading).offset(-28)
        }
        pinkStarImageView.snp.makeConstraints{
            $0.top.equalTo(ploggerImageView)
            $0.leading.equalTo(ploggerImageView.snp.trailing).offset(28)
        }
        
        levelTitleLabel.snp.makeConstraints{
            $0.top.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        
        levelLabel.snp.makeConstraints{
            $0.top.equalTo(levelTitleLabel.snp.bottom).offset(-2)
            $0.centerX.equalToSuperview()
        }
        
        rankTItleLabel.snp.makeConstraints{
            $0.top.equalTo(24)
            $0.centerX.equalToSuperview()
        }
        
        rankLabel.snp.makeConstraints{
            $0.top.equalTo(rankTItleLabel.snp.bottom).offset(-2)
            $0.centerX.equalToSuperview()
        }
    }
    
}
