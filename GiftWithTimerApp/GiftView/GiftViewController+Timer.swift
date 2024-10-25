//
//  GiftViewController+Timer.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 25.10.2024.
//

import UIKit

extension GiftViewController {
    // MARK: - Timer Setup
    internal func startCountdown() {
        updateTimerLabel()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc internal func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            updateTimerLabel()
        } else {
            countdownTimer?.invalidate()
            countdownTimer = nil
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    internal func updateTimerLabel() {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        let timeText = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .strokeColor: UIColor.black,
            .strokeWidth: -1.0
        ]
        
        timerLabel.attributedText = NSAttributedString(string: timeText, attributes: attributes)
    }
}
