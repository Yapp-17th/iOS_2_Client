//
//  PloggingRecordViewController+UI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
extension PloggingRecordViewController {
  func configuration() {
    // backgroundColor = .white
  }
  
  func setupView() {
    self.view.addSubview(skipButton)
    self.view.addSubview(recordContainer)
    recordContainer.addSubview(distanceContainer)
    recordContainer.addSubview(timeContainer)
    distanceContainer.addSubview(distanceImageView)
    distanceContainer.addSubview(distanceLabel)
    distanceContainer.addSubview(distanceUnitLabel)
    
    timeContainer.addSubview(timeImageView)
    timeContainer.addSubview(timeLabel)
    self.view.addSubview(titleLabel)
    self.view.addSubview(collectionView)
    self.view.addSubview(nextButtonView)
    self.view.addSubview(nextButton)
    
    if #available(iOS 12.0, *) {
            // User Interface is Dark
            [distanceLabel,distanceUnitLabel,timeLabel].forEach {
                $0.textColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
            }
            [distanceImageView, timeImageView].forEach{
                $0.tintColor = self.traitCollection.userInterfaceStyle == .dark ? .white : .black
            }
    } else {
        [distanceLabel,distanceUnitLabel,timeLabel].forEach {
            $0.textColor = .black
        }
        [distanceImageView, timeImageView].forEach{
            $0.tintColor = .black
        }
    }
  }
  
  func setupLayout() {
    skipButton.snp.makeConstraints{
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        $0.trailing.equalTo(-27)
    }
    
    recordContainer.snp.makeConstraints{
        $0.leading.equalTo(48)
        $0.trailing.equalTo(-48)
        $0.top.equalTo(skipButton.snp.bottom).offset(32)
        $0.height.equalTo(64)
    }
    
    distanceContainer.snp.makeConstraints{
        $0.top.bottom.equalToSuperview()
        $0.leading.equalToSuperview()
        
    }
    
    timeContainer.snp.makeConstraints{
        $0.top.bottom.equalToSuperview()
        $0.trailing.equalToSuperview()
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
    
    titleLabel.snp.makeConstraints{
        $0.top.equalTo(recordContainer.snp.bottom).offset(44)
        $0.centerX.equalToSuperview()
    }
    
    nextButtonView.snp.makeConstraints{
        $0.width.equalTo(134)
        $0.height.equalTo(52)
        $0.trailing.equalTo(-32)
        $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
    }
    
    nextButton.snp.makeConstraints{
        $0.edges.equalTo(nextButtonView)
    }
    
    collectionView.snp.makeConstraints{
        $0.centerX.equalToSuperview()
        $0.width.equalTo(324)
        $0.height.equalTo(340)
        $0.top.equalTo(titleLabel.snp.bottom).offset(36)
        $0.bottom.equalTo(nextButtonView.snp.top).offset(-62)
    }
  }
  
  func updateView() {
    
  }
}
