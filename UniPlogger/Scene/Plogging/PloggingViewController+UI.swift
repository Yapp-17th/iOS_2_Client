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
        self.view.backgroundColor = .mainBackgroundColor
    }
    
    func setupView() {
        self.view.addSubview(mapView)
        self.view.addSubview(trashButton)
        self.view.addSubview(myLocationButton)
        self.view.addSubview(startBottomContainerView)
        self.view.addSubview(doingPauseBottomContainerView)
        self.view.addSubview(trashInfoContainer)
        startBottomContainerView.addSubview(ploggerImageView)
        startBottomContainerView.addSubview(startButton)
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
        trashInfoContainer.addSubview(addTrashCanConfirmButton)
        if #available(iOS 12.0, *) {
            // User Interface is Dark
            [distanceImageView, timeImageView].forEach{
                $0.tintColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
            }
        } else {
            [distanceImageView, timeImageView].forEach{
                $0.tintColor = .black
            }
        }
        
    }
    
    func setupLayout() {
        setupBasicViews()
        setupBottomViews()
        setupDoingViews()
        setupTrashInfoViews()
        if !UserDefaults.standard.bool(forDefines: .ploggingCoachmark){
            setupCoachmarkViews()
        }
        
        
        doingPauseBottomContainerView.isHidden = true
        stopButton.isHidden = true
        resumeButton.isHidden = true
        trashInfoContainer.isHidden = true
        
    }
    
    func updateView() {
        
    }
    
    func setupBasicViews() {
        
        mapView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        myLocationButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.trailing.equalTo(-17)
            $0.width.height.equalTo(40)
        }
        
        trashButton.snp.makeConstraints{
            $0.trailing.equalTo(self.view.snp.trailing).offset(-16)
            $0.bottom.equalTo(self.startBottomContainerView.snp.top).offset(-16)
            $0.width.height.equalTo(50)
        }
    }
    
    func setupBottomViews(){
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
            $0.leading.equalTo(startButton).offset(36)
            $0.bottom.equalTo(startButton).offset(-25.51)
            $0.top.equalTo(32)
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
    }
    
    func setupDoingViews(){
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
    }
    
    func setupTrashInfoViews(){
        trashInfoContainer.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        trashInfoTitleLabel.snp.makeConstraints{
            $0.top.equalTo(30)
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
        
        addTrashCanConfirmButton.snp.makeConstraints{
            $0.top.equalTo(trashInfoDescriptionLabel.snp.bottom).offset(16)
            $0.leading.equalTo(16)
            $0.trailing.equalTo(-16)
            $0.height.equalTo(56)
            $0.bottom.equalTo(-19)
        }
    }
    
    func setupCoachmarkViews(){
        
        
        self.view.addSubview(coachmarkContainer)
        coachmarkContainer.addSubview(closeCoachmarkButton)
        coachmarkContainer.addSubview(coachmarkDeleteTrashcanLabel)
        coachmarkContainer.addSubview(coachmarkTrashcanIcon)
        coachmarkContainer.addSubview(coachmarkSmallHandIcon)
        coachmarkContainer.addSubview(coachmarkAddTrashcanIcon)
        coachmarkContainer.addSubview(coachmarkAddTrashcanLabel)
        coachmarkContainer.addSubview(coachmarkStartButton)
        coachmarkContainer.addSubview(coachmarkBigHandIcon)
        coachmarkContainer.addSubview(coachmarkStartButtonLabel)
        
        coachmarkContainer.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        closeCoachmarkButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.trailing.equalTo(-21)
            $0.width.height.equalTo(30)
        }
        
        coachmarkDeleteTrashcanLabel.snp.makeConstraints {
            $0.top.equalTo(closeCoachmarkButton.snp.bottom).offset(52)
            $0.trailing.equalTo(-24)
        }
        
        coachmarkTrashcanIcon.snp.makeConstraints {
            $0.trailing.equalTo(coachmarkDeleteTrashcanLabel.snp.leading).offset(-10)
            $0.centerY.equalTo(coachmarkDeleteTrashcanLabel)
        }
        
        coachmarkSmallHandIcon.snp.makeConstraints {
            $0.top.equalTo(coachmarkTrashcanIcon.snp.centerY)
            $0.leading.equalTo(coachmarkTrashcanIcon.snp.centerX).offset(-8)
        }
        coachmarkAddTrashcanIcon.snp.makeConstraints {
            $0.edges.equalTo(trashButton)
        }
        coachmarkAddTrashcanLabel.snp.makeConstraints{
            $0.trailing.equalTo(coachmarkAddTrashcanIcon.snp.leading).offset(-12)
            $0.top.equalTo(coachmarkAddTrashcanIcon).offset(4)
        }
        coachmarkStartButton.snp.makeConstraints{
            $0.edges.equalTo(startButton)
        }
        coachmarkBigHandIcon.snp.makeConstraints {
            $0.top.equalTo(coachmarkStartButton.snp.bottom).offset(-16)
            $0.leading.equalTo(coachmarkStartButton.snp.centerX).offset(-16)
        }
        
        coachmarkStartButtonLabel.snp.makeConstraints {
            $0.top.equalTo(coachmarkBigHandIcon.snp.bottom).offset(8)
            $0.centerX.equalTo(coachmarkStartButton)
        }
        self.tabBarController?.tabBar.alpha = 0
    }
}
