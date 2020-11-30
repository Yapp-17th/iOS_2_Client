//
//  RankTableViewCell.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/31.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class RankTableViewCell: UITableViewCell {
    
    var viewModel: Challenge.RankCellViewModel?
    
    lazy var background = UIView().then {
        $0.backgroundColor = UIColor(named: "rankCellColor")
        $0.layer.cornerRadius = 20
    }
    lazy var rankLabel = UILabel().then {
        $0.font = .roboto(ofSize: 14, weight: .bold)
        $0.text = "4"
        $0.textColor = UIColor(named: "rankColor")
    }
    lazy var userImageView = UIImageView().then {
        $0.image = UIImage(named: "rank_other")
    }
    lazy var nameLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 12, weight: .regular)
        $0.text = "땡숙이"
    }
    lazy var scoreLabel = UILabel().then {
        $0.font = .notoSans(ofSize: 12, weight: .regular)
        $0.text = "10000점"
        $0.textAlignment = .right
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(viewModel: Challenge.RankCellViewModel) {
        self.viewModel = viewModel
        rankLabel.text = "\(viewModel.rank)"
        nameLabel.text = viewModel.nickname
        scoreLabel.text = "\(viewModel.score)점"
    }
}

extension RankTableViewCell {

    func setUpView() {
        self.backgroundColor = .clear
        [background, rankLabel, userImageView, nameLabel, scoreLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
    func setUpLayout() {
        background.snp.makeConstraints {
            $0.top.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(-5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(background.snp.leading).offset(22)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(16)
        }
        userImageView.snp.makeConstraints {
            $0.leading.equalTo(rankLabel.snp.trailing).offset(11)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(40)
        }
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(userImageView.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(70)
            $0.height.equalTo(14)
        }
        scoreLabel.snp.makeConstraints {
            $0.trailing.equalTo(background.snp.trailing).offset(-40)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(18)
        }
        
    }
}
