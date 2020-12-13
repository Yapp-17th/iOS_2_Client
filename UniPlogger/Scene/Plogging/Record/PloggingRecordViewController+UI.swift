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
        
    }
    
    func setupLayout() {
        setupScrollView()
        setupSkipButton()
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
            $0.bottom.equalTo(-4)
        }
    }
    
    func setupTitleLabel(){
        let v = UIView()
        v.addSubview(titleLabel)
        v.addSubview(subtitleLabel)
        scrollView.addArrangedSubview(v)
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(8)
            $0.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-28)
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
