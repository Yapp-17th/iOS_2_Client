//
//  DetailViewController.swift
//  UniPlogger
//
//  Created by 고세림 on 2020/11/17.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import Photos
protocol DetailDisplayLogic: class {
    func displayGetFeed(viewModel: Detail.GetFeed.ViewModel, uid: Int)
    func displayDeleteFeed()
}

class DetailViewController: UIViewController {
    var router: (NSObjectProtocol & DetailRoutingLogic & DetailDataPassing)?
    var interactor: DetailBusinessLogic?
    var imageForSave: UIImage?
    
    lazy var backgroundImageView = UIImageView().then {
        let image = UIImage(named: "mainBackground")
        $0.image = image!.resizeTopAlignedToFill(newWidth: self.view.frame.width)
        $0.contentMode = .top
        $0.clipsToBounds = true
    }
    
    let ploggingImageViewContainer = UIView().then{
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
    }
    
    lazy var ploggingImageView = PloggingImageView().then {
        $0.backgroundColor = .lightGray
        
    }
    lazy var reportButton = UIBarButtonItem(image: UIImage(named: "report"), style: .plain, target: self, action: #selector(touchUpReportButton))

    lazy var shareButtonView = UIView()
    lazy var shareButton = UIButton().then {
        $0.setImage(UIImage(named: "share_instagram"), for: .normal)
        $0.backgroundColor = UIColor(named: "shareColor")
        $0.layer.cornerRadius = 50
        $0.addTarget(self, action: #selector(touchUpShareButton), for: .touchUpInside)
    }
    
    
    
    // MARK: Object lifecycle
      
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }

    // MARK: Setup
    
    private func configure() {
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
        self.hidesBottomBarWhenPushed = true
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setNavigationItem()
        setUpViews()
        setUpLayout()
        self.interactor?.getFeed()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.imageForSave = mergeViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        (navigationController as? ChallengeNavigationController)?.setupLayout()
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
    @objc func touchUpDeleteButton(){
      let alert = UIAlertController(title: "경고", message: "피드를 삭제하시겠습니까?", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
        self.interactor?.deleteFeed()
      }))
      alert.addAction(UIAlertAction(title: "취소", style: .cancel))
      self.present(alert, animated: true, completion: nil)
    }
    
    @objc func touchUpSaveButton() {
        guard let image = imageForSave else { return }
        let photoManager = PhotoManager(albumName: "UniPlogger")
        photoManager.save(image) { (success, error) in
            if success {
                DispatchQueue.main.async {
                    self.showAlert(title: "사진 저장", message: "사진이 저장되었습니다.")
                }
            } else {
                DispatchQueue.main.async {
                    self.showAlert(title: "ERROR", message: error?.localizedDescription ?? "error")
                }
            }
        }
    }
    
    @objc func touchUpShareButton() {
        guard let imageForShare = self.mergeViews() else { return }
        
        if !AuthManager.shared.autoSave {
            showAlert(title: "사진을 저장하시겠습니까?",
                      message: "사진을 저장해야만 공유가 가능합니다.",
                      confirm: (title: "YES", handler: ({ [weak self] action in
                        self?.shareImage(for: imageForShare)
                      })),
                      cancel: (title: "NO", handler: { _ in
                        return
                      }))
        } else {
            shareImage(for: imageForShare)
        }
    }
    
    func shareImage(for image: UIImage) {
        let photoManager = PhotoManager(albumName: "UniPlogger")
        photoManager.save(image) { (success, error) in
            if success {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                guard let lastAssetIdentifier = fetchResult.firstObject?.localIdentifier else { return }
                DispatchQueue.main.async {
                    self.showAlert(title: "사진 저장", message: "사진이 저장되었습니다.")
                }
                self.interactor?.shareToInstagram(assetIdentifier: lastAssetIdentifier)
            } else {
                DispatchQueue.main.async {
                    self.showAlert(title: "ERROR", message: error?.localizedDescription ?? "error")
                }
            }
        }
    }
    
    func showAlert(title: String,
                   message: String,
                   confirm: (title: String, handler: ((UIAlertAction) -> Void))? = nil,
                   cancel: (title: String, handler: ((UIAlertAction) -> Void))? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: confirm?.title ?? "OK", style: .default, handler: { action in
            confirm?.handler(action) ?? self.dismiss(animated: true, completion: nil)
        })
        let cancelActon = UIAlertAction(title: cancel?.title ?? "NO", style: .cancel) { action in
            cancel?.handler(action)
        }
        alertController.addAction(confirmAction)
        if cancel != nil {
            alertController.addAction(cancelActon)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func mergeViews() -> UIImage? {
        let image = ploggingImageView.asImage()
        return image
    }
}

extension DetailViewController: DetailDisplayLogic {
    func displayGetFeed(viewModel: Detail.GetFeed.ViewModel, uid: Int) {
        ploggingImageView.ploggingInfoView.viewModel = .init(distance: viewModel.distance, time: viewModel.time)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY.MM.dd"
        self.navigationItem.title = dateFormatter.string(from: viewModel.date)
        ImageDownloadManager.shared.downloadImage(url: viewModel.photo) { (image) in
            self.ploggingImageView.image = image
            self.imageForSave = self.mergeViews()
            UPLoader.shared.hidden()
        }
        print(viewModel)
        if let id = AuthManager.shared.user?.id, uid == id{
            setupMyFeed()
        } else {
            setupOtherFeed()
        }
    }
    
    func displayDeleteFeed() {
        UPLoader.shared.hidden()
        let alert = UIAlertController(title: "알림", message: "피드 삭제가 완료되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.navigationController?.popViewController(animated: true)
            }
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupMyFeed() {
        let barbuttonItems:[UIBarButtonItem] = [
            .init(image: UIImage(named: "ic_detailSaveImage")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchUpSaveButton)),
            .init(image: UIImage(named: "ic_detailDelete")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchUpDeleteButton))
        ]
        
        self.navigationItem.rightBarButtonItems = barbuttonItems
        self.shareButtonView.isHidden = false
        
    }
    
    func setupOtherFeed() {
        
        self.navigationItem.rightBarButtonItem = .init(image: UIImage(named: "report")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(touchUpReportButton))
        shareButtonView.isHidden = true
    }
    
    
}
