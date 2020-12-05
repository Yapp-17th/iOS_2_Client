//
//  NextButtonView.swift
//  UniPlogger
//
//  Created by woong on 2020/12/06.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class NextButtonView: UIView {
    
    var tapHandler: (() -> Void)?

    let nextLabel = UILabel().then{
        $0.text = "NEXT"
        $0.textColor = .textBlack
        $0.font = .roboto(ofSize: 15, weight: .bold)
    }
    
    let nextImageView = UIImageView().then{
        $0.contentMode = .center
        $0.image = UIImage(named: "ic_BtnNextRight")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = .textBlack
    }
    
    lazy var nextButton = UIButton().then {
        $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayouts()
    }
    
    func setupLayouts() {
        layer.cornerRadius = 26
        addSubview(nextLabel)
        addSubview(nextImageView)
        addSubview(nextButton)
        
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
    }
    
    @objc func nextButtonTapped() {
        tapHandler?()
    }
}
