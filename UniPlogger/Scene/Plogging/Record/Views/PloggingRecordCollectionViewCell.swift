//
//  PloggingRecordCollectionViewCell.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/10/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class PloggingRecordCollectionViewCell: UICollectionViewCell{
    struct ViewModel {
        var title: String
        var isSelected: Bool
    }
    
    var viewModel: ViewModel!{
        didSet{
            updateView()
        }
    }
    
    let titleLabel = UILabel().then{
        $0.font = .dynamicNotosans(fontSize: 18, weight: .bold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.titleLabel.text = nil
        self.contentView.backgroundColor = .recordCellBackgroundColor
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 10
        self.contentView.layer.masksToBounds = true
    }
}
extension PloggingRecordCollectionViewCell {
    private func configuration() {
        self.contentView.backgroundColor = .recordCellBackgroundColor
    }
    
    private func setupView() {
        self.contentView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        titleLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func updateView() {
        guard let vm = self.viewModel else { return }
        self.titleLabel.text = vm.title
        if vm.isSelected{
            self.contentView.backgroundColor = .init(red: 0, green: 207, blue: 152)
        }
    }
}
