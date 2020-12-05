//
//  QuestDetailViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/10/20.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol QuestDetailDisplayLogic {
    func displayDetail(quest: Quest, recommands: [Quest])
    func dismiss()
}

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
    
    // MARK: - Properties
    
    private var quest: Quest!
    private var recommands = [Quest]()
    var router: (QuestDataPassing & QuestRoutingLogic)?
    var interacter: QuestDetailBusinessLogic?
    
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
        view.shadow(radius: 10,
                    color: UIColor(named: "questBackground"),
                    offset: .zero,
                    opacity: 1)
        view.layer.cornerRadius = 22
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
        button.shadow(radius: 21,
                      color: UIColor(red: 0, green: 0.812, blue: 0.596, alpha: 0.2),
                      offset: .init(width: 0, height: 10),
                      opacity: 1)
    }
    
    private var cancelButton = VerticalRoundButton().then { button in
        button.setTitle("포기하기", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 21
    }
    
    // MARK: - Methods
    
    func didTapOtherQuestView(quest: Quest?) {
        guard let quest = quest else { return }
        interacter?.fetchDetail(quest: quest)
    }
    
    @objc func didTapStartButton(_ sender: UIButton) {
        interacter?.start(quest: quest)
    }
    
    @objc func didTapCancelButton(_ sender: UIButton) {
        dismiss()
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
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
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        
        recommandSubStackView.subviews.forEach {
            $0.layer.shadowColor = UIColor(named: "questBackground")?.cgColor
        }
        buttonsBackgroundView.layer.shadowColor = UIColor(named: "questBackground")?.cgColor
    }
    
    // MARK: - Initializer
    
    func configure(quest: Quest, recommands: [Quest], router: (QuestDataPassing & QuestRoutingLogic)) {
        self.router = router
        self.quest = quest
        
        mainTitleLabel.text = quest.title
        mainDescriptionLabel.text = quest.content
        self.recommands = recommands
        
        let maker = QuestFactory()
        mainView.backgroundColor = maker.cellImageBackgroundColor(for: quest.category)
        
        let presenter = QuestDetailPresenter(viewController: self)
        self.interacter = QuestDetailInteractor(presenter: presenter,worker: QuestDetailWorker())
    }
    
    func configureRecommandViews(recommands: [Quest]) {
        for recommand in recommands {
            let otherView = RecommandOtherView()
            otherView.recommand = recommand
            otherView.tapHandler = { [weak self] in self?.didTapOtherQuestView(quest: $0) }
            recommandSubStackView.addArrangedSubview(otherView)
        }
    }
    
    private func setup() {
        startButton.addTarget(self, action: #selector(didTapStartButton(_:)), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(didTapCancelButton(_:)), for: .touchUpInside)
    }
    
    override func setupViews() {
        super.setupViews()
        title = quest.category == .training ? "학습 퀘스트" : "목표달성형 퀘스트"
        
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
        
        configureRecommandViews(recommands: self.recommands)
        
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

// MARK:  - QuestDetail Display Logic

extension QuestDetailViewController: QuestDetailDisplayLogic {
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    func displayDetail(quest: Quest, recommands: [Quest]) {
//        navigationController?.pushViewController(questDetailVC, animated: true)
        navigationController?.popViewController(animated: true)
        router?.routeToDetail(quest: quest, recommands: recommands)
    }
}
