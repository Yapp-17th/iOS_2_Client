//
//  ShareViewController.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/09/29.
//  Copyright (c) 2020 손병근. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Photos
import SnapKit
import Then

protocol ShareDisplayLogic: class {
    func displayFetchRecord(viewModel: Share.FetchRecord.ViewModel)
    func displayError(error: Common.CommonError, useCase: Share.UseCase)
}

class ShareViewController: UIViewController, PhotoManagerDelegate {
    var interactor: ShareBusinessLogic?
    var router: (NSObjectProtocol & ShareRoutingLogic & ShareDataPassing)?
    
    var imageForShare: UIImage?
    
    let photoManager = PhotoManager(albumName: "UniPlogger")
    
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
    lazy var dismissButton = UIButton().then {
        $0.setImage(UIImage(named: "share_dismiss"), for: .normal)
        $0.backgroundColor = UIColor(named: "dismissColor")
        $0.layer.cornerRadius = 20
        $0.addTarget(self, action: #selector(touchUpDismissButton), for: .touchUpInside)
    }
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
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = ShareInteractor()
        let presenter = SharePresenter()
        let router = ShareRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
        setUpView()
        setUpLayout()
        photoManager.delegate = self
        self.interactor?.fetchRecord()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.imageForShare = mergeViews()
        ploggingImageView.clipsToBounds = true
    }
    
    @objc func touchUpDismissButton() {
        guard let imageForSave = self.imageForShare else { return }
        let photoManager = PhotoManager(albumName: "UniPlogger")
        
        guard AuthManager.shared.autoSave else {
            showAlert(title: "사진을 저장하시겠습니까?",
                      message: "사진을 자동으로 저장하시려면 환경설정을 확인해주세요.",
                      confirm: (title: "YES", handler: { [weak self] action in
                        DispatchQueue.main.async {
                            self?.showAlert(title: "사진 저장", message: "사진이 저장되었습니다.")
                        }
                      }),
                      cancel: (title: "NO", handler: { [weak self] action in
                        self?.dismiss(animated: true, completion: nil)
                      }))
            return
        }
        photoManager.save(imageForSave) { (success, error) in
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
        guard let imageForShare = self.imageForShare else { return }
        
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
        let outPutImageView = UIImageView()
        let image = ploggingImageView.asImage()
        outPutImageView.image = image
        return outPutImageView.image
    }
    
    func showAuthAlert(completion: @escaping () -> ()) {
        let alertController = UIAlertController(title: "알림", message: "사진 저장을 위해서는 사진 접근 권한을 허용해야합니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default, handler: { _ in
            completion()
        })
        alertController.addAction(confirmAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension ShareViewController: ShareDisplayLogic {
    func displayFetchRecord(viewModel: Share.FetchRecord.ViewModel) {
        UPLoader.shared.hidden()
        self.ploggingImageView.ploggingInfoView.viewModel = .init(distance: viewModel.distance, time: viewModel.time)
        self.ploggingImageView.image = viewModel.image
    }
    func displayError(error: Common.CommonError, useCase: Share.UseCase) {
        UPLoader.shared.hidden()
        switch error {
        case .server(let msg):
            self.errorAlert(title: "오류", message: msg, completion: nil)
        case .local(let msg):
            self.errorAlert(title: "오류", message: msg, completion: nil)
        case .error(let error):
            if let error = error as? URLError {
                NetworkErrorManager.alert(error) { _ in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                        guard let self = self else { return }
                        switch useCase{
                        case .FetchRecord:
                            self.interactor?.fetchRecord()
                        }
                    }
                }
            } else if let error = error as? MoyaError{
                NetworkErrorManager.alert(error)
            }
            
        }
    }
}

extension ShareViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ploggingImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
}
