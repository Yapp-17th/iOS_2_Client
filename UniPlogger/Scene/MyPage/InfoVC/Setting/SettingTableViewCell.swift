//
//  SettingTableViewCell.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/28.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    static let ID = "settingCell"
    
    var infoItem: SettingType = .autosave

    var switchClosure: (_ type: SettingType, _ isOn: Bool) -> Void = { _, _  in }
    
    lazy var itemLabel = UILabel()
    lazy var switchButton = UISwitch().then {
        $0.tintColor = UIColor(named: "rankColor")
        $0.onTintColor = UIColor(named: "rankColor")
        $0.addTarget(self, action: #selector(onClickSwitch), for: UIControl.Event.valueChanged)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(item: SettingType) {
        self.infoItem = item
        itemLabel.text = infoItem.description
        itemLabel.font = .notoSans(ofSize: 16, weight: .regular)
        switch infoItem {
        case .getPush:
            PushManager.shard.getPushStatus { status in
                DispatchQueue.main.async {
                    self.switchButton.isOn = status == .authorized && AuthManager.shared.getPush
                }
            }
        case .autosave:
            switchButton.isOn = AuthManager.shared.autoSave
        }
    }
    
    @objc func onClickSwitch() {
        self.switchClosure(infoItem, switchButton.isOn)
    }
    
    func setupViews() {
        self.backgroundColor = .clear
        [itemLabel, switchButton].forEach {
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
        switchButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-8.05)
            make.centerY.equalToSuperview()
            make.width.equalTo(51)
            make.height.equalTo(31)
        }
    }
}
