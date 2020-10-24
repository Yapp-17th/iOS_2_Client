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
    let circleView = UIView().then{
        $0.backgroundColor = .init(red: 220, green: 226, blue: 233)
        $0.layer.cornerRadius = 48
        $0.layer.masksToBounds = true
    }
    
    let titleLabel = UILabel().then{
        $0.font = .notoSans(ofSize: 18, weight: .bold)
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
        self.circleView.backgroundColor = .init(red: 220, green: 226, blue: 233)
    }
}
extension PloggingRecordCollectionViewCell {
    private func configuration() {
        // backgroundColor = .white
    }
    
    private func setupView() {
        self.contentView.addSubview(circleView)
        circleView.addSubview(titleLabel)
    }
    
    private func setupLayout() {
        circleView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func updateView() {
        guard let vm = self.viewModel else { return }
        self.titleLabel.text = vm.title
        if vm.isSelected{
            self.circleView.backgroundColor = .init(red: 0, green: 207, blue: 152)
        }
    }
}
