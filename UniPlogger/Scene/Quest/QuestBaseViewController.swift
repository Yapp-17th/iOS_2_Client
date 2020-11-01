//
//  QuestBaseViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/10/25.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestBaseViewController: BaseViewController {

    // status bar 색이랑 탭바 색을 맞추기 위해서 추가.
    // view: tabBar 색
    // backgroundView: 원하는 배경색
    var backgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = Color.questBackground
    }
    
    func setupViews() {
        view.backgroundColor = Color.questBackgroundTint
        view.addSubview(backgroundView)
    }
    
    func setupLayouts() {
        backgroundView.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).inset(UIEdgeInsets.init(top: UIApplication.shared.statusBarFrame.height, left: 0, bottom: 0, right: 0))
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
