//
//  SignUpTableViewCell.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    static let ID = "signupCell"
    
    var infoItem: SignUpInfoType = .email

    lazy var itemLabel = UILabel()
    lazy var valueLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: SignUpInfoType) {
        self.infoItem = item
        itemLabel.text = infoItem.description
        itemLabel.font = .notoSans(ofSize: 16, weight: .regular)
        switch infoItem {
        case .email:
            valueLabel.text = AuthManager.shared.user?.email
        case .resteredDate:
            guard let dateString = AuthManager.shared.user?.registeredDate else { return }
            let date = FormatDisplay.date(dateString)
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 d일"
            valueLabel.text = formatter.string(from: date)
        case .nickname:
            valueLabel.text = AuthManager.shared.user?.nickname
        }
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        [itemLabel, valueLabel].forEach {
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
        valueLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(-8.05)
            make.centerY.equalToSuperview()
            make.height.equalTo(31)
        }
    }

}
