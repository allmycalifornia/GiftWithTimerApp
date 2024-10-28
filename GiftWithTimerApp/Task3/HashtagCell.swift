//
//  HashtagCell.swift
//  GiftWithTimerApp
//
//  Created by Борис Кравченко on 28.10.2024.
//

import UIKit

final class HashtagCell: UICollectionViewCell {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        if let color = UIColor(hex: "64D2FF") {
            contentView.backgroundColor = color.withAlphaComponent(0.15)
        }
        contentView.layer.cornerRadius = 16
        contentView.clipsToBounds = true

        label.textColor = UIColor(hex: "64D2FF")
        label.font = UIFont.systemFont(ofSize: 16)
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with text: String) {
        label.text = text
    }
}
