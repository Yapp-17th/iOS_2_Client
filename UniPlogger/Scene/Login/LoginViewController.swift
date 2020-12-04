//
//  LoginViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Then
import SnapKit

protocol LoginDisplayLogic: class {
    func displayError(error: Common.CommonError, useCase: Login.UseCase)
}

class LoginViewController: UIViewController, LoginDisplayLogic {
    var interactor: LoginBusinessLogic?
    var router: (NSObjectProtocol & LoginRoutingLogic & LoginDataPassing)?
    
    let ploggerBackgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bg_loginPlogger")
        $0.contentMode = .scaleAspectFill
    }
    
    let ploggerImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_loginPlogger")
        $0.contentMode = .scaleAspectFit
    }
    
    let formContainerView = UIView().then {
        $0.backgroundColor = .mainBackgroundColor
    }
    
    let accountFieldBox = UIView().then {
        $0.backgroundColor = .recordCellBackgroundColor
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let accountField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.keyboardType = .emailAddress
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "아이디 (이메일)"
    }
    
    let passwordFieldBox = UIView().then {
        $0.backgroundColor = .recordCellBackgroundColor
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let passwordField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.isSecureTextEntry = true
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "비밀번호"
    }
    
    lazy var loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.backgroundColor = UIColor(named: "color_loginButton")
        $0.titleLabel?.font = .roboto(ofSize: 15, weight: .bold)
        $0.isEnabled = false
        $0.layer.cornerRadius = 26
        $0.layer.masksToBounds = true
    }
    
    lazy var findPasswordButton = UIButton().then{
        $0.setTitle("비밀번호 찾기", for: .normal)
        $0.titleLabel?.font = .notoSans(ofSize: 14, weight: .regular)
    }
    
    lazy var registrationButton = UIButton().then{
        $0.setTitle("회원가입", for: .normal)
        $0.titleLabel?.font = .notoSans(ofSize: 14, weight: .regular)
    }
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(ploggerBackgroundImageView)
        ploggerBackgroundImageView.addSubview(ploggerImageView)
        self.view.addSubview(formContainerView)
        
        formContainerView.addSubview(accountFieldBox)
        accountFieldBox.addSubview(accountField)
        formContainerView.addSubview(passwordFieldBox)
        passwordFieldBox.addSubview(passwordField)
        formContainerView.addSubview(loginButton)
        formContainerView.addSubview(findPasswordButton)
        formContainerView.addSubview(registrationButton)
        
        ploggerBackgroundImageView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        
        ploggerImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(-24)
        }
        
        formContainerView.snp.makeConstraints {
            $0.top.equalTo(ploggerBackgroundImageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
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
            $0.top.equalTo(passwordField.snp.bottom).offset(32)
            $0.leading.equalTo(18)
            $0.trailing.equalTo(-18)
            $0.height.equalTo(52)
        }
        
        findPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.leading.equalTo(20)
        }
        
        registrationButton.snp.makeConstraints{
            $0.top.equalTo(loginButton.snp.bottom).offset(12)
            $0.trailing.equalTo(-20)
        }
        
    }
    
    func displayError(error: Common.CommonError, useCase: Login.UseCase){
        //handle error with its usecase
    }
}
