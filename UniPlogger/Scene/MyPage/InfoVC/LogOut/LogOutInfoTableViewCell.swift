//
//  LogOutTableViewCell.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class LogOutInfoTableViewCell: UITableViewCell {

    static let ID = "logOutCell"
    
    var logOutItem: LogOutType = .logOut

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
    
    func configure(item: LogOutType) {
        self.logOutItem = item
        itemLabel.text = logOutItem.description
        itemLabel.font = .notoSans(ofSize: 16, weight: .regular)
    }
    
    func setupViews() {
        self.backgroundColor = .clear
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
