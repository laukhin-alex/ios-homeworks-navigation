//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александр on 19.02.2022.
//

import UIKit

protocol ProfileHeaderViewProtocol: AnyObject {
    func didTapStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void)
}

class ProfileHeaderView: UIView {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .systemYellow
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private var buttonTopConstraint: NSLayoutConstraint?

    weak var delegate: ProfileHeaderViewProtocol?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    override func layoutSubviews() {}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func drawSelf() {
        self.addSubview(self.infoStackView)
        self.addSubview(self.setStatusButton)
        self.addSubview(self.statusTextField)
        self.infoStackView.addArrangedSubview(self.avatarImageView)
        self.infoStackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.fullNameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        self.labelsStackView.addArrangedSubview(self.statusTextField)
        self.backgroundColor = .brown

        let topConstraint = self.infoStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        let leadingConstraint = self.infoStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        let trailingConstraint = self.infoStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)

        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)

        self.buttonTopConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 20)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingButtonConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.infoStackView.leadingAnchor)
        let trailingButtonConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let bottomButtonConstraint = self.setStatusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        let heightButtonConstraint = self.setStatusButton.heightAnchor.constraint(equalToConstant: 40)
        let topStatusTextConstraint = self.statusTextField.topAnchor.constraint(equalTo: self.infoStackView.bottomAnchor, constant: 10)

        let leadingStatusTextConstraint = self.statusTextField.leadingAnchor.constraint(equalTo: self.statusLabel.leadingAnchor)
        let trailingStatusTextConstraint = self.statusTextField.trailingAnchor.constraint(equalTo: self.infoStackView.trailingAnchor)
        let heightTextStatusTextFieldConstraint = self.statusTextField.heightAnchor.constraint(equalToConstant: 34)

        


        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint,
            imageViewAspectRatio,
            self.buttonTopConstraint, leadingButtonConstraint,
            trailingButtonConstraint, bottomButtonConstraint, heightButtonConstraint, topStatusTextConstraint, leadingStatusTextConstraint,trailingStatusTextConstraint, heightTextStatusTextFieldConstraint
        ].compactMap({ $0 }))
    }
}
