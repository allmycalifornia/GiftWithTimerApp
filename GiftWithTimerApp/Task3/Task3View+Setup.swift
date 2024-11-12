//
//  Task3View+Setup.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 29.10.2024.
//

import UIKit

extension Task3ViewController {
    func setupView() {
        view.backgroundColor = .black
        setupBannerView()
        setupHashtagLabel()
    }

    func setupBannerView() {
        bannerView.layer.cornerRadius = 12
        bannerView.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "8B67EF")?.cgColor ?? UIColor.magenta.cgColor,
            UIColor(hex: "C373E7")?.cgColor ?? UIColor.purple.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = view.bounds
        bannerView.layer.insertSublayer(gradientLayer, at: 0)

        view.addSubview(bannerView)
        view.addSubview(bannerLabel)
        view.addSubview(bannerSubtitleLabel)
        view.addSubview(bannerImage)

        bannerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bannerView.heightAnchor.constraint(equalToConstant: 120),

            bannerLabel.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 16),
            bannerLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 16),

            bannerSubtitleLabel.topAnchor.constraint(equalTo: bannerLabel.bottomAnchor, constant: 4),
            bannerSubtitleLabel.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 16),
            bannerSubtitleLabel.trailingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: -16),

            bannerImage.topAnchor.constraint(equalTo: bannerView.topAnchor, constant: 16),
            bannerImage.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -20),
            bannerImage.heightAnchor.constraint(equalToConstant: 80),
            bannerImage.widthAnchor.constraint(equalToConstant: 98)
        ])
    }

    func setupHashtagLabel() {
        hashtagLabel.text = "Подходит для:"
        hashtagLabel.textColor = .white
        hashtagLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        view.addSubview(hashtagLabel)
        hashtagLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hashtagLabel.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 20),
            hashtagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }

    func setupHashtagCollectionView() {
        hashtagCollectionView.backgroundColor = .clear
        hashtagCollectionView.dataSource = self
        hashtagCollectionView.delegate = self
        hashtagCollectionView.register(HashtagCell.self, forCellWithReuseIdentifier: "HashtagCell")
        hashtagCollectionView.showsHorizontalScrollIndicator = false

        view.addSubview(hashtagCollectionView)
        hashtagCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hashtagCollectionView.topAnchor.constraint(equalTo: hashtagLabel.bottomAnchor, constant: 10),
            hashtagCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            hashtagCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            hashtagCollectionView.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    func setupImagesCollectionView() {
        imagesCollectionView.backgroundColor = .clear
        imagesCollectionView.dataSource = self
        imagesCollectionView.delegate = self
        imagesCollectionView.register(ImageCell.self, forCellWithReuseIdentifier: "ImageCell")

        view.addSubview(imagesCollectionView)
        imagesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagesCollectionView.topAnchor.constraint(equalTo: hashtagCollectionView.bottomAnchor, constant: 10),
            imagesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            imagesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            imagesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupGiftView() {
        giftViewController = GiftViewController()
        giftViewController.view.backgroundColor = .clear

        addChild(giftViewController)
        view.addSubview(giftViewController.view)
        giftViewController.didMove(toParent: self)

        giftViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            giftViewController.view.widthAnchor.constraint(equalToConstant: 88),
            giftViewController.view.heightAnchor.constraint(equalToConstant: 88),
            giftViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
            giftViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60)
        ])
    }
}
