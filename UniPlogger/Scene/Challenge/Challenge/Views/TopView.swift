//
//  TopView.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/12/06.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol TopViewDelegate: class {
    func touchUpTopRank(tag: Int)
}

class TopView: UIView {
    
    var delegate: TopViewDelegate?
    
    lazy var firstRankView = TopRankView().then {
        $0.isUserInteractionEnabled = true
        $0.tag = 0
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchUpTopRankView(_:))))
    }
    lazy var secondRankView = TopRankView().then {
        $0.isUserInteractionEnabled = true
        $0.tag = 1
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchUpTopRankView(_:))))
    }
    lazy var thirdRankView = TopRankView().then {
        $0.isUserInteractionEnabled = true
        $0.tag = 2
        $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(touchUpTopRankView(_:))))
    }
    
    @objc func touchUpTopRankView(_ recognizer: UIGestureRecognizer) {
        guard let tag = recognizer.view?.tag else { return }
        delegate?.touchUpTopRank(tag: tag)
//        guard let id = viewModels?[tag].id else { return }
//        router?.routeToUserLog(playerId: id)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        [firstRankView, secondRankView, thirdRankView].forEach {
            self.addSubview($0)
        }
    }
    
    func setUpLayout() {
//        topView.snp.makeConstraints {
//            $0.top.leading.trailing.equalToSuperview()
//            $0.height.equalTo(151)
//        }
        firstRankView.snp.makeConstraints {
            $0.top.equalTo(22)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(self.frame.width/3)
            $0.height.equalTo(140)
        }
        secondRankView.snp.makeConstraints {
            $0.top.equalTo(79)
            $0.trailing.equalTo(firstRankView.rankImageView.snp.leading)
            $0.width.equalTo(firstRankView.snp.width)
            $0.height.equalTo(140)
        }
        thirdRankView.snp.makeConstraints {
            $0.top.equalTo(101)
            $0.leading.equalTo(firstRankView.rankImageView.snp.trailing)
            $0.width.equalTo(firstRankView.snp.width)
            $0.height.equalTo(140)
        }
    }

}
