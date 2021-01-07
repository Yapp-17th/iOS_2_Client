//
//  RegistrationViewController.swift
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
import Moya
protocol RegistrationDisplayLogic: class {
    func displayFetchNickname(viewModel: Registration.FetchNickname.ViewModel)
    func displayValidation(viewModel: Registration.ValidationViewModel)
    func displayRegistration()
    func displayError(error: Common.CommonError, useCase: Registration.UseCase)
}

class RegistrationViewController: UIViewController {
    var interactor: RegistrationBusinessLogic?
    var router: (NSObjectProtocol & RegistrationRoutingLogic & RegistrationDataPassing)?
    
    let accountFieldBox = UIView().then {
        $0.backgroundColor = .formBoxBackground
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let accountField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "아이디 (이메일)"
        $0.addTarget(self, action: #selector(validateAccount), for: .editingChanged)
    }
    
    let passwordFieldBox = UIView().then {
        $0.backgroundColor = .formBoxBackground
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let passwordField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.keyboardType = .asciiCapable
        $0.isSecureTextEntry = true
        $0.textContentType = .newPassword
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "비밀번호"
        $0.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        $0.addTarget(self, action: #selector(validatePasswordConfirm), for: .editingChanged)
    }
    
    let passwordInfoLabel = UILabel().then {
        $0.text = "8~20자 이내의 영문과 숫자 조합을 입력해주세요"
        $0.textColor = UIColor(named: "color_registrationPasswordInfoLabel")
        $0.font = .dynamicNotosans(fontSize: 14, weight: .regular)
    }
    
    let passwordConfirmFieldBox = UIView().then {
        $0.backgroundColor = .formBoxBackground
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let passwordConfirmField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.keyboardType = .asciiCapable
        $0.isSecureTextEntry = true
        $0.textContentType = .newPassword
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "비밀번호 재입력"
        $0.addTarget(self, action: #selector(validatePassword), for: .editingChanged)
        $0.addTarget(self, action: #selector(validatePasswordConfirm), for: .editingChanged)
    }
    
    let nicknameFieldBox = UIView().then {
        $0.backgroundColor = .formBoxBackground
        $0.layer.cornerRadius = 24
        $0.layer.masksToBounds = true
    }
    
    let nicknameField = UITextField().then {
        $0.font = .notoSans(ofSize: 16, weight: .regular)
        $0.backgroundColor = .clear
        $0.borderStyle = .none
        $0.placeholder = "닉네임"
        $0.addTarget(self, action: #selector(validateNickname), for: .editingChanged)
    }
    
    lazy var registrationButton = UIButton().then {
        $0.setTitle("회원가입 완료", for: .normal)
        $0.backgroundColor = .buttonDisabled
        $0.titleLabel?.font = .roboto(ofSize: 15, weight: .bold)
        $0.isEnabled = false
        $0.layer.cornerRadius = 26
        $0.layer.masksToBounds = true
        $0.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
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
        let interactor = RegistrationInteractor()
        let presenter = RegistrationPresenter()
        let router = RegistrationRouter()
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
        configuration()
        setupView()
        setupLayout()
        self.interactor?.fetchNickname()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.accountField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        (navigationController as? TutorialNavigationController)?.setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @objc func validateAccount(){
        guard let text = accountField.text else { return }
        let request = Registration.ValidateAccount.Request(account: text)
        self.interactor?.validateAccount(request: request)
    }
    
    @objc func validatePassword(){
        guard let text = passwordField.text else { return }
        let request = Registration.ValidatePassword.Request(password: text)
        self.interactor?.validatePassword(request: request)
    }
    
    @objc func validatePasswordConfirm(){
        guard let password = passwordField.text else { return }
        guard let passwordConfirm = passwordConfirmField.text else { return }
        let request = Registration.ValidatePasswordConfirm.Request(
            password: password,
            passwordConfirm: passwordConfirm
        )
        self.interactor?.validatePasswordConfirm(request: request)
    }
    
    @objc func validateNickname(){
        guard let text = nicknameField.text else { return }
        let request = Registration.ValidateNickname.Request(nickname: text)
        self.interactor?.validateNickname(request: request)
    }
    
    @objc func registrationButtonTapped() {
        guard let account = accountField.text, !account.isEmpty,
              let password = passwordField.text, !password.isEmpty,
              let passwordConfirm = passwordConfirmField.text, !passwordConfirm.isEmpty,
              let nickname = nicknameField.text, !nickname.isEmpty
        else { return }
        
        let request = Registration.Registration.Request(nickname: nickname, email: account, password1: password, password2: passwordConfirm)
        self.interactor?.registration(request: request)
    }
}

extension RegistrationViewController: RegistrationDisplayLogic {
    func displayFetchNickname(viewModel: Registration.FetchNickname.ViewModel) {
        self.nicknameField.text = viewModel.nickname
        self.validateNickname()
    }
    
    func displayValidation(viewModel: Registration.ValidationViewModel) {
        self.registrationButton.isEnabled = viewModel.isValid
        self.registrationButton.backgroundColor = viewModel.isValid ? .buttonEnabled : .buttonDisabled
    }
    
    func displayRegistration() {
        UPLoader.shared.hidden()
        self.router?.routeToSplash()
    }
    func displayError(error: Common.CommonError, useCase: Registration.UseCase){
        //handle error with its usecase
        UPLoader.shared.hidden()
        switch error {
        case .server(let msg):
            self.errorAlert(title: "오류", message: msg, completion: nil)
        case .local(let msg):
            self.errorAlert(title: "오류", message: msg, completion: nil)
        case .error(let error):
            if let error = error as? (URLError) {
                NetworkErrorManager.alert(error) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                        guard let self = self else { return }
                        switch useCase{
                        case .Registration(let request):
                            self.interactor?.registration(request: request)
                        }
                    }
                }
            } else if let error = error as? MoyaError{
                NetworkErrorManager.alert(error)
            }
        }
    }
}
