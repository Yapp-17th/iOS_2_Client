//
//  SucceePopupView.swift
//  UniPlogger
//
//  Created by woong on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class SuccessPopupView: UIView {
    
    var tapHandler: (() -> Void)?
    
    let backgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .questBackground
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    let greetingLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "축하드려요!"
        $0.font = .notoSans(ofSize: 30, weight: .bold)
        $0.textColor = .text
    }
    
    let questContentsLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = ""
        $0.numberOfLines = 0
        $0.font = .notoSans(ofSize: 14, weight: .bold)
        $0.textColor = .text
    }
    
    let endLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "퀘스트를 달성했어요."
        $0.font = .notoSans(ofSize: 14, weight: .regular)
        $0.textColor = .text
    }
    
    let contentsImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ic_popup_success")
        $0.contentMode = .scaleAspectFit
    }
    
    let agreeButton = HightlightButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("확인", for: .normal)
        $0.backgroundColor = .questTint
        $0.setTitleColor(.white, for: .normal)
    }
    
    convenience init(frame: CGRect, questId: Int) {
        self.init(frame: frame)
        let contents = QuestContents.contents(id: questId)
        questContentsLabel.text = contents
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
        setupLayouts()
    }
    
    func setupViews() {
        addSubview(backgroundView)
        backgroundView.addSubview(contentView)
        [greetingLabel, questContentsLabel, endLabel, contentsImageView, agreeButton]
            .forEach { contentView.addSubview($0) }
        agreeButton.addTarget(self, action: #selector(didTapAgree(_:)), for: .touchUpInside)
    }
    
    func setupLayouts() {
        backgroundView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(contentView.snp.width)
        }
        greetingLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.centerX.equalToSuperview()
        }
        questContentsLabel.snp.makeConstraints {
            $0.top.equalTo(greetingLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        endLabel.snp.makeConstraints {
            $0.top.equalTo(questContentsLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        agreeButton.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(52)
        }
        contentsImageView.snp.makeConstraints {
            $0.top.equalTo(endLabel.snp.bottom)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(agreeButton.snp.top)
        }
    }
    
    @objc func didTapAgree(_ sender: UIButton) {
        tapHandler?()
    }
}
