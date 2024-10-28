//
//  ViewController.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 25.10.2024.
//

import UIKit

final class GiftViewController: UIViewController {
    // MARK: - UI Elements
    var timerLabel: UILabel!
    var countdownTimer: Timer?
    
    // MARK: - Constants
    private let countdownTime: TimeInterval = 30 * 60
    private let circleDiameter: CGFloat = 168
    private let giftSize: CGFloat = 106
    private let timerFontSize: CGFloat = 22
    
    // MARK: - Properties
    var remainingTime: TimeInterval = 30 * 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupUI()
        startCountdown()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        let timerView = UIView()
        timerView.backgroundColor = .darkGray.withAlphaComponent(0.6)
        timerView.layer.cornerRadius = circleDiameter / 2
        timerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerView)
        
        NSLayoutConstraint.activate([
            timerView.widthAnchor.constraint(equalToConstant: circleDiameter),
            timerView.heightAnchor.constraint(equalToConstant: circleDiameter),
            timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        let giftImage = UIImageView(image: UIImage(named: "giftImage"))
        giftImage.translatesAutoresizingMaskIntoConstraints = false
        timerView.addSubview(giftImage)
        
        NSLayoutConstraint.activate([
            giftImage.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
            giftImage.bottomAnchor.constraint(equalTo: timerView.centerYAnchor, constant: 20),
            giftImage.widthAnchor.constraint(equalToConstant: giftSize),
            giftImage.heightAnchor.constraint(equalToConstant: giftSize)
        ])
        
        shakeAnimation(for: giftImage)
        
        timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "SFProDisplay-Semibold", size: timerFontSize)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerView.addSubview(timerLabel)
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: giftImage.bottomAnchor, constant: 5)
        ])
    }
}
