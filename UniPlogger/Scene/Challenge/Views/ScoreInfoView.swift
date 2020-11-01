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

    init() {
        super.init(frame: .zero)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension ScoreInfoView {
    func setUpView() {
        [backgroundView, infoView].forEach {
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
    }
}
