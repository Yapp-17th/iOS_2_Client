//
//  CameraViewController.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/18.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController {
    let nextButton = UIButton().then {
        $0.setTitle("NEXT", for: .normal)
        $0.setTitleColor(.blue, for: .normal)
        $0.addTarget(self, action: #selector(touchUpNextButton), for: .touchUpInside)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    @objc func touchUpNextButton() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        picker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(picker, animated: true, completion: nil)
    }
    private func configureViews() {
        self.view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
    }
}

extension CameraViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true) {
            let vc = ShareViewController()
            vc.modalPresentationStyle = .fullScreen
            vc.ploggingImageView.image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
            self.present(vc, animated: true, completion: nil)
        }
    }
}
