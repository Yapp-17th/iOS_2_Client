//
//  ScoreInfoView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/11/01.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ScoreInfoView: UIView {
    lazy var backgroundView = UIView().then {
        $0.backgroundColor = UIColor(named: "tempBackgroundColor")
    }
    lazy var infoView = UIView().then {
        $0.backgroundColor = UIColor(named: "infoBackgroundColor")
        $0.layer.cornerRadius = 18
    }
    lazy var titleView = UIView()
    lazy var infoImageView = UIImageView().then {
        $0.image = UIImage(named: "challenge_info")
    }
    lazy var headerLabel = UILabel().then {
        $0.font = .notoSansKR(ofSize: 20, weight: .bold)
        $0.text = "알려드려요"
    }
    lazy var titleLabel = UILabel().then {
        $0.font = .notoSansKR(ofSize: 16, weight: .bold)
        $0.text = "점수 계산 방법"
        $0.textAlignment = .center
    }
    lazy var descriptionLabel = UILabel().then {
        $0.font = .notoSansKR(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
    }
    lazy var firstCircleView = CircleInfoView().then {
        $0.infoLabel.text = "1회\n1000점"
    }
    lazy var secondCircleView = CircleInfoView().then {
        $0.infoLabel.text = "0.01km\n1점\n(1km - 100점)"
    }
    lazy var thirdCircleView = CircleInfoView().then {
        $0.infoLabel.text = "1분\n1점"
    }
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "share_character")
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
    

}

extension ScoreInfoView {
    func configure() {
        setDescriptionLabel()
        setSecondCircleView()
    }

    func setUpView() {
        [backgroundView, infoView, titleView, infoImageView, headerLabel, titleLabel, descriptionLabel, firstCircleView, secondCircleView, thirdCircleView, characterImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    func setUpLayout() {
        backgroundView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
        infoView.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(infoView.snp.width)
        }
        titleView.snp.makeConstraints {
            $0.top.equalTo(infoView).offset(19)
            $0.centerX.equalTo(infoView)
            $0.width.equalTo(127)
            $0.height.equalTo(30)
        }
        infoImageView.snp.makeConstraints {
            $0.leading.centerY.equalTo(titleView)
            $0.width.height.equalTo(24)
        }
        headerLabel.snp.makeConstraints {
            $0.top.bottom.trailing.centerY.equalTo(titleView)
            $0.width.equalTo(93)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(14)
            $0.centerX.width.equalTo(infoView)
            $0.height.equalTo(24)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(3)
            $0.centerX.width.equalTo(infoView)
            $0.height.equalTo(34)
        }
        secondCircleView.snp.makeConstraints {
            $0.centerY.equalTo(infoView).offset(infoView.frame.width * 6.5 / 335)
            $0.centerX.equalTo(infoView)
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
        characterImageView.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(107.95)
            $0.bottom.centerX.equalTo(infoView)
        }
    }
    
    private func setDescriptionLabel() {
        let string = "같은 점수는 가나다 이름순으로 배치됩니다.\n"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.notoSansKR(ofSize: 12, weight: .regular), range: (string as NSString).range(of: "같은 점수는 가나다 이름순으로 배치됩니다.\n"))
        attributedString.addAttribute(.font, value: UIFont.notoSansKR(ofSize: 12, weight: .bold), range: (string as NSString).range(of: "가나다 이름순"))
        descriptionLabel.attributedText = attributedString
    }
    
    private func setSecondCircleView() {
        let string = "0.01km\n1점\n(1km - 100점)"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.font, value: UIFont.notoSansKR(ofSize: 10, weight: .regular), range: (string as NSString).range(of: "(1km - 100점)"))
        secondCircleView.infoLabel.attributedText = attributedString
    }
}
