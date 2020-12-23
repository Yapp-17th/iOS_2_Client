//
//  QuestTableViewCell.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestTableViewCell: UITableViewCell {
    
    
    // MARK: - Constants
    
    static let identifire = "QuestTableViewCell"

    // MARK: - Views
    
    private var cellBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 22
    }
    
    private var sproutBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var sproutImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
    }
    
    private var questContentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var questTitleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.notoSans(ofSize: 14, weight: .regular)
        $0.textColor = .text
        $0.setContentCompressionResistancePriority(.init(rawValue: 900), for: .vertical)
    }
    
    private var questContentLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.notoSans(ofSize: 16, weight: .bold)
        $0.textColor = .text
        $0.numberOfLines = 0
    }
    
    // MARK: - Methods
    
    func configure(viewModel: QuestModels.ViewModel.QuestViewModel) {
        questTitleLabel.text = viewModel.title
        questContentLabel.text = viewModel.content
        sproutImageView.image = viewModel.cellImage
        sproutBackgroundView.layer.cornerRadius = 26
        sproutBackgroundView.backgroundColor = viewModel.cellImageBackground
        cellBackgroundView.backgroundColor = UIColor(named: viewModel.backgroundColor)
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        
        addSubview(cellBackgroundView)
        
        [sproutBackgroundView, questContentView].forEach {
            cellBackgroundView.addSubview($0)
        }
        
        [sproutImageView].forEach {
            sproutBackgroundView.addSubview($0)
        }
        
        [questTitleLabel, questContentLabel].forEach {
            questContentView.addSubview($0)
        }
    }
    
    private func setupLayouts() {
        cellBackgroundView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(10)
            $0.leading.equalTo(snp.leading)
            $0.trailing.equalTo(snp.trailing)
            $0.bottom.equalTo(snp.bottom).offset(-10)
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
        
        questContentView.snp.makeConstraints {
            $0.centerY.equalTo(sproutBackgroundView.snp.centerY)
            $0.leading.equalTo(sproutBackgroundView.snp.trailing).offset(18)
            $0.trailing.equalTo(cellBackgroundView.snp.trailing).offset(-18)
            $0.top.greaterThanOrEqualToSuperview().offset(10)
        }
        
        questTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        questContentLabel.snp.makeConstraints {
            $0.top.equalTo(questTitleLabel.snp.bottom).inset(-5)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
