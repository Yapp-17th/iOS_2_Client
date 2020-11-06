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
        self.view.addSubview(myLocationButton)
        self.view.addSubview(startBottomContainerView)
        self.view.addSubview(doingPauseBottomContainerView)
        self.view.addSubview(trashInfoContainer)
        startBottomContainerView.addSubview(startButton)
        startBottomContainerView.addSubview(ploggerImageView)
        startBottomContainerView.addSubview(bubbleView)
        bubbleView.addSubview(bubbleLabel)
        
        
        doingPauseBottomContainerView.addSubview(pauseButton)
        doingPauseBottomContainerView.addSubview(stopButton)
        doingPauseBottomContainerView.addSubview(resumeButton)
        doingPauseBottomContainerView.addSubview(distanceContainer)
        doingPauseBottomContainerView.addSubview(timeContainer)
        
        distanceContainer.addSubview(distanceImageView)
        distanceContainer.addSubview(distanceLabel)
        
        timeContainer.addSubview(timeImageView)
        timeContainer.addSubview(timeLabel)
        
        trashInfoContainer.addSubview(trashInfoTitleLabel)
        trashInfoContainer.addSubview(trashInfoAddressLabel)
        trashInfoContainer.addSubview(trashInfoDescriptionLabel)
        
        if #available(iOS 12.0, *) {
                // User Interface is Dark
                [distanceLabel,timeLabel].forEach {
                    $0.textColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
                }
                [distanceImageView, timeImageView].forEach{
                    $0.tintColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
                }
        } else {
            [distanceLabel,timeLabel].forEach {
                $0.textColor = .black
            }
            [distanceImageView, timeImageView].forEach{
                $0.tintColor = .black
            }
        }
    }
    
    func setupLayout() {
        mapView.snp.makeConstraints{
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        myLocationButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.trailing.equalTo(-17)
            $0.width.height.equalTo(40)
        }
        
        trashButton.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-16)
            $0.bottom.equalTo(self.startBottomContainerView.snp.top).offset(-16)
            $0.width.height.equalTo(60)
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
        
        stopButton.snp.makeConstraints{
            $0.top.leading.bottom.equalTo(pauseButton)
            $0.width.equalToSuperview().multipliedBy(0.5).offset(-24)
        }
        
        resumeButton.snp.makeConstraints{
            $0.top.trailing.bottom.equalTo(pauseButton)
            $0.width.equalToSuperview().multipliedBy(0.5).offset(-24)
        }
        
        distanceContainer.snp.makeConstraints{
            $0.top.equalTo(32)
            $0.centerX.equalTo(stopButton)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-95)
            
        }
        
        timeContainer.snp.makeConstraints{
            $0.top.equalTo(32)
            $0.centerX.equalTo(resumeButton)
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-95)
        }
        
        distanceLabel.snp.makeConstraints{
            $0.centerX.bottom.equalToSuperview()
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
        
        trashInfoContainer.snp.makeConstraints{
            $0.edges.equalTo(startBottomContainerView)
        }
        
        trashInfoTitleLabel.snp.makeConstraints{
            $0.top.equalTo(16)
            $0.leading.equalTo(12)
            $0.trailing.equalTo(-12)
        }
        
        trashInfoAddressLabel.snp.makeConstraints{
            $0.top.equalTo(trashInfoTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(12)
            $0.trailing.equalTo(-12)
        }
        
        trashInfoDescriptionLabel.snp.makeConstraints{
            $0.top.equalTo(trashInfoAddressLabel.snp.bottom).offset(8)
            $0.leading.equalTo(12)
            $0.trailing.equalTo(-12)
        }
        
        doingPauseBottomContainerView.isHidden = true
        
        stopButton.isHidden = true
        resumeButton.isHidden = true
        trashInfoContainer.isHidden = true
    }
    
    func updateView() {
        
    }
}
