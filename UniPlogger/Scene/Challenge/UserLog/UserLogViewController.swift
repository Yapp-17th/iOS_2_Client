//
//  UserLogViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol UserLogDisplayLogic: class {
    
}

class UserLogViewController: UIViewController, UserLogDisplayLogic {
    var interactor: UserLogBusinessLogic?
    var router:  (NSObjectProtocol & UserLogRoutingLogic & UserLogDataPassing)?
    
    lazy var scrollView = UIScrollView()
    lazy var userInfoContainer = UIImageView().then {
        $0.image = UIImage(named: "bg_logPloggerContainer")?.withRenderingMode(.alwaysOriginal)
        $0.contentMode = .scaleAspectFill
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
        $0.register(LogCollectionViewCell.self, forCellWithReuseIdentifier: "LogCollectionViewCell")
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
        self.view.backgroundColor = .white
        setNavigationItem()
        setUpViews()
        setUpLayout()
        interactor?.printId()
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
        let nickname = "nickname"
        navigationItem.title = "\(nickname) 로그"
        navigationController?.navigationBar.topItem?.title = "챌린지"
    }
  
    @objc func touchUpNextButton() {
        router?.routeToDetail()
    }

}

extension UserLogViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LogCollectionViewCell", for: indexPath) as? LogCollectionViewCell else { fatalError() }
        cell.viewModel = .init(image: "img_logSample\(indexPath.item + 1)")
        cell.backgroundColor = .lightGray
        return cell
    }
}
