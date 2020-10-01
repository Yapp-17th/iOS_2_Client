//
//  TrainingTableViewCell.swift
//  UniPlogger
//
//  Created by woong on 2020/10/01.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import Then
import SnapKit

class TrainingTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let identifire = "TrainingTableViewCell"
    
    // MARK: - Views
    
    var imageBackgroundView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
    }
    
    var sproutImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.image = UIImage(named: "sprout")
        $0.contentMode = .scaleAspectFit
    }
    
    var questLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "학습퀘스트"
        $0.textColor = .white
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        let layer0 = CAGradientLayer()
        layer0.colors = [
          UIColor(red: 0.975, green: 0.256, blue: 0.509, alpha: 1).cgColor,
          UIColor(red: 0.924, green: 0.587, blue: 0.979, alpha: 1).cgColor
        ]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.frame = layer.bounds
        layer0.cornerRadius = 22
        layer.insertSublayer(layer0, at: 0)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(patternImage: UIImage(named: "space_background")!)
        addSubview(imageBackgroundView)
        imageBackgroundView.addSubview(sproutImageView)
        addSubview(questLabel)
        
        imageBackgroundView.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(self.snp.leading).offset(18)
            $0.width.equalTo(52)
            $0.height.equalTo(52)
        }
        
        sproutImageView.snp.makeConstraints {
            $0.center.equalTo(imageBackgroundView)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
        
        questLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.snp.centerY)
            $0.leading.equalTo(imageBackgroundView.snp.trailing).offset(18)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
