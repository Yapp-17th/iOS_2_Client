//
//  QuestViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol QuestDisplayLogic {
    func displayQuests(viewModel: QuestModels.ViewModel)
    func updateQuest(viewModel: QuestModels.ViewModel, at indexPath: IndexPath)
    func displayDetail(quest: Quest, recommads: [Quest])
}

class QuestViewController: QuestBaseViewController {
    
    // MARK: - Constants
    
    private struct Metric {
        static let statusHeight: CGFloat = 91
        static let viewLeading: CGFloat = 16
        static let viewTrailing: CGFloat = -16
        static let verticalSpacing: CGFloat = 20
    }
    
    private struct Images {
        static let info = "ic_info"
    }
    
    // MARK: - Views
    
    private var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "챌린지"
    }
    
    private var navigationTabsView = NavigationTabsView<QuestState>(items: [.todo, .doing, .done], tintColor: UIColor(named: "questTint")).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.masksToBounds = true
        $0.spacing = 1
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.configure(activeTextColor: .white, defaultTextColor: UIColor(named: "questNavigationTabText"))
        $0.selectedIndex = 0
    }
    
    private lazy var questTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(QuestTableViewCell.self, forCellReuseIdentifier: QuestTableViewCell.identifire)
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        $0.backgroundColor = .clear
        $0.contentInset = .init(top: 0, left: 0, bottom: Metric.verticalSpacing, right: 0)
        $0.showsVerticalScrollIndicator = false
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        $0.refreshControl = refreshControl
    }
    
    private lazy var infoBoxButton = UIButton().then {
        $0.setImage(UIImage(named: Images.info), for: .normal)
        $0.addTarget(self, action: #selector(touchedInfoButton(_:)), for: .touchUpInside)
    }
    
    lazy var coachMarkView = QuestCoachMarkView().then {
        $0.frame = view.frame
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        $0.isHidden = true
    }
    
    // MARK: - Properties
    
    private var questViewModel: QuestModels.ViewModel?
    private var interactor: QuestBusinessLogic?
    private(set) var router: (QuestDataPassing & QuestRoutingLogic)?
    private var currentQuestState: QuestState = .todo {
        didSet {
            interactor?.change(state: currentQuestState)
        }
    }
    
    // MARK: - Methods
    
    private func fetchData() {
        let request = QuestModels.Reqeust(state: currentQuestState)
        interactor?.fetchQuest(request: request)
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        setupLayouts()
        
        if UserDefaults.standard.bool(forDefines: .hasQuestTutorial) == false {
            coachMarkView.isHidden = false
            let nav = UINavigationController()
            let t1 = QuestTutorialViewController1()
            nav.addChild(t1)
            nav.modalPresentationStyle = .fullScreen
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.present(nav, animated: false, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupCoachLayout()
    }
    
    func setupCoachLayout() {
        let infoFrame = infoBoxButton.convert(infoBoxButton.frame, to: UIApplication.shared.windows.first(where: { $0.isKeyWindow }))
        coachMarkView.cancelButton.frame = infoFrame
        let frame = backgroundView.convert(questTableView.frame, to: coachMarkView)
        coachMarkView.coachMarkTableView.frame = .init(x: 0, y: frame.origin.y, width: backgroundView.frame.width, height: frame.height)
    }
    
    // MARK: - Initialize
    
    func configureLogic(interactor: QuestBusinessLogic, router: (QuestRoutingLogic & QuestDataPassing)) {
        self.interactor = interactor
        self.router = router
    }
    
    private func setup() {
        navigationTabsView.tapHandler = { [weak self] state in
            self?.currentQuestState = state
        }
    }
    
    override func setupViews() {
        super.setupViews()
        title = "퀘스트"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: infoBoxButton)
        backgroundView.addSubview(navigationTabsView)
        backgroundView.addSubview(questTableView)
        UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.addSubview(coachMarkView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()

        navigationTabsView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Metric.verticalSpacing)
            $0.leading.equalTo(backgroundView.snp.leading).offset(Metric.viewLeading)
            $0.trailing.equalTo(backgroundView.snp.trailing).offset(Metric.viewTrailing)
            $0.height.equalTo(42)
        }
        
        questTableView.snp.makeConstraints {
            $0.top.equalTo(navigationTabsView.snp.bottom).offset(Metric.verticalSpacing)
            $0.leading.equalTo(backgroundView.snp.leading).offset(Metric.viewLeading)
            $0.trailing.equalTo(backgroundView.snp.trailing).offset(Metric.viewTrailing)
            $0.bottom.equalTo(backgroundView.snp.bottom)
        }
    }
    
    // MARK: Selectors
    
    @objc private func pullToRefresh() {
        fetchData()
        questTableView.refreshControl?.endRefreshing()
    }
    
    @objc private func touchedInfoButton(_ sender: UIBarButtonItem) {
        coachMarkView.isHidden = false
    }
}

// MARK:  - Quest Display Logic

extension QuestViewController: QuestDisplayLogic {
    func displayDetail(quest: Quest, recommads: [Quest]) {
        UPLoader.shared.hidden()
        router?.routeToDetail(quest: quest, recommands: recommads)
    }
    
    func updateQuest(viewModel: QuestModels.ViewModel, at indexPath: IndexPath) {
        UPLoader.shared.hidden()
        questViewModel = viewModel
        
        questTableView.beginUpdates()
        questTableView.deleteRows(at: [indexPath], with: .fade)
        questTableView.endUpdates()
    }
    
    func displayQuests(viewModel: QuestModels.ViewModel) {
        UPLoader.shared.hidden()
        questViewModel = viewModel
        questTableView.reloadData()
    }
}

extension QuestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return questViewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questViewModel?.numberOfQuest(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestTableViewCell.identifire, for: indexPath) as? QuestTableViewCell,
              let questViewModel = questViewModel?.quest(at: indexPath)
        else {
            return UITableViewCell()
        }
        
        cell.configure(viewModel: questViewModel)
        return cell
        
    }
}

extension QuestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        interactor?.showDetail(at: indexPath, state: currentQuestState)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return questViewModel?.height(at: indexPath) ?? .zero
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "") { [weak self] (action, view, completion) in
            
            completion(true)
            guard let self = self else { return }
            self.interactor?.touchedQuestAccessory(at: indexPath, state: self.currentQuestState)
        }
        
        let quest = questViewModel?.quest(at: indexPath)
        deleteAction.image = quest?.accessoryImage
        deleteAction.backgroundColor = Color.questBackground
        
        return .init(actions: [deleteAction])
    }
}
