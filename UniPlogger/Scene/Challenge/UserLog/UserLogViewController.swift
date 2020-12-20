//
//  UserLogViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol UserLogDisplayLogic: class {
    func displayGetFeed(viewModel: Log.GetFeed.ViewModel)
    func displayUserInfo(nickname: String, level: Int, rank: Double)
}

class UserLogViewController: UIViewController, UserLogDisplayLogic {
    var interactor: UserLogBusinessLogic?
    var router:  (NSObjectProtocol & UserLogRoutingLogic & UserLogDataPassing)?
    
    var feedList = [Feed]()
    
    lazy var scrollView = ScrollStackView().then {
        $0.alwaysBounceVertical = true
        $0.refreshControl = UIRefreshControl()
        $0.refreshControl?.addTarget(self, action: #selector(handleRefreshControl), for: .valueChanged)
    }
    lazy var userInfoContainer = UIImageView().then {
        $0.image = UIImage(named: "mypage_background")?.withRenderingMode(.alwaysOriginal)
        $0.contentMode = .scaleToFill
    }
    lazy var characterImageView = UIImageView().then {
        $0.image = UIImage(named: "character")
    }
    lazy var leftStarImageView = UIImageView().then {
        $0.image = UIImage(named: "star_yellow")
    }
    lazy var rightStarImageView = UIImageView().then {
        $0.image = UIImage(named: "star_pink")
    }
    lazy var levelTitleLabel = UILabel().then {
        $0.text = "레벨"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 14, weight: .regular)
    }
    lazy var rankTitleLabel = UILabel().then {
        $0.text = "상위"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 14, weight: .regular)
    }
    lazy var levelLabel = UILabel().then {
        $0.text = "2"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 20, weight: .bold)
    }
    lazy var rankLabel = UILabel().then {
        $0.text = "5%"
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .notoSans(ofSize: 20, weight: .bold)
    }
    
    lazy var nextButton = UIButton().then {
        $0.setTitle("next", for: .normal)
        $0.backgroundColor = .lightGray
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    lazy var collectionView = IntrinsicSizeCollectionView(frame: .zero, collectionViewLayout: LogCollectionViewLayout()).then {
        $0.backgroundColor = UIColor(named: "color_logBackground")
        $0.dataSource = self
        $0.delegate = self
        $0.isScrollEnabled = false
        $0.register(LogCollectionViewCell.self, forCellWithReuseIdentifier: "LogCollectionViewCell")
    }.then {
        $0.isScrollEnabled = false 
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "color_logBackground")
        setNavigationItem()
        setUpViews()
        setUpLayout()
        interactor?.getFeed()
        interactor?.getOtherUser()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        (navigationController as? ChallengeNavigationController)?.setupLayout()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configure() {
        let viewController = self
        let interactor = UserLogInteractor()
        let presenter = UserLogPresenter()
        let router = UserLogRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    private func setNavigationItem() {
        navigationController?.navigationBar.topItem?.title = "챌린지"
    }
  
    @objc func touchUpNextButton() {
        router?.routeToDetail()
    }
    
    func displayGetFeed(viewModel: Log.GetFeed.ViewModel) {
        self.feedList = viewModel.feedList.reversed()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func displayUserInfo(nickname: String, level: Int, rank: Double) {
        navigationItem.title = "\(nickname) 로그"
        self.levelLabel.text = "\(level)"
        self.rankLabel.text = "\(Int(rank))%"
    }
    
    @objc func handleRefreshControl(){
        self.interactor?.getFeed()
    }

}

extension UserLogViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.feedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath) as? LogCollectionViewCell else { fatalError() }
        let feed = feedList[indexPath.item]
        
        cell.viewModel = .init(image: feed.photo)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router?.routeToDetail()
    }
}
