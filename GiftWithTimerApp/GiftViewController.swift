//
//  ViewController.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 25.10.2024.
//

import UIKit

class GiftViewController: UIViewController {
    private var timerLabel: UILabel!
    private var countdownTimer: Timer?
    private var remainingTime: TimeInterval = 30 * 60 // 30 минут в секундах

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        
        // Создаем круглый UIView для отображения таймера
        let timerView = UIView()
        timerView.backgroundColor = .darkGray
        timerView.layer.cornerRadius = 84 // Половина диаметра
        timerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(timerView)
        
        // Центрируем круглый таймер на экране и задаем размер
        NSLayoutConstraint.activate([
            timerView.widthAnchor.constraint(equalToConstant: 168),
            timerView.heightAnchor.constraint(equalToConstant: 168),
            timerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Создаем UIImageView для отображения gift и располагаем его в верхней части круга
        let giftImage = UIImageView(image: UIImage(named: "giftImage"))
        giftImage.translatesAutoresizingMaskIntoConstraints = false
        timerView.addSubview(giftImage)
        
        // Позиционируем giftImage так, чтобы его нижняя часть касалась центра круга
        NSLayoutConstraint.activate([
            giftImage.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
            giftImage.bottomAnchor.constraint(equalTo: timerView.centerYAnchor, constant: 20),
            giftImage.widthAnchor.constraint(equalToConstant: 106),
            giftImage.heightAnchor.constraint(equalToConstant: 106)
        ])
        
        // Добавляем анимацию для "тряски" подарка
            shakeAnimation(for: giftImage)
        
        // Метод для создания анимации "тряски"
        func shakeAnimation(for view: UIView) {
            let animation = CABasicAnimation(keyPath: "transform.rotation.z")
            animation.fromValue = -0.1 // небольшой наклон влево
            animation.toValue = 0.1 // небольшой наклон вправо
            animation.duration = 0.1 // время на один наклон
            animation.autoreverses = true // возвращается в начальное положение
            animation.repeatCount = .infinity // бесконечный повтор
            
            view.layer.add(animation, forKey: "shakeAnimation")
        }
        
        // Создаем UILabel для отображения времени и добавляем его под giftImage
        timerLabel = UILabel()
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont(name: "SFProDisplay-Semibold", size: 22)
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerView.addSubview(timerLabel)
        
        updateTimerLabel()
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
            timerLabel.topAnchor.constraint(equalTo: giftImage.bottomAnchor, constant: 5)
        ])
        
        // Запускаем таймер с обратным отсчётом
        startCountdown()
    }
    
    // Настройка таймера с обратным отсчетом
    private func startCountdown() {
        updateTimerLabel()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            updateTimerLabel()
        } else {
            countdownTimer?.invalidate()
            countdownTimer = nil
            // Действие по завершению обратного отсчета, например, закрытие контроллера
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // Обновление текста метки с оставшимся временем
    private func updateTimerLabel() {
        let hours = Int(remainingTime) / 3600
        let minutes = (Int(remainingTime) % 3600) / 60
        let seconds = Int(remainingTime) % 60
        let timeText = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
        // Устанавливаем атрибуты обводки для текста
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white, // Цвет текста
            .strokeColor: UIColor.black,     // Цвет обводки
            .strokeWidth: -1.0               // Толщина обводки (отрицательное значение для тонкой обводки)
        ]
        
        // Применяем атрибуты к тексту таймера
        timerLabel.attributedText = NSAttributedString(string: timeText, attributes: attributes)
    }
}
