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
        title = "플로거짱 로그"
    }
    
    func setupView() {
        setupScrollView()
        //PloggerContainer
        scrollView.addArrangedSubview(ploggerContainer)
        ploggerContainer.addSubview(ploggerImageView)
        ploggerContainer.addSubview(yellowStarImageView)
        ploggerContainer.addSubview(pinkStarImageView)
        yellowStarImageView.addSubview(levelTitleLabel)
        yellowStarImageView.addSubview(levelLabel)
        pinkStarImageView.addSubview(rankTItleLabel)
        pinkStarImageView.addSubview(rankLabel)
        
        //StatContainer
        scrollView.addArrangedSubview(statContainer)
        statContainer.addSubview(statTitleLabel)
        statContainer.addSubview(weeklyTitleLabel)
        statContainer.addSubview(weeklyCircleView)
        statContainer.addSubview(monthlyTitleLabel)
        statContainer.addSubview(monthlyCircleView)
        
        //CollectionView
        scrollView.addArrangedSubview(collectionView)
    }
    
    func setupLayout() {
        setupPloggerContainer()
        setupStatContainer()
    }
    
    func updateView() {
        
    }
    
    func setupScrollView() {
        self.view.addSubview(scrollView)
        scrollView.containerView.snp.makeConstraints{
            $0.width.equalTo(self.view)
        }
        
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func setupPloggerContainer(){
        ploggerContainer.snp.makeConstraints{
            $0.top.equalToSuperview().offset(-88)
            $0.height.equalTo(320.16)
        }
        ploggerImageView.snp.makeConstraints{
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
    
    func setupStatContainer(){
        statContainer.snp.makeConstraints{
            $0.height.equalTo(182)
        }
        
        statTitleLabel.snp.makeConstraints{
            $0.top.equalTo(14)
            $0.centerX.equalToSuperview()
        }
        
        weeklyCircleView.snp.makeConstraints{
            $0.bottom.equalTo(-20)
            $0.trailing.equalTo(statTitleLabel.snp.leading).offset(-32)
            $0.width.height.equalTo(82)
        }
        
        weeklyTitleLabel.snp.makeConstraints{
            $0.centerX.equalTo(weeklyCircleView)
            $0.bottom.equalTo(weeklyCircleView.snp.top).offset(-10)
        }
        
        monthlyCircleView.snp.makeConstraints{
            $0.bottom.equalTo(-20)
            $0.leading.equalTo(statTitleLabel.snp.trailing).offset(32)
            $0.width.height.equalTo(82)
        }
        
        monthlyTitleLabel.snp.makeConstraints{
            $0.centerX.equalTo(monthlyCircleView)
            $0.bottom.equalTo(monthlyCircleView.snp.top).offset(-10)
        }
    }
    
    func setupCollectionView(){
        
    }
}
