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
    lazy var skipButton = UIButton().then {
        $0.setAttributedTitle(UPStyle().font(.roboto(ofSize: 15, weight: .bold)).color(UIColor(hexString: "#999999")).kern(-0.41).apply(to: "로그인하러가기"), for: .normal)
        $0.setTitleColor(.init(hexString: "#999999"), for: .normal)
        $0.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
    }
    let ploggerImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_tutorialThirdPlogger")
        $0.contentMode = .scaleAspectFit
    }
    
    let ploggerBubbleImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_tutorialThirdPloggerBubble")
        $0.contentMode = .scaleAspectFit
    }
    
    let nicknameContainer = UIView()
    lazy var nicknameField = NicknameField().then {
        $0.borderStyle = .none
        $0.font = .dynamicNotosans(fontSize: 24, weight: .bold)
        $0.textAlignment = .center
        $0.textColor = .white
        $0.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        $0.attributedPlaceholder = NSMutableAttributedString().string("(여기를 눌러 닉네임을 입력하세요)", font: .dynamicNotosans(fontSize: 20, weight: .bold), color: .white)
    }
    
    let nicknameLabel = UILabel().then{
        $0.textColor = .black
        $0.font = .notoSans(ofSize: 14, weight: .regular)
        $0.text = "나에게 이름을\n만들어 주세요"
        $0.numberOfLines = 2
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
        self.view.addSubview(skipButton)
        self.view.addSubview(nextButtonView)
        self.view.addSubview(ploggerImageView)
        self.view.addSubview(ploggerBubbleImageView)
        ploggerBubbleImageView.addSubview(nicknameLabel)
        self.view.addSubview(secondLabel)
        self.view.addSubview(nicknameContainer)
        nicknameContainer.addSubview(nicknameField)
        nicknameContainer.addSubview(은)
        self.view.addSubview(firstLabel)
        
        backgroundImageView.snp.makeConstraints{
            $0.leading.trailing.top.equalToSuperview()
        }
        
        skipButton.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(28)
            $0.trailing.equalTo(-20)
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
        
        ploggerBubbleImageView.snp.makeConstraints{
            $0.bottom.equalTo(ploggerImageView.snp.top).offset(-11)
            $0.centerX.equalToSuperview()
        }
        
        nicknameLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-6)
        }
        
        secondLabel.snp.makeConstraints {
            $0.leading.equalTo(32)
            $0.trailing.equalTo(-32)
            $0.bottom.equalTo(ploggerBubbleImageView.snp.top).offset(-40)
        }
        
        nicknameContainer.snp.makeConstraints {
            $0.bottom.equalTo(secondLabel.snp.top)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(30)
        }
        nicknameField.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
        }
        
        은.snp.makeConstraints{
            $0.leading.equalTo(nicknameField.snp.trailing)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
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
    
    
    @objc func textChanged(){
        self.nicknameField.invalidateIntrinsicContentSize()
        if let text = self.nicknameField.text, !text.isEmpty {
            nicknameLabel.text = text
        } else {
            nicknameLabel.text = "나에게 이름을\n만들어 주세요"
        }
    }
    
    
    @objc func skipButtonTapped() {
        UserDefaults.standard.set(true, forDefines: .hasTutorial)
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}

class NicknameField: UITextField{
    override var intrinsicContentSize: CGSize{
        if let text = self.text, !text.isEmpty {
            let label = UILabel()
            label.font = self.font
            label.numberOfLines = 0
            label.textAlignment = .center
            label.text = self.text
            var originSize = super.intrinsicContentSize
            originSize.width = 0
            let newSize = label.sizeThatFits(originSize)
            print(newSize)
            return newSize
        } else {
            return super.intrinsicContentSize
        }
    }
}
