//
//  Task3ViewController.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 27.10.2024.
//

import UIKit

class Task3ViewController: UIViewController {
    let bannerView = UIView()
    let hashtagLabel = UILabel()
    let hashtagCollectionView: UICollectionView
    let imagesCollectionView: UICollectionView
    var giftViewController: GiftViewController = GiftViewController()

    let bannerLabel: UILabel = {
        let label = UILabel()
        label.text = "Try three days free trial"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bannerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You will get all premium templates,\nadditional stickers and no ads"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bannerImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()

    let hashtags = ["#Осень", "#Портрет", "#Insta-стиль", "#Люди", "#Природа"]
    let images = ["feedImage1", "feedImage2", "feedImage3", "feedImage4", "feedImage5", "feedImage6"]

    init() {
        let hashtagLayout = UICollectionViewFlowLayout()
        hashtagLayout.scrollDirection = .horizontal
        hashtagCollectionView = UICollectionView(frame: .zero, collectionViewLayout: hashtagLayout)

        let imageLayout = UICollectionViewFlowLayout()
        imagesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: imageLayout)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fullScreenBackgroundView = UIView(frame: UIScreen.main.bounds)
            fullScreenBackgroundView.backgroundColor = .black
            view.insertSubview(fullScreenBackgroundView, at: 0) // На задний план

            // Обновляем размер, чтобы покрыть область статуса (где часы)
            fullScreenBackgroundView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                fullScreenBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: -100),
                fullScreenBackgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                fullScreenBackgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                fullScreenBackgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 100)
            ])
        
        setupView()
        setupHashtagCollectionView()
        setupImagesCollectionView()
        setupGiftView()
    }
}
