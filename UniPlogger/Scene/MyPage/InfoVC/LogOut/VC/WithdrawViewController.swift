//
//  WIthdrawViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController {
    
    lazy var titleLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 16, weight: .bold)
        $0.text = "UniPlogger를 탈퇴하면,"
        $0.textColor = .text
    }
    lazy var descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .notoSans(ofSize: 12, weight: .regular)
        $0.text = "- UniPlogger에서 진행한 플로깅 기록, 횟수, 레벨, 사진 등\n   모든 정보가 즉시 삭제 됩니다.\n- 모든 정보는 UniPlogger에 재가입해도 복구 불가능합니다.\n- 중요한 정보는 탈퇴 전에 저장해 주세요."
        $0.lineBreakMode = .byWordWrapping
        $0.textColor = .text
    }
    lazy var questionLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 16, weight: .bold)
        $0.text = "UniPlogger를 탈퇴하시겠습니까?"
        $0.textColor = .text
    }
    lazy var cancelButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "cancelButtonColor")
        $0.layer.cornerRadius = 28
        $0.addTarget(self, action: #selector(touchUpCancelButton), for: .touchUpInside)
    }
    lazy var cancelLabel = UILabel().then {
        $0.text = "취소"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .notoSans(ofSize: 18, weight: .bold)
    }
    lazy var withdrawButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "reportButtonColor")
        $0.layer.cornerRadius = 28
        $0.addTarget(self, action: #selector(touchUpWithdrawButton), for: .touchUpInside)
    }
    lazy var withdrawLabel = UILabel().then {
        $0.text = "탈퇴"
        $0.textAlignment = .center
        $0.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.6)
        $0.font = .notoSans(ofSize: 18, weight: .bold)
    }
    lazy var buttonStackView = UIStackView(arrangedSubviews: [cancelButton, withdrawButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.width * 0.06
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.questBackground
        setupViews()
        setupLayout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "탈퇴"
    }
    
    @objc func touchUpCancelButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func touchUpWithdrawButton() {
        showCheckAlert()
    }
    
    func showCheckAlert() {
        let title = "정말 탈퇴하시겠습니까?"
        let message = "확인 버튼을 누르면 계정이 삭제됩니다."
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.withdraw()
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        alertController.preferredAction = confirmAction
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func withdraw() {
        guard let id = AuthManager.shared.user?.id else { return }
        AuthAPI.shared.withdraw(uid: id)
        AuthManager.shared.userToken = nil
        AuthManager.shared.user = nil
        AuthManager.shared.getPush = false
        AuthManager.shared.autoSave = false
        routeToSplash()
    }
    
    private func routeToSplash() {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.window?.rootViewController = SplashViewController()
            delegate.window?.makeKeyAndVisible()
        }
    }

}

