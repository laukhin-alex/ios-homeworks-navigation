//
//  TestView.swift
//  Navigation
//
//  Created by Александр on 12.04.2022.
//

import UIKit

class TestView: UIView {
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapCloseButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let screenWidth = UIScreen.main.bounds.width

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        self.addSubview(closeButton)
        self.alpha = 0

        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor),
            avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            avatarImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            avatarImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }

    @objc private func didTapCloseButton() {
        UIView.animate(withDuration: 0.5) {
            self.alpha = 0
        }
    }
}
