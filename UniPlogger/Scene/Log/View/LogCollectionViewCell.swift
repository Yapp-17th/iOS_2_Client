//
//  LogCollectionViewCell.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/11/22.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class LogCollectionViewCell: UICollectionViewCell{
    struct ViewModel {
        var image: String
    }
    
    var viewModel: ViewModel? {
        didSet{
            self.updateView()
        }
    }
    
    let imageView = UIImageView().then{
        $0.contentMode = .scaleAspectFill
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
        self.imageView.image = nil
        self.contentView.backgroundColor = .black
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layer.cornerRadius = 4
        self.contentView.layer.masksToBounds = true
    }
}

extension LogCollectionViewCell {
    private func configuration() {
        self.contentView.backgroundColor = .black
    }
    
    private func setupView() {
        self.contentView.addSubview(imageView)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func updateView() {
        guard let vm = self.viewModel else { return }
        self.imageView.image = UIImage(named: vm.image)
    }
}

