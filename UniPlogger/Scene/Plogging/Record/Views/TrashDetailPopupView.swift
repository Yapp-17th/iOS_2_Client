//
//  TrashDetailPopupView.swift
//  UniPlogger
//
//  Created by 손병근 on 2020/12/05.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

class TrashDetailPopupView: UIViewController {
    var itemType: PloggingItemType
    required init(type: PloggingItemType) {
        self.itemType = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let infoIconImageView = UIImageView().then {
        $0.image = UIImage(named: "ic_infoContainer")?.withRenderingMode(.alwaysTemplate)
        $0.tintColor = UIColor(named: "color_text")
        $0.contentMode = .scaleAspectFit
    }
    
    let titleLabel = UILabel().then {
        $0.text = "세부 리스트"
        $0.font = .notoSans(ofSize: 20, weight: .bold)
    }
    
    lazy var contentLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.attributedText = self.itemType.detailInfo
    }
    
    
    let infoContainer = UIView().then {
        $0.backgroundColor = UIColor(named: "color_infoContainerBackground")
        $0.layer.cornerRadius = 26
        $0.layer.masksToBounds = true
    }
    
    let vStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 20
        $0.distribution = .fillEqually
    }
    
    let closeButton = UIButton().then {
        $0.backgroundColor = .main
        $0.setTitle("닫기", for: .normal)
        $0.titleLabel?.font = .roboto(ofSize: 15, weight: .bold)
        $0.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setupView()
        setupLayout()
        updateView()
    }
    
    

    private func configuration() {
        self.view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    }
    
    private func setupView() {
        self.view.addSubview(infoContainer)
        infoContainer.addSubview(closeButton)
        infoContainer.addSubview(vStackView)
        infoContainer.addSubview(contentLabel)
        infoContainer.addSubview(titleLabel)
        infoContainer.addSubview(infoIconImageView)
    }
    
    private func setupLayout() {
        infoContainer.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(335)
        }
        
        closeButton.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(52)
        }
        
        vStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(closeButton.snp.top).offset(-24)
        }
        
        contentLabel.snp.makeConstraints {
            $0.leading.equalTo(24)
            $0.trailing.equalTo(-24)
            $0.bottom.equalTo(vStackView.snp.top).offset(-24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(contentLabel.snp.top).offset(-16)
            $0.top.equalTo(24)
        }
        
        infoIconImageView.snp.makeConstraints {
            $0.trailing.equalTo(titleLabel.snp.leading).offset(-10)
            $0.centerY.equalTo(titleLabel)
        }
    }
    
    private func updateView() {
        self.vStackView.arrangedSubviews.forEach {
            self.vStackView.removeArrangedSubview($0)
        }
        var size:CGFloat = 0
        if itemType.detailItems.count == 1{
            size = 126
        } else if itemType.detailItems.count == 3 {
            size = 80
        } else {
            size = 60
        }
        
        let topHStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.distribution = .equalCentering
            $0.alignment = .center
        }
        
        let bottomHStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.distribution = .equalCentering
            $0.alignment = .center
        }
        
        if itemType.detailItems.count > 3 {
            self.vStackView.addArrangedSubview(topHStackView)
            let v = UIView()
            v.addSubview(bottomHStackView)
            self.vStackView.addArrangedSubview(v)
            
            bottomHStackView.snp.makeConstraints{
                $0.top.bottom.centerX.equalToSuperview()
            }
            
        } else {
            vStackView.addArrangedSubview(topHStackView)
        }
        
        for (i, d) in self.itemType.detailItems.enumerated() {
            let itemView = TrashDetailPopupCircleView(text: d)
            itemView.snp.makeConstraints{
                $0.width.height.equalTo(size)
            }
            print(i)
            if i < 3 {
                topHStackView.addArrangedSubview(itemView)
            } else {
                bottomHStackView.addArrangedSubview(itemView)
            }
        }
    }
    
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
}


class TrashDetailPopupCircleView: UIView {
    let text: NSMutableAttributedString
    
    lazy var textLabel = UILabel().then {
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.attributedText = self.text
    }
    
    // MARK: Object lifecycle
    required init(text: NSMutableAttributedString){
        self.text = text
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setup() {
        configuration()
        setupView()
        setupLayout()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.masksToBounds = true
    }
}

extension TrashDetailPopupCircleView {
    private func configuration() {
        self.backgroundColor = .recordCellBackgroundColor
    }
    
    private func setupView() {
        self.addSubview(textLabel)
    }
    
    private func setupLayout() {
        textLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func updateView() {
        
    }
}
