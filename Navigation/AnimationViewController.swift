//
//  AnimationViewController.swift
//  Navigation
//
//  Created by Александр on 19.03.2022.
//

import UIKit

class AnimationViewController: UIViewController {

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.red.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Анимация"
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        setupView()
    
    }

    private func setupView() {
        self.view.addSubview(avatarImageView)
    
        let topAvatarImageConstraint = avatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16)
        let leadingAvatarImageConstraint = avatarImageView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16)
    let widthAvatarImageConstraint = avatarImageView.widthAnchor.constraint(equalToConstant: 150)
    let heightAvatarImageConstraint = avatarImageView.heightAnchor.constraint(equalToConstant: 150)

        NSLayoutConstraint.activate([
            topAvatarImageConstraint, leadingAvatarImageConstraint, widthAvatarImageConstraint, heightAvatarImageConstraint
        ])
    }
}
