//
//  ScoreInfoViewController.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/11/07.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class ScoreInfoViewController: UIViewController, DismissDelegate {
    
    lazy var infoView = ScoreInfoView().then {
        $0.backgroundColor = UIColor(named: "infoBackgroundColor")
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoView.delegate = self
        configure()
        setUpViews()
        setUpLayout()
    }
    
    func dismiss() {
        dismiss(animated: false, completion: nil)
    }
    
}

extension ScoreInfoViewController {
    func configure() {
        self.view.backgroundColor = UIColor(named: "tempBackgroundColor")
        
    }
    
    func setUpViews() {
        [infoView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        infoView.snp.makeConstraints {
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(infoView.snp.width)
        }
    }
}
