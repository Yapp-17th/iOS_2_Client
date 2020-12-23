//
//  UserInfoView.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class UserInfoView: UIView {
    
    lazy var backgroundImageView = UIImageView()
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "character")
    }
    lazy var leftStarImageView = UIImageView()
    lazy var rightStarImageView = UIImageView()
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
    }
    
    func setupViews() {
        [backgroundImageView, characterImageView, leftStarImageView, rightStarImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
        backgroundImageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        
    }
}
