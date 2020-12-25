//
//  QuestCoachMarkCell.swift
//  UniPlogger
//
//  Created by woong on 2020/12/26.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestCoachMarkCell: UITableViewCell {
    static let identifier = "QuestCoachMarkCell"
    
    private var shadowView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.6)
    }
    
    private var cellBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .questBackgroundTint
        $0.layer.cornerRadius = 22
        $0.clipsToBounds = true
    }
    
    private(set) var sproutBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 26
        $0.clipsToBounds = true
    }
    
    private var sproutImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "ic_todo_seed")
        $0.contentMode = .scaleToFill
    }
    
    private var coachLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.notoSans(ofSize: 16, weight: .regular)
        $0.numberOfLines = 0
        $0.textColor = .white
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .clear
        addSubview(cellBackgroundView)
        
        [sproutBackgroundView, shadowView, coachLabel].forEach {
            cellBackgroundView.addSubview($0)
        }
        sproutBackgroundView.addSubview(sproutImageView)
    }
    
    private func setupLayouts() {
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(10)
            $0.leading.equalTo(snp.leading).offset(16)
            $0.trailing.equalTo(snp.trailing).offset(-16)
            $0.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        shadowView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        sproutBackgroundView.snp.makeConstraints {
            $0.centerY.equalTo(cellBackgroundView.snp.centerY)
            $0.leading.equalTo(cellBackgroundView.snp.leading).offset(18)
            $0.width.equalTo(52)
            $0.height.equalTo(52)
        }
        
        sproutImageView.snp.makeConstraints {
            $0.center.equalTo(sproutBackgroundView)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        coachLabel.snp.makeConstraints {
            $0.centerY.equalTo(sproutBackgroundView.snp.centerY)
            $0.leading.equalTo(sproutBackgroundView.snp.trailing).offset(18)
            $0.trailing.equalTo(cellBackgroundView.snp.trailing).offset(-18)
        }
    }
    
    func configure(isGuide: Bool) {
        sproutBackgroundView.backgroundColor = isGuide ? .trainingTint : .routineTint
        coachLabel.text = isGuide ? "학습퀘스트를 진행 후 포기하면\n다시 진행이 불가합니다." : ""
        if isGuide {
            cellBackgroundView.bringSubviewToFront(sproutBackgroundView)
        }
    }
}
