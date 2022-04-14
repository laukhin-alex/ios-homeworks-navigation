//
//  AnimationViewController.swift
//  Navigation
//
//  Created by Александр on 19.03.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    private lazy var viewForAvatar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.borderWidth = 3
        view.backgroundColor = .systemRed
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()

    private lazy var avatarView: UIImageView = {
        let view = UIImageView(image: UIImage(named: "avatar"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var alphaView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private lazy var image: UIImageView = {
        let image = UIImage(named: "9")
        let view = UIImageView()
        view.image = image
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 6
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var xMarkButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.alpha = 0
        button.clipsToBounds = true
        button.setImage(.init(systemName: "xmark.circle"), for: .normal)
        button.addTarget(self, action: #selector(self.didTapSetStatusButton), for: .touchUpInside)
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height

    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var viewCenterXConstraint: NSLayoutConstraint?
    private var viewCenterYConstraint: NSLayoutConstraint?
    private var viewHeightConstraint: NSLayoutConstraint?
    private var viewWidthConstraint: NSLayoutConstraint?

    private var isExpanded = false


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
        title = "Изучаем жесты!"
        self.setupView()
        self.setupGesture()
    }

    private func setupView() {
        view.addSubview(image)
        view.addSubview(alphaView)
        view.addSubview(self.viewForAvatar)
        viewForAvatar.addSubview(self.avatarView)
        view.bringSubviewToFront(alphaView)
        view.addSubview(xMarkButton)
        view.bringSubviewToFront(viewForAvatar)
        self.viewForAvatar.layer.cornerRadius = 75
        self.alphaView.alpha = 0

        self.viewCenterXConstraint = self.viewForAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -1 * (screenWidth * 0.5 - 101))
        self.viewCenterYConstraint = self.viewForAvatar.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -1 * (screenHeight * 0.5 - 196))
        self.viewHeightConstraint = self.viewForAvatar.heightAnchor.constraint(equalToConstant: 150)
        self.viewWidthConstraint = self.viewForAvatar.widthAnchor.constraint(equalToConstant: 150)



        NSLayoutConstraint.activate([
            self.viewCenterXConstraint, self.viewCenterYConstraint,
            self.viewHeightConstraint, self.viewWidthConstraint,
            avatarView.topAnchor.constraint(equalTo: viewForAvatar.topAnchor),
            avatarView.bottomAnchor.constraint(equalTo: viewForAvatar.bottomAnchor),
            avatarView.leadingAnchor.constraint(equalTo: viewForAvatar.leadingAnchor),
            avatarView.trailingAnchor.constraint(equalTo: viewForAvatar.trailingAnchor),

            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            image.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            image.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            alphaView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            alphaView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            alphaView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            alphaView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),

            xMarkButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            xMarkButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            xMarkButton.heightAnchor.constraint(equalToConstant: 40),
            xMarkButton.widthAnchor.constraint(equalToConstant: 40)

        ].compactMap({ $0 }))
    }

    private func setupGesture() {
        self.tapGestureRecognizer.addTarget(self, action: #selector(self.handleTapGesture(_ :)))
        self.viewForAvatar.addGestureRecognizer(self.tapGestureRecognizer)
    }

    @objc func handleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.tapGestureRecognizer === gestureRecognizer else { return }
        self.isExpanded.toggle()
        self.viewCenterXConstraint?.constant = self.isExpanded ? 0 : -1 * (screenWidth * 0.5 - 101)
        self.viewCenterYConstraint?.constant = self.isExpanded ? 0 : -1 * (screenHeight * 0.5 - 196)
        self.viewHeightConstraint?.constant = self.isExpanded ? screenWidth : 150
        self.viewWidthConstraint?.constant = self.isExpanded ? screenWidth : 150

        UIView.animate(withDuration: 0.5) {
            self.viewForAvatar.layer.cornerRadius = self.isExpanded ? 0 : 75
            self.alphaView.alpha = self.isExpanded ? 0.7 : 0
            self.view.layoutIfNeeded()
        } completion: { _ in
        }

        if self.isExpanded {
            self.alphaView.isHidden = false
            self.xMarkButton.isHidden = false
        }

        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.xMarkButton.alpha = self.isExpanded ? 1 : 0
        } completion: { _ in
            self.xMarkButton.isHidden = !self.isExpanded
        }
    }

    @objc private func didTapSetStatusButton() {
        self.viewCenterXConstraint?.constant = -1 * (screenWidth * 0.5 - 101)
        self.viewCenterYConstraint?.constant = -1 * (screenHeight * 0.5 - 196)
        self.viewHeightConstraint?.constant = 150
        self.viewWidthConstraint?.constant = 150

        UIView.animate(withDuration: 0.5) {
            self.viewForAvatar.layer.cornerRadius = 75
            self.alphaView.alpha = 0
            self.view.layoutIfNeeded()
        } completion: { _ in
        }

        UIView.animate(withDuration: 0.3, delay: 0.5) {
            self.xMarkButton.alpha = 0
        } completion: { _ in
            self.xMarkButton.isHidden = false
            self.isExpanded = false
        }
    }
}
