//
//  QuestCoachDragCell.swift
//  UniPlogger
//
//  Created by woong on 2020/12/26.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestCoachDragCell: UITableViewCell {
    static let identifier = "QuestCoachDragCell"
    
    private var shadowView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }

    private var cellBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .questBackgroundTint
        $0.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        $0.layer.cornerRadius = 22
        $0.clipsToBounds = true
    }
    
    private var dragImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_dragLeft")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var plusButtonImageView = UIImageView().then {
        $0.image = UIImage(named: "add_button")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var coachLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textColor = .white
        $0.font = UIFont.notoSans(ofSize: 16, weight: .regular)
        $0.text = "카드를 왼쪽으로 밀어서\n퀘스트를 진행할 수 있습니다."
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .questBackground
        [cellBackgroundView, shadowView, coachLabel, dragImageView, plusButtonImageView].forEach {
            addSubview($0)
        }
        
        plusButtonImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(snp.trailing).offset(-20)
            $0.height.equalTo(60)
            $0.width.equalTo(plusButtonImageView.snp.height)
        }
        
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(10)
            $0.leading.equalTo(snp.leading).offset(10)
            $0.trailing.equalTo(plusButtonImageView.snp.leading).offset(-20)
            $0.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        dragImageView.snp.makeConstraints {
            $0.top.equalTo(cellBackgroundView.snp.top).offset(10)
            $0.trailing.equalTo(cellBackgroundView.snp.trailing)
            $0.bottom.equalTo(cellBackgroundView.snp.bottom).offset(-10)
            $0.width.equalTo(dragImageView.snp.height)
        }
        
        coachLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(dragImageView.snp.leading)
            $0.leading.greaterThanOrEqualTo(cellBackgroundView.snp.leading).offset(10)
        }
        
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

}
