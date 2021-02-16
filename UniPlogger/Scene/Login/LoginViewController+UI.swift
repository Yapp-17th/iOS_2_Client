//
//  LoginViewController+UI.swift
//  UniPlogger
//
//  Created by 손병근 on 2021/02/17.
//  Copyright © 2021 손병근. All rights reserved.
//

import UIKit

extension LoginViewController {
    func configuration() {
        self.view.backgroundColor = .loginRegistrationBackground
    }
    
    func setupView() {
        self.view.addSubview(scrollView)
        scrollView.addArrangedSubview(ploggerBackgroundImageView)
        scrollView.addArrangedSubview(formContainerView)
        
        formContainerView.addSubview(accountFieldBox)
        accountFieldBox.addSubview(accountField)
        formContainerView.addSubview(passwordFieldBox)
        passwordFieldBox.addSubview(passwordField)
        formContainerView.addSubview(loginButton)
        formContainerView.addSubview(findPasswordButton)
        formContainerView.addSubview(registrationButton)
    }
    
    func setupLayout() {
        scrollView.containerView.snp.makeConstraints{
            $0.width.equalTo(self.view)
        }
        
        scrollView.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        ploggerBackgroundImageView.snp.makeConstraints {
            $0.height.equalTo(366)
        }
        
        accountFieldBox.snp.makeConstraints{
            $0.top.equalTo(36)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(48)
        }
        
        accountField.snp.makeConstraints{
            $0.top.equalTo(12)
            $0.bottom.equalTo(-12)
            $0.leading.equalTo(26)
            $0.trailing.equalTo(-26)
        }
        
        passwordFieldBox.snp.makeConstraints{
            $0.top.equalTo(accountFieldBox.snp.bottom).offset(12)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(48)
        }
        
        passwordField.snp.makeConstraints{
            $0.top.equalTo(12)
            $0.bottom.equalTo(-12)
            $0.leading.equalTo(26)
            $0.trailing.equalTo(-26)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordFieldBox.snp.bottom).offset(32)
            $0.leading.equalTo(18)
            $0.trailing.equalTo(-18)
            $0.height.equalTo(52)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.leading.equalTo(20)
            $0.bottom.equalTo(-16)
        }
        
        registrationButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.trailing.equalTo(-20)
            $0.bottom.equalTo(-16)
        }
    }
    
    func updateUI() {
        
    }
}
