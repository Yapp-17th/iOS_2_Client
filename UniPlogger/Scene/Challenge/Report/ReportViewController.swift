//
//  ReportViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController {

    lazy var reportView = UIView().then {
        $0.backgroundColor = UIColor(named: "reportColor")
        $0.layer.cornerRadius = 22
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    lazy var titleLabel = UILabel().then {
        $0.text = "사진에 문제가 있습니까?"
        $0.font = .notoSans(ofSize: 18, weight: .bold)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.text = "이 사진에 우려되는 부분이 있습니다."
        $0.font = .notoSans(ofSize: 14, weight: .regular)
    }
    lazy var textStackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel]).then {
        $0.spacing = 9
        $0.axis = .vertical
    }
    lazy var firstItemStackView = UIStackView().then { stackView in
        stackView.axis = .horizontal
//        stackView.spacing = self.view.frame.width * 0.06
        stackView.spacing = 15
        (0..<3).forEach { index in
            let reportItemLabel = ReportItemLabel(text: ReportItem.allCases[index].description)
            stackView.addArrangedSubview(reportItemLabel)
        }
    }
    lazy var secondItemStackView = UIStackView().then { stackView in
        stackView.axis = .horizontal
//        stackView.spacing = self.view.frame.width * 0.06
        stackView.spacing = 15
        (3..<5).forEach { index in
            let reportItemLabel = ReportItemLabel(text: ReportItem.allCases[index].description)
            stackView.addArrangedSubview(reportItemLabel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "reportDimColor")
        setUpViews()
        setUpLayout()
    }

}

extension ReportViewController {
    
    func setUpViews() {
        [reportView, textStackView, firstItemStackView, secondItemStackView].forEach {
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
    }
    
}
