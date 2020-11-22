//
//  ReportViewController+UI.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/21.
//  Copyright © 2020 손병근. All rights reserved.
//

import Foundation

extension ReportViewController {
    
    func setUpViews() {
        [reportView, textStackView, firstItemStackView, secondItemStackView, cancelButton, reportButton, cancelLabel, reportLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        reportView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        }
        textStackView.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(self.view.frame.height * 0.66)
        }
        firstItemStackView.snp.makeConstraints {
            $0.leading.equalTo(textStackView)
//            $0.centerX.equalToSuperview()
            $0.top.equalTo(textStackView.snp.bottom).offset(12)
        }
        secondItemStackView.snp.makeConstraints {
            $0.leading.equalTo(textStackView)
//            $0.centerX.equalToSuperview()
            $0.top.equalTo(firstItemStackView.snp.bottom).offset(10)
        }
        cancelButton.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.top.equalTo(secondItemStackView.snp.bottom).offset(14)
            $0.width.equalTo(self.view.frame.width * 0.42)
            $0.height.equalTo(self.view.frame.height * 0.07)
        }
        reportButton.snp.makeConstraints {
            $0.trailing.equalTo(-20)
            $0.bottom.width.height.equalTo(cancelButton)
        }
        cancelLabel.snp.makeConstraints {
            $0.center.equalTo(cancelButton)
        }
        reportLabel.snp.makeConstraints {
            $0.center.equalTo(reportButton)
        }
    }
    
}
