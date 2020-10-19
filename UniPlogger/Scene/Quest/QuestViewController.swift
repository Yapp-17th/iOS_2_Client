//
//  QuestViewController.swift
//  UniPlogger
//
//  Created by woong on 2020/09/29.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import SnapKit
import Then

protocol QuestDisplayLogic {
    func displayQuests(viewModel: QuestModels.ViewModel)
    
}

class QuestViewController: UIViewController {
    
    // MARK: - Constants
    
    private struct Metric {
        static let statusHeight: CGFloat = 91
        static let viewLeading: CGFloat = 16
        static let viewTrailing: CGFloat = -16
        static let verticalSpacing: CGFloat = 20
        
        struct Cell {
            static let trainingHeight: CGFloat = 176 + 20
            static let routineHeight: CGFloat = 88 + 20
        }
    }
    
    // MARK: - Views
    
    private var statusView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 30
        $0.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        $0.backgroundColor = UIColor(red: 0.957, green: 0.98, blue: 0.992, alpha: 1)
    }
    
    private var titleLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "챌린지"
    }
    
    private var navigationTabsView = NavigationTabsView<QuestState>(items: [.todo, .doing, .done], color: "5F74F4".hexToColor()).then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 21
        $0.layer.masksToBounds = true
        $0.spacing = 1
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.configure(activeTextColor: .white, defaultTextColor: .lightGray)
        $0.selectedIndex = 0
    }
    
    private var questTableView = UITableView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        $0.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Properties
    
    private var questViewModel: QuestModels.ViewModel?
    private var interactor: QuestBusinessLogic?
    private var currentQuestState: QuestState = .todo {
        didSet {
            fetchData()
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
        setupTableView()
        setupViews()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    
    // MARK: - Initialize
    
    private func setup() {
        navigationTabsView.tapHandler = { [weak self] state in
            self?.currentQuestState = state
        }
        
        let viewController = self
        let presenter = QuestPresenter(viewController: viewController, questFactory: QuestFactory())
        let worker = QuestWorker()
        let interactor = QuestInteractor(presenter: presenter, worker: worker)
        
        viewController.interactor = interactor
    }
    
    private func setupTableView() {
        questTableView.register(QuestTableViewCell.self, forCellReuseIdentifier: QuestTableViewCell.identifire)
        questTableView.dataSource = self
        questTableView.delegate = self
    }
    
    private func setupViews() {
        view.addSubview(navigationTabsView)
        view.addSubview(questTableView)
    }
    
    private func setupLayout() {
        title = "퀘스트"
        
        navigationTabsView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(Metric.verticalSpacing)
            $0.leading.equalTo(view.snp.leading).offset(Metric.viewLeading)
            $0.trailing.equalTo(view.snp.trailing).offset(Metric.viewTrailing)
            $0.height.equalTo(42)
        }
        
        questTableView.snp.makeConstraints {
            $0.top.equalTo(navigationTabsView.snp.bottom).offset(Metric.verticalSpacing)
            $0.leading.equalTo(view.snp.leading).offset(Metric.viewLeading)
            $0.trailing.equalTo(view.snp.trailing).offset(Metric.viewTrailing)
            $0.bottom.equalTo(view.snp.bottom).offset(Metric.verticalSpacing)
        }
    }
}

extension QuestViewController: QuestDisplayLogic {
    func displayQuests(viewModel: QuestModels.ViewModel) {
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
        
//        let trainingQuestVC = TrainingQuestViewController()
//        navigationController?.pushViewController(trainingQuestVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let category = questViewModel?.categoryOfSection[indexPath.section] else { return 0 }
        
        switch category {
            case .training: return Metric.Cell.trainingHeight
            case .routine: return Metric.Cell.routineHeight
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "") { [weak self] (action, view, completion) in
            
            completion(true)
            guard let self = self else { return }
            self.interactor?.moveToNextStageAt(indexPath, state: self.currentQuestState)
        }
        
        let quest = questViewModel?.quest(at: indexPath)
        deleteAction.image = quest?.accessoryImage
        deleteAction.backgroundColor = .white
        
        return .init(actions: [deleteAction])
    }
}

extension String {
    func hexToColor(alpha:CGFloat = 1.0) -> UIColor {
        var cString:String = self.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
