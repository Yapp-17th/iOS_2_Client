//
//  QuestTableViewCell.swift
//  UniPlogger
//
//  Created by woong on 2020/10/11.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class QuestTableViewCell: UITableViewCell {
    
    static let identifire = "QuestTableViewCell"

    // MARK: - Views
    
    var gradientBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    var sproutBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    var sproutImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.contentMode = .scaleAspectFit
    }
    
    var questLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
    }
    
    // MARK: - Properties
    
    var gradientLayer: CAGradientLayer?
    
    // MARK: - Methods
    
    // MARK: - Initializer
    
    func configure(viewModel: QuestModels.ViewModel.QuestViewModel) {
        questLabel.text = viewModel.title
        gradientLayer = viewModel.gradientLayer
        
        sproutImageView.image = viewModel.cellImageImage
        sproutBackgroundView.layer.cornerRadius = 26
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        
        if let gradientLayer = gradientLayer {
            gradientLayer.frame = gradientBackgroundView.bounds
            gradientBackgroundView.layer.cornerRadius = 22
            gradientBackgroundView.layer.insertSublayer(gradientLayer, at: 0)
            gradientBackgroundView.backgroundColor = .orange
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(gradientBackgroundView)
        gradientBackgroundView.addSubview(sproutBackgroundView)
        sproutBackgroundView.addSubview(sproutImageView)
        gradientBackgroundView.addSubview(questLabel)
        
        gradientBackgroundView.snp.makeConstraints {
            $0.top.equalTo(snp.top).offset(10)
            $0.leading.equalTo(snp.leading)
            $0.trailing.equalTo(snp.trailing)
            $0.bottom.equalTo(snp.bottom).offset(-10)
        }
        
        sproutBackgroundView.snp.makeConstraints {
            $0.centerY.equalTo(gradientBackgroundView.snp.centerY)
            $0.leading.equalTo(gradientBackgroundView.snp.leading).offset(18)
            $0.width.equalTo(52)
            $0.height.equalTo(52)
        }
        
        sproutImageView.snp.makeConstraints {
            $0.center.equalTo(sproutBackgroundView)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        questLabel.snp.makeConstraints {
            $0.centerY.equalTo(sproutBackgroundView.snp.centerY)
            $0.leading.equalTo(sproutBackgroundView.snp.trailing).offset(18)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
