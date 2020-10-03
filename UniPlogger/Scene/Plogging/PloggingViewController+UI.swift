//
//  PloggingViewController+UI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/03.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

extension PloggingViewController {
    func configuration() {
        // backgroundColor = .whit
    }
    
    func setupView() {
        self.view.addSubview(mapView)
        self.view.addSubview(trashButton)
        self.view.addSubview(startBottomContainerView)
        self.view.addSubview(doingPauseBottomContainerView)
        startBottomContainerView.addSubview(startButton)
        startBottomContainerView.addSubview(ploggerImageView)
        startBottomContainerView.addSubview(bubbleView)
        bubbleView.addSubview(bubbleLabel)
        
        
        doingPauseBottomContainerView.addSubview(pauseButton)
        doingPauseBottomContainerView.addSubview(distanceContainer)
        doingPauseBottomContainerView.addSubview(timeContainer)
        
        distanceContainer.addSubview(distanceImageView)
        distanceContainer.addSubview(distanceLabel)
        distanceContainer.addSubview(distanceUnitLabel)
        
        timeContainer.addSubview(timeImageView)
        timeContainer.addSubview(timeLabel)
    }
    
    func setupLayout() {
        mapView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        trashButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.trailing.equalTo(-17)
            $0.width.height.equalTo(50)
        }
        startBottomContainerView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        startButton.snp.makeConstraints{
            $0.leading.equalTo(16)
            $0.trailing.equalTo(-16)
            $0.height.equalTo(56)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-19)
        }
        ploggerImageView.snp.makeConstraints{
            $0.leading.equalTo(startButton).offset(30)
            $0.width.equalTo(48)
            $0.height.equalTo(53)
            $0.bottom.equalTo(startButton.snp.top)
            $0.top.equalTo(29)
        }
        bubbleView.snp.makeConstraints{
            $0.leading.equalTo(ploggerImageView.snp.trailing).offset(14)
            $0.bottom.equalTo(startButton.snp.top).offset(-17)
        }
        bubbleLabel.snp.makeConstraints{
            $0.top.equalTo(11)
            $0.leading.equalTo(10)
            $0.trailing.equalTo(-15)
            $0.bottom.equalTo(-10)
        }
        
        
        //DoingContainer
        doingPauseBottomContainerView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        pauseButton.snp.makeConstraints{
            $0.leading.equalTo(16)
            $0.trailing.equalTo(-16)
            $0.height.equalTo(56)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-19)
        }
        
        distanceContainer.snp.makeConstraints{
            $0.top.equalTo(32)
            $0.leading.equalTo(48)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-95)
            
        }
        
        timeContainer.snp.makeConstraints{
            $0.top.equalTo(32)
            $0.trailing.equalTo(-48)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-95)
        }
        
        distanceLabel.snp.makeConstraints{
            $0.leading.bottom.equalToSuperview()
        }
        
        distanceUnitLabel.snp.makeConstraints{
            $0.leading.equalTo(distanceLabel.snp.trailing).offset(10)
            $0.trailing.bottom.equalToSuperview()
        }
        
        distanceImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalTo(26)
            $0.height.equalTo(25.67)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(distanceLabel.snp.top).offset(-3)
        }
        
        timeLabel.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        timeImageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.width.equalTo(22)
            $0.height.equalTo(25.62)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(timeLabel.snp.top).offset(-3)
        }
        
        doingPauseBottomContainerView.isHidden = true
    }
    
    func updateView() {
        
    }
}
