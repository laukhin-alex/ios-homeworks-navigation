//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.setTitle("КНОПКА", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Профиль"
    }

    private func setupView() {
        self.view.backgroundColor = .white

        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(button)

        let topConstraint = self.profileHeaderView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor)
        let trailingConstraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        let heightConstraint = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)


        let buttonBottomConstraint = self.button.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        let trailingButtonConstraint = self.button.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let leadingButtonConstraint = self.button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let heightButtonConstraint = self.button.heightAnchor.constraint(equalToConstant: 50)

        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, heightConstraint, buttonBottomConstraint, trailingButtonConstraint, leadingButtonConstraint, heightButtonConstraint
        ].compactMap({ $0 }))
    }
}

