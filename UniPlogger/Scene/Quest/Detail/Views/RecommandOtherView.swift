//
//  RecommandOtherView.swift
//  UniPlogger
//
//  Created by woong on 2020/10/23.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class RecommandOtherView: UIView {
    
    private struct Metrix {
        static let edges: UIEdgeInsets = .init(top: 20, left: 20, bottom: 20, right: 20)
        static let spacing: CGFloat = 6
    }
    
    let contentView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

    let descripionLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setTextColor(_ color: UIColor) {
        titleLabel.textColor = color
        descripionLabel.textColor = color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        addSubview(contentView)
        [titleLabel, descripionLabel].forEach { contentView.addSubview($0) }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(Metrix.edges)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
        }

        descripionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-Metrix.spacing)
            $0.leading.equalTo(contentView.snp.leading)
            $0.trailing.equalTo(contentView.snp.trailing)
            $0.bottom.equalTo(contentView.snp.bottom)
        }
    }
}
