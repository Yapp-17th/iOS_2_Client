//
//  MyPageViewController+UI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/24.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension MyPageViewController {
    
    func setupViews() {
        [userInfoView, infoView, itemTableView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setupLayout() {
        userInfoView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(self.view.frame.height * 0.36)
        }
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(userInfoView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        itemTableView.snp.makeConstraints { (make) in
            make.top.equalTo(infoView.snp.top).offset(30)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(207.5)
        }
    }
    
}
