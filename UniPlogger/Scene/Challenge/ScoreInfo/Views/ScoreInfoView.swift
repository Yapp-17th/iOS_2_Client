//
//  ScoreInfoView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/11/01.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol DismissDelegate: class {
    func dismiss()
}

class ScoreInfoView: UIView {
    weak var delegate: DismissDelegate?
    
    lazy var titleView = UIView()
    lazy var infoImageView = UIImageView().then {
        $0.image = UIImage(named: "challenge_info")
    }
    lazy var headerLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 20, weight: .bold)
        $0.text = "점수 계산 방법"
    }
    lazy var descriptionLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    lazy var circleBackgroundView = UIView()
    lazy var firstCircleView = CircleInfoView().then {
        $0.infoLabel.text = "1회\n1000점"
    }
    lazy var secondCircleView = CircleInfoView().then {
        $0.infoLabel.text = "0.01km\n1점\n(1km - 100점)"
    }
    lazy var thirdCircleView = CircleInfoView().then {
        $0.infoLabel.text = "1분\n1점"
    }
    lazy var dismissButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "rankColor")
        $0.addTarget(self, action: #selector(touchUpDismissButton), for: .touchUpInside)
    }
    lazy var dismissLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 15, weight: .bold)
        $0.text = "닫기"
        $0.textAlignment = .center
        $0.textColor = .white
    }

    init() {
        super.init(frame: .zero)
        configure()
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touchUpDismissButton() {
        delegate?.dismiss()
    }
}

extension ScoreInfoView {
    func configure() {
        setDescriptionLabel()
        setSecondCircleView()
    }

    func setUpView() {
        [titleView, infoImageView, headerLabel, descriptionLabel, circleBackgroundView, firstCircleView, secondCircleView, thirdCircleView, dismissButton, dismissLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(154)
            $0.height.equalTo(30)
        }
        infoImageView.snp.makeConstraints {
            $0.leading.centerY.equalTo(titleView)
            $0.width.height.equalTo(24)
        }
        headerLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalTo(titleView)
            $0.leading.equalTo(infoImageView.snp.trailing).offset(10)
            $0.width.equalTo(120)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(13)
            $0.centerX.width.equalToSuperview()
        }
        dismissButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.155)
        }
        dismissLabel.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(dismissButton)
        }
        circleBackgroundView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(dismissButton.snp.top)
        }
        secondCircleView.snp.makeConstraints {
            $0.centerY.equalTo(circleBackgroundView)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(80)
        }
        firstCircleView.snp.makeConstraints {
            $0.top.width.height.equalTo(secondCircleView)
            $0.trailing.equalTo(secondCircleView.snp.leading).offset(-28)
        }
        thirdCircleView.snp.makeConstraints {
            $0.top.width.height.equalTo(secondCircleView)
            $0.leading.equalTo(secondCircleView.snp.trailing).offset(28)
        }
    }
    
    private func setDescriptionLabel() {
        let string = "점수에 대한 가중치는 다음과 같이 계산됩니다.\n동점 유저는 영어 - 한국어 - 숫자 순으로 배치됩니다."
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.notoSans(ofSize: 12, weight: .regular), range: (string as NSString).range(of: "점수에 대한 가중치는 다음과 같이 계산됩니다.\n동점 유저는 영어 - 한국어 - 숫자 순으로 배치됩니다."))
        attributedString.addAttribute(.font, value: UIFont.notoSans(ofSize: 12, weight: .bold), range: (string as NSString).range(of: "영어 - 한국어 - 숫자"))
        descriptionLabel.attributedText = attributedString
    }
    
    private func setSecondCircleView() {
        let string = "0.01km\n1점\n(1km - 100점)"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.notoSans(ofSize: 10, weight: .regular), range: (string as NSString).range(of: "(1km - 100점)"))
        secondCircleView.infoLabel.attributedText = attributedString
    }
}
