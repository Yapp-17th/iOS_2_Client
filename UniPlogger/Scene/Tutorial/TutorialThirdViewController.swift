//
//  TutorialThirdViewController.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class TutorialThirdViewController: UIViewController {
    
    lazy var backgroundImageView = UIImageView().then {
        $0.image = UIImage(named: "bg_tutorialThird")!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
    }
    let ploggerImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_tutorialThirdPlogger")
        $0.contentMode = .scaleAspectFit
    }
    
    var nicknameField = UITextField().then {
        $0.borderStyle = .none
        $0.font = .dynamicNotosans(fontSize: 24, weight: .bold)
        $0.textAlignment = .center
        $0.adjustsFontSizeToFitWidth = true
        $0.textColor = .white
        $0.attributedPlaceholder = NSMutableAttributedString().string("(여기를 눌러 닉네임을 입력하세요)", font: .dynamicNotosans(fontSize: 20, weight: .bold), color: .white)
    }
    
    let firstLabel = UILabel().then {
        $0.text = "신입 우주 청소부인"
        $0.textColor = .white
        $0.font = .dynamicNotosans(fontSize: 24, weight: .bold)
    }
    
    let 은 = UILabel().then {
        $0.text = "은(는)"
        $0.textColor = .white
        $0.font = .dynamicNotosans(fontSize: 24, weight: .bold)
    }
    
    let secondLabel = UILabel().then {
        $0.text = """
        ‘플로거짱'이 되고자하는
        새로운 목표를
        갖게 되는데...
        """
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = .dynamicNotosans(fontSize: 24, weight: .bold)
    }
    
    let nextButtonView = UIView().then{
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 26
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor(red: 196, green: 196, blue: 196).cgColor
    }
    
    let nextLabel = UILabel().then{
        $0.text = "NEXT"
        $0.textColor = .white
        $0.font = .roboto(ofSize: 15, weight: .bold)
    }
    
    let nextImageView = UIImageView().then{
        $0.contentMode = .center
        $0.image = UIImage(named: "ic_BtnNextRight")
    }
    
    lazy var nextButton = UIButton().then {
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(backgroundImageView)
        self.view.addSubview(nextButtonView)
        self.view.addSubview(ploggerImageView)
        self.view.addSubview(secondLabel)
        self.view.addSubview(nicknameField)
        self.view.addSubview(은)
        self.view.addSubview(firstLabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
        }
        
        nextButtonView.addSubview(nextLabel)
        nextButtonView.addSubview(nextImageView)
        nextButtonView.addSubview(nextButton)
        
        nextButtonView.snp.makeConstraints{
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            $0.trailing.equalTo(-32)
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
        
        ploggerImageView.snp.makeConstraints {
            $0.bottom.equalTo(nextButtonView.snp.top)
            $0.centerX.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
            $0.bottom.equalTo(ploggerImageView.snp.top).offset(-40)
        }
        nicknameField.snp.makeConstraints {
            $0.bottom.equalTo(secondLabel.snp.top)
            $0.leading.equalTo(32)
        }
        
        은.snp.makeConstraints{
            $0.leading.equalTo(nicknameField.snp.trailing)
            $0.centerY.equalTo(nicknameField)
            $0.trailing.equalTo(-32)
        }
        은.setContentHuggingPriority(.required, for: .horizontal)
        firstLabel.snp.makeConstraints {
            $0.bottom.equalTo(은.snp.top)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.nicknameField.becomeFirstResponder()
    }
    
    @objc func nextButtonTapped() {
        guard let nickname = nicknameField.text, !nickname.isEmpty  else {
            self.errorAlert(title: "닉네임을 입력해주세요", message: "Uniplogger 을(를) 사용하기 위해서는 닉네임이 필요합니다.", completion: nil)
            return
        }
        UserDefaults.standard.set(true, forDefines: .hasTutorial)
        let destinationVC = RegistrationViewController()
        var destinationDS = destinationVC.router!.dataStore!
        
        destinationDS.nickname = nickname
        
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    
    
    
}


