//
//  ReportViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ReportViewController: UIViewController, ReportDelegate {
    
    var selectedItems = [ReportItem]()

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
        stackView.distribution = .equalSpacing
        (0..<3).forEach { index in
            let reportItemLabel = ReportItemLabel(item: ReportItem.allCases[index])
            reportItemLabel.delegate = self
            stackView.addArrangedSubview(reportItemLabel)
        }
    }
    lazy var secondItemStackView = UIStackView().then { stackView in
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        (3..<5).forEach { index in
            let reportItemLabel = ReportItemLabel(item: ReportItem.allCases[index])
            reportItemLabel.delegate = self 
            stackView.addArrangedSubview(reportItemLabel)
        }
    }
    lazy var cancelButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "cancelButtonColor")
        $0.layer.cornerRadius = self.view.frame.height * 0.035
        $0.addTarget(self, action: #selector(touchUpCancelButton), for: .touchUpInside)
    }
    lazy var cancelLabel = UILabel().then {
        $0.text = "취소"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .notoSans(ofSize: 18, weight: .bold)
    }
    lazy var reportButton = UIButton().then {
        $0.backgroundColor = UIColor(named: "reportButtonColor")
        $0.layer.cornerRadius = self.view.frame.height * 0.035
        $0.addTarget(self, action: #selector(touchUpReportButton), for: .touchUpInside)
    }
    lazy var reportLabel = UILabel().then {
        $0.text = "신고"
        $0.textAlignment = .center
        $0.textColor = .white 
        $0.font = .notoSans(ofSize: 18, weight: .bold)
    }
    lazy var buttonStackView = UIStackView(arrangedSubviews: [cancelButton, reportButton]).then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = self.view.frame.width * 0.06
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "reportDimColor")
        setUpViews()
        setUpLayout()
    }
    
    @objc private func touchUpCancelButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func touchUpReportButton() {
        guard !selectedItems.isEmpty else { return }
        let alertController = UIAlertController(title: "신고가 완료되었습니다.", message: "3번 신고 시 사진이 삭제됩니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            self.dismiss(animated: true, completion: nil)
        })
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func selectItem(_ item: ReportItem) {
        if selectedItems.contains(item) {
            selectedItems = selectedItems.filter { $0 != item }
        } else {
            selectedItems.append(item)
        }
    }

}
