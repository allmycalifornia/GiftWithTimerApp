//
//  GiftViewController+Animation.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 25.10.2024.
//

import UIKit

extension GiftViewController {
    func shakeAnimation(for view: UIView) {
        let shakeAngle: CGFloat = 0.1
        let shakeDuration: Double = 0.1
        
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = -shakeAngle
        animation.toValue = shakeAngle
        animation.duration = shakeDuration
        animation.autoreverses = true
        animation.repeatCount = .infinity
        
        view.layer.add(animation, forKey: "shakeAnimation")
    }
}
