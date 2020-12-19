//
//  RegistrationViewController+UI.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

extension RegistrationViewController {
    func configuration() {
        let backButton = UIBarButtonItem(image: UIImage(named: "btn_back"), style: .plain, target: self, action: #selector(back(_:)))
        navigationItem.leftBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = Color.textBlack
        self.view.backgroundColor = .mainBackgroundColor
        self.navigationItem.title = "회원가입"
        if let vcs = self.navigationController?.viewControllers, let _ = vcs[vcs.count - 2] as? TutorialThirdViewController {
            self.navigationItem.hidesBackButton = true
        }
    }
    
    func setupView() {
        self.view.addSubview(accountFieldBox)
        accountFieldBox.addSubview(accountField)
        self.view.addSubview(passwordFieldBox)
        passwordFieldBox.addSubview(passwordField)
        self.view.addSubview(passwordInfoLabel)
        self.view.addSubview(passwordConfirmFieldBox)
        passwordConfirmFieldBox.addSubview(passwordConfirmField)
        self.view.addSubview(nicknameFieldBox)
        nicknameFieldBox.addSubview(nicknameField)
        
        self.view.addSubview(registrationButton)
    }
    
    func setupLayout() {
        accountFieldBox.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(22)
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
        
        passwordInfoLabel.snp.makeConstraints{
            $0.top.equalTo(passwordFieldBox.snp.bottom).offset(10)
            $0.leading.equalTo(passwordFieldBox).offset(27)
        }
        passwordConfirmFieldBox.snp.makeConstraints{
            $0.top.equalTo(passwordInfoLabel.snp.bottom).offset(10)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(48)
        }
        
        passwordConfirmField.snp.makeConstraints{
            $0.top.equalTo(12)
            $0.bottom.equalTo(-12)
            $0.leading.equalTo(26)
            $0.trailing.equalTo(-26)
        }
        
        nicknameFieldBox.snp.makeConstraints{
            $0.top.equalTo(passwordConfirmFieldBox.snp.bottom).offset(12)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.equalTo(48)
        }
        
        nicknameField.snp.makeConstraints{
            $0.top.equalTo(12)
            $0.bottom.equalTo(-12)
            $0.leading.equalTo(26)
            $0.trailing.equalTo(-26)
        }
        
        registrationButton.snp.makeConstraints {
            $0.top.equalTo(nicknameFieldBox.snp.bottom).offset(60)
            $0.leading.equalTo(18)
            $0.trailing.equalTo(-18)
            $0.height.equalTo(52)
        }
    }
    
    func updateView() {
        
    }
}

