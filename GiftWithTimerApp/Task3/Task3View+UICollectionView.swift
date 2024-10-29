//
//  Task3View+UICollectionView.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 29.10.2024.
//

import UIKit

extension Task3ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == hashtagCollectionView ? hashtags.count : images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == hashtagCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HashtagCell", for: indexPath) as! HashtagCell
            cell.configure(with: hashtags[indexPath.item])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as! ImageCell
            cell.configure(with: images[indexPath.item])
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == hashtagCollectionView {
            let label = UILabel()
            label.text = hashtags[indexPath.item]
            label.font = UIFont.systemFont(ofSize: 16)
            label.sizeToFit()
            return CGSize(width: label.frame.width + 20, height: 32)
        } else {
            let imageName = images[indexPath.item]
            if let image = UIImage(named: imageName) {
                let aspectRatio = image.size.height / image.size.width
                let width = (view.frame.width - 48) / 2
                return CGSize(width: width, height: width * aspectRatio)
            }
            return CGSize(width: 0, height: 0)
        }
    }
}
