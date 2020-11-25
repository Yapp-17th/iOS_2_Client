//
//  InfoTableViewCell.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

enum InfoItemType: Int, CaseIterable {
    case signUpInfo = 0, setting, logout, policy
    
    var description: String {
        switch self {
        case .signUpInfo:
            return "가입정보"
        case .setting:
            return "환경설정"
        case .logout:
            return "로그아웃/탈퇴"
        case .policy:
            return "개인정보처리 방침"
        }
    }
}

class InfoTableViewCell: UITableViewCell {
    
    static let ID = "infoCell"
    
    var infoItem: InfoItemType = .signUpInfo

    lazy var itemLabel = UILabel()
    lazy var nextImageView = UIImageView().then {
        $0.image = UIImage(named: "next_icon")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: InfoItemType) {
        self.infoItem = item
        itemLabel.text = infoItem.description
        itemLabel.font = .notoSans(ofSize: 16, weight: .regular)
    }
    
    func setupViews() {
        [itemLabel, nextImageView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    
    func setupLayout() {
        itemLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
        }
        nextImageView.snp.makeConstraints { (make) in
            make.trailing.equalTo(-20)
            make.centerY.equalToSuperview()
            make.width.equalTo(6)
            make.height.equalTo(12)
        }
    }
    
}
