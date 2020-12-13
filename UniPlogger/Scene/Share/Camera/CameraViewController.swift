//
//  CameraViewController.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import AVFoundation

protocol CameraDataStore {
    var ploggingData: PloggingData? { get set }
}

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate, CameraDataStore {
    
    enum FlashMode: Int, CaseIterable {
        case auto = 0, on, off
    }

    lazy var finderView = UIView()
    lazy var captureImageView = UIImageView()
    lazy var cameraButton = UIButton().then {
        $0.setImage(UIImage(named: "share_camera"), for: .normal)
        $0.addTarget(self, action: #selector(didTakePhoto), for: .touchUpInside)
    }
    lazy var flashButton = UIButton().then {
        $0.setImage(UIImage(named: "flash_auto"), for: .normal)
        $0.addTarget(self, action: #selector(touchUpFlashButton), for: .touchUpInside)
    }
    lazy var descriptionLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.text = "플로깅한 쓰레기를\n촬영해주세요."
        $0.textAlignment = .center
        $0.textColor = .white
        $0.font = .notoSans(ofSize: 18, weight: .regular)
    }
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    var photoSetting: AVCapturePhotoSettings!
    
    // dataStore
    var ploggingData: PloggingData? 
    
    private var isFlashMode: FlashMode = .auto {
        didSet {
            switch isFlashMode {
            case .auto:
                flashButton.setImage(UIImage(named: "flash_auto"), for: .normal)
            case .off:
                flashButton.setImage(UIImage(named: "flash_off"), for: .normal)
            case .on:
                flashButton.setImage(UIImage(named: "flash_on"), for: .normal)
            }
        }
    }
    
    override func viewDidLoad() {
        setupViews()
        setUpLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        guard let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
            else {
                print("Unable to access back camera!")
                return
        }
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                photoSetting = AVCapturePhotoSettings(format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
                setupLivePreview()
            }
        }
        catch let error {
            print("Error Unable to initialize back camera:  \(error.localizedDescription)")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.captureSession.stopRunning()
    }
    
    func setupLivePreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer.videoGravity = .resize
        videoPreviewLayer.connection?.videoOrientation = .portrait
        finderView.layer.addSublayer(videoPreviewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            self.captureSession.startRunning()
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.finderView.bounds
            }
        }
    }
    
    @objc func didTakePhoto() {
        setFlashMode()
        stillImageOutput.capturePhoto(with: photoSetting, delegate: self)
    }
    
    @objc func touchUpFlashButton() {
        isFlashMode = FlashMode(rawValue: (isFlashMode.rawValue + 1) % 3)!
        setFlashMode()
    }
    
    private func setFlashMode() {
        switch isFlashMode {
        case .auto:
            photoSetting.flashMode = .auto
        case .off:
            photoSetting.flashMode = .off
        case .on:
            photoSetting.flashMode = .on
        }
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation()
            else { return }
        let image = UIImage(data: imageData)
        let vc = ImagePreviewViewController()
        vc.capturedImage = image
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension CameraViewController {
    func setupViews() {
        self.view.backgroundColor = .black
        [finderView, captureImageView, cameraButton, flashButton, descriptionLabel].forEach {
            self.view.addSubview($0)
        }
    }
    
    func setUpLayout() {
        finderView.snp.makeConstraints { (make) in
            make.top.equalTo(view.frame.height * 0.211)
            make.width.equalTo(view.frame.width)
            make.height.equalTo(view.frame.width)
        }
        flashButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalTo(view.frame.height * 0.117)
        }
        cameraButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-view.frame.height * 0.098)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(view.frame.width * 0.17)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(finderView)
        }
    }
}
