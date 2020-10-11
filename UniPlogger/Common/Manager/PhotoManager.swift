//
//  PhotoManager.swift
//  UniPlogger
//
//  Created by 바보세림이 on 2020/10/01.
//  Copyright © 2020 손병근. All rights reserved.
//

import UIKit
import Photos

class PhotoManager {

    private var albumName: String
    private var album: PHAssetCollection?

    init(albumName: String) {
        self.albumName = albumName

        if let album = getAlbum() {
            self.album = album
            return
        }
    }

    private func getAlbum() -> PHAssetCollection? {
        let options = PHFetchOptions()
        options.predicate = NSPredicate(format: "title = %@", albumName)
        let collection = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: options)
        return collection.firstObject ?? nil
    }

    private func createAlbum(completion: @escaping (Bool) -> ()) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetCollectionChangeRequest.creationRequestForAssetCollection(withTitle: self.albumName)
        }, completionHandler: { (result, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                self.album = self.getAlbum()
                completion(result)
            }
        })
    }

    private func add(image: UIImage, completion: @escaping (Bool, Error?) -> ()) {
        PHPhotoLibrary.shared().performChanges({
            let assetChangeRequest = PHAssetChangeRequest.creationRequestForAsset(from: image)
            if let album = self.album, let placeholder = assetChangeRequest.placeholderForCreatedAsset {
                let albumChangeRequest = PHAssetCollectionChangeRequest(for: album)
                let enumeration = NSArray(object: placeholder)
                albumChangeRequest?.addAssets(enumeration)
            }
        }, completionHandler: { (result, error) in
            completion(result, error)
        })
    }

    func save(_ image: UIImage, completion: @escaping (Bool, Error?) -> ()) {
        PHPhotoLibrary.requestAuthorization { status in
            guard status == .authorized else {
                // fail and redirect to app settings
                return
            }

            if let _ = self.album {
                self.add(image: image) { (result, error) in
                    completion(result, error)
                }
                return
            }

            self.createAlbum(completion: { _ in
                self.add(image: image) { (result, error) in
                    completion(result, error)
                }
            })
        }
    }
}
