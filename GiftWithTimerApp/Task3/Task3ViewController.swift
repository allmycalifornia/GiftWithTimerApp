//
//  Task3ViewController.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 27.10.2024.
//

import UIKit

class Task3ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private let bannerView = UIView()
    private let hashtagLabel = UILabel()
    private let hashtagCollectionView: UICollectionView
    private let imagesCollectionView: UICollectionView
    
    private let bannerLabel: UILabel = {
        let label = UILabel()
        label.text = "Try three days free trial"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bannerSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "You will get all premium templates,\nadditional stickers and no ads"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bannerImage")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()
    
    // Массивы данных для хэштегов и изображений
    private let hashtags = ["#Осень", "#Портрет", "#Insta-стиль", "#Люди", "#Природа"]
    private let images = ["feedImage1", "feedImage2", "feedImage3", "feedImage4", "feedImage5", "feedImage6", "feedImage1", "feedImage2", "feedImage3", "feedImage4", "feedImage5", "feedImage6"]
    
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
        setupView()
        setupHashtagCollectionView()
        setupImagesCollectionView()
    }
    
    private func setupView() {
        view.backgroundColor = .black
        
        // Настройка bannerView
        bannerView.layer.cornerRadius = 12
        bannerView.clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(hex: "8B67EF").cgColor, UIColor(hex: "C373E7").cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = view.bounds
        bannerView.layer.insertSublayer(gradientLayer, at: 0)
        
        view.addSubview(bannerView)
        view.addSubview(bannerLabel)
        view.addSubview(bannerSubtitleLabel)
        view.addSubview(bannerImage)
        
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
            bannerImage.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: -16),
            bannerImage.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor, constant: -20),
            bannerImage.heightAnchor.constraint(equalToConstant: 80),
            bannerImage.widthAnchor.constraint(equalToConstant: 98)
        ])
        
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            bannerView.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        // Лейбл "Подходит для:"
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
    
    private func setupHashtagCollectionView() {
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
    
    private func setupImagesCollectionView() {
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
    
    // MARK: - UICollectionView DataSource
    
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

    // MARK: - UICollectionView DelegateFlowLayout
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == hashtagCollectionView {
                // Полная ширина текста с небольшим запасом
                let label = UILabel()
                label.text = hashtags[indexPath.item]
                label.font = UIFont.systemFont(ofSize: 16)
                label.sizeToFit()
                return CGSize(width: label.frame.width + 20, height: 32)
            } else {
                // Пропорциональная высота для изображений
                let imageName = images[indexPath.item]
                if let image = UIImage(named: imageName) {
                    let aspectRatio = image.size.height / image.size.width
                    let width = (view.frame.width - 48) / 2 // Половина экрана минус отступы
                    return CGSize(width: width, height: width * aspectRatio)
                }
                return CGSize(width: 0, height: 0) // На случай, если изображение не найдено
            }
        }
    }
    
// MARK: - Custom UICollectionViewCells

class HashtagCell: UICollectionViewCell {
    private let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(hex: "64D2FF").withAlphaComponent(0.15)
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true
        
        label.textColor = UIColor(hex: "64D2FF")
        label.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with hashtag: String) {
        label.text = hashtag
    }
}

class ImageCell: UICollectionViewCell {
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 14
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
}

// MARK: - UIColor Extension

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255
        let blue = CGFloat(rgbValue & 0x0000FF) / 255
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
