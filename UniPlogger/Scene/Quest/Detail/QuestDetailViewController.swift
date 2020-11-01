//
//  QuestDetailViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/10/20.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
//import SnapKit
//import Then

class QuestDetailViewController: QuestBaseViewController {
    
    // MARK: - Constants
    
    private struct Metric {
        static let contentInset: UIEdgeInsets = .init(top: 30, left: 20, bottom: 50, right: -20)
        static let innerInset: CGFloat = 20
        static let mainToRecommandSpacing: CGFloat = 44
        static let contentHeight: CGFloat = 680
        static let buttonsViewHeight: CGFloat = 194
        static let buttonHeight: CGFloat = 52
    }
    
    // MARK: - Views
    
    private var contentScrollView = UIScrollView().then { scrollView in
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var contentView = UIView().then { view in
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // MARK: Main
    
    private var mainView = UIView().then { view in
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.trainingTint
        view.layer.cornerRadius = 18
        view.isUserInteractionEnabled = false
    }
    
    private var mainTitleLabel = UILabel().then { label in
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "습관 1 Step"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.isUserInteractionEnabled = false
    }
    
    private var mainDescriptionLabel = UILabel().then { label in
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "오늘부터 1달 동안,\n주1회 이상 꾸준히 플로깅하기에\n도전하세요!"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.isUserInteractionEnabled = false
    }
    
    // MARK: Recommand
    
    private var recommandView = UIView().then { view in
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private var recommandTitleLabel = UILabel().then { label in
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = false
        label.text = "이런 퀘스트도 있어요!"
        label.textAlignment = .center
    }
    
    private var recommandSubStackView = UIStackView().then { stackView in
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 21
        stackView.distribution = .fillEqually
    }
    
    // MARK: Buttons
    
    private var buttonsBackgroundView = UIView().then { view in
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.questBackgroundTint
        view.layer.cornerRadius = 22
        view.layer.shadowRadius = 10
        view.layer.shadowColor = UIColor(red: 0.957, green: 0.961, blue: 0.98, alpha: 1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    private var buttonsStackView = UIStackView().then { stackView in
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fill
        stackView.axis = .vertical
    }
    
    private var startButton = VerticalRoundButton().then { button in
        button.setTitle("시작하기", for: .normal)
        button.backgroundColor = Color.questTint
        button.layer.cornerRadius = 21
        button.layer.shadowColor = UIColor(red: 0, green: 0.812, blue: 0.596, alpha: 0.2).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 20
        button.layer.shadowOffset = CGSize(width: 0, height: 10)
    }
    
    private var cancelButton = VerticalRoundButton().then { button in
        button.setTitle("포기하기", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 21
    }
    
    // MARK: Methods
    
    @objc func didTapOtherQuestView(_ gesture: UIGestureRecognizer) {
        let questDetailVC = QuestDetailViewController()
        navigationController?.popViewController(animated: true)
        navigationController?.pushViewController(questDetailVC, animated: true)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayouts()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentScrollView.contentSize.height = mainView.frame.height + recommandView.frame.height + Metric.mainToRecommandSpacing
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    // MARK: - Initializer
    
    func configureSelectors() {
        
    }
    
    override func setupViews() {
        super.setupViews()
        title = "퀘스트"
        
        backgroundView.backgroundColor = Color.questBackground
        
        [contentScrollView, buttonsBackgroundView].forEach {
            backgroundView.addSubview($0)
        }
        
        [contentView].forEach {
            contentScrollView.addSubview($0)
        }
        
        [mainView, recommandView].forEach {
            contentView.addSubview($0)
        }
        
        [mainTitleLabel, mainDescriptionLabel].forEach {
            mainView.addSubview($0)
        }
        
        [recommandTitleLabel, recommandSubStackView].forEach {
            recommandView.addSubview($0)
        }
        
        for _ in 0..<2 {
            let otherView = RecommandOtherView()
            otherView.titleLabel.text = "습관 1 Step"
            otherView.descripionLabel.text = "1달 동안 총 10회 이상 플로깅하기"
            otherView.setTextColor(Color.textBlack)
            otherView.backgroundColor = Color.questBackgroundTint
            otherView.layer.cornerRadius = 18
            otherView.layer.shadowColor = UIColor(red: 0.957, green: 0.961, blue: 0.98, alpha: 1).cgColor
            otherView.layer.shadowOpacity = 1
            otherView.layer.shadowRadius = 10
            otherView.layer.shadowOffset = CGSize(width: 0, height: 4)
            
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOtherQuestView(_:)))
            otherView.addGestureRecognizer(tapGesture)
            recommandSubStackView.addArrangedSubview(otherView)
        }
        
        [buttonsStackView].forEach {
            buttonsBackgroundView.addSubview($0)
        }
        
        [startButton, cancelButton].forEach {
            buttonsStackView.addArrangedSubview($0)
        }
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        contentScrollView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(contentScrollView.contentLayoutGuide).inset(Metric.contentInset)
            $0.width.equalToSuperview().inset(Metric.innerInset)
            $0.height.equalTo(Metric.contentHeight)
        }
        
        mainView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        mainTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(Metric.innerInset)
        }
        
        mainDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(mainTitleLabel.snp.lastBaseline).inset(-Metric.innerInset)
            $0.leading.trailing.bottom.equalToSuperview().inset(Metric.innerInset)
        }
        
        recommandView.snp.makeConstraints {
            $0.top.equalTo(mainView.snp.bottom).inset(-Metric.mainToRecommandSpacing)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        recommandTitleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        
        recommandSubStackView.snp.makeConstraints {
            $0.top.equalTo(recommandTitleLabel.snp.bottom).inset(-Metric.innerInset)
            $0.leading.trailing.equalToSuperview()
        }
        
        buttonsBackgroundView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(Metric.buttonsViewHeight)
        }
        
        buttonsStackView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(Metric.innerInset)
        }
        
        startButton.snp.makeConstraints {
            $0.height.equalTo(Metric.buttonHeight)
        }
        
        cancelButton.snp.makeConstraints {
            $0.height.equalTo(Metric.buttonHeight)
        }
    }
}
