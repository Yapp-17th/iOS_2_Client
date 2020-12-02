//
//  DetailViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displayGetFeed(viewModel: Detail.GetFeed.ViewModel)
}

class DetailViewController: ChallengeBaseViewController {
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    var interactor: DetailBusinessLogic?
    
    lazy var backgroundImageView = UIImageView().then {
        let image = UIImage(named: "mainBackground")
        $0.image = image!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
        $0.clipsToBounds = true
    }
    lazy var ploggingImageView = PloggingImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true 
    }
    lazy var reportButton = UIBarButtonItem(image: UIImage(named: "report"), style: .plain, target: self, action: #selector(touchUpReportButton))

    // MARK: Object lifecycle
      
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        viewController.router = router
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configure()
        setNavigationItem()
        setUpViews()
        setUpLayout()
        self.interactor?.getFeed()
    }

    private func configure() {
        let viewController = self
        let router = DetailRouter()
        viewController.router = router
        router.viewController = viewController
    }
    
    private func setNavigationItem() {
        let date = "20.10.17"
        navigationItem.title = "\(date)"
        navigationController?.navigationBar.backItem?.title = "로그"
        self.navigationItem.rightBarButtonItem = reportButton
    }
    
    @objc func touchUpReportButton() {
        router?.routeToReport()
    }
}

extension DetailViewController: DetailDisplayLogic {
    func displayGetFeed(viewModel: Detail.GetFeed.ViewModel) {
        ploggingImageView.ploggingInfoView.viewModel = .init(distance: viewModel.distance, time: viewModel.time)
        self.navigationItem.title = viewModel.title
        ImageDownloadManager.shared.downloadImage(url: viewModel.photo) { (image) in
            self.ploggingImageView.image = image
        }
    }
}
