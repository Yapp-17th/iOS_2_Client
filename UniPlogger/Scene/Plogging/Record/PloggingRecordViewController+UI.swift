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
        self.view.backgroundColor = .mainBackgroundColor
    }
    
    func setupView() {
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
        setupScrollView()
        setupSkipButton()
        setupRecordContainer()
        setupTitleLabel()
        setupCollectionView()
        setupNextButton()
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
    
    func setupSkipButton(){
        let v = UIView()
        scrollView.addArrangedSubview(v)
        v.addSubview(skipButton)
        skipButton.snp.makeConstraints{
            $0.top.equalTo(28)
            $0.trailing.equalTo(-27)
            $0.bottom.equalTo(-33)
        }
    }
    
    func setupRecordContainer(){
        let v = UIView()
        v.addSubview(recordContainer)
        scrollView.addArrangedSubview(v)
        recordContainer.addSubview(distanceContainer)
        recordContainer.addSubview(timeContainer)
        distanceContainer.addSubview(distanceImageView)
        distanceContainer.addSubview(distanceLabel)
        distanceContainer.addSubview(distanceUnitLabel)
        
        timeContainer.addSubview(timeImageView)
        timeContainer.addSubview(timeLabel)
        
        recordContainer.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(48)
            $0.trailing.equalTo(-48)
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
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(distanceLabel).offset(-2)
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
    
    func setupTitleLabel(){
        let v = UIView()
        v.addSubview(titleLabel)
        scrollView.addArrangedSubview(v)
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(44)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
            $0.bottom.equalTo(-37)
        }
    }
    
    func setupCollectionView(){
        let v = UIView()
        v.addSubview(collectionView)
        scrollView.addArrangedSubview(v)
        collectionView.snp.makeConstraints{
            $0.leading.equalTo(26)
            $0.trailing.equalTo(-26)
            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(340)
        }
    }
    
    func setupNextButton(){
        let v = UIView()
        v.addSubview(nextButtonView)
        
        scrollView.addArrangedSubview(v)
        
        nextButtonView.addSubview(nextLabel)
        nextButtonView.addSubview(nextImageView)
        nextButtonView.addSubview(nextButton)
        
        nextButtonView.snp.makeConstraints{
            $0.top.equalTo(62)
            $0.trailing.equalTo(-32)
            $0.bottom.equalTo(-60)
            $0.width.equalTo(134)
            $0.height.equalTo(52)
        }
        
        nextImageView.snp.makeConstraints{
            $0.trailing.equalTo(-30)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        nextLabel.snp.makeConstraints{
            $0.trailing.equalTo(nextImageView.snp.leading).offset(-8)
            $0.centerY.equalToSuperview().offset(0.5)
        }
        
        nextButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        
    }
    func updateView() {
        
    }
}
