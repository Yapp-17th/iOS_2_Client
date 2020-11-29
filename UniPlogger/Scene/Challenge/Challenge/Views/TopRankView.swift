//
//  TopRankView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/30.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class TopRankView: UIView {
    lazy var rankImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    lazy var nameLabel = UILabel().then {
        $0.font = .roboto(ofSize: 14, weight: .bold)
        $0.textAlignment = .center
    }
    lazy var scoreLabel = UILabel().then {
        $0.font = .roboto(ofSize: 12, weight: .regular)
        $0.textAlignment = .center
    }

    init() {
        super.init(frame: .zero)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
}

extension TopRankView {
    func setUpView() {
        [rankImageView, nameLabel, scoreLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
        rankImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalTo(92)
            $0.height.equalTo(99)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(rankImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(16)
        }
        scoreLabel.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(18)
        }
    }
}
