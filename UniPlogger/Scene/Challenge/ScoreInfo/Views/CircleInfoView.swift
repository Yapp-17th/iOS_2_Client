//
//  CircleInfoView.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/11/03.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class CircleInfoView: UIView {
    lazy var infoLabel = UILabel().then {
        $0.font = .notoSansKR(ofSize: 14, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
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

extension CircleInfoView {
    func setUpView() {
        [infoLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
        self.backgroundColor = UIColor(named: "scoreCircleColor")
        self.layer.cornerRadius = 40
        infoLabel.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}
