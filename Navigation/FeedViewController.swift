//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var postButtonOne: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.goToPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 12
        button.setTitle("Изучаем жесты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var postButtonTwo: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(self.goToPost), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 12
        button.setTitle("Показать пост, кнопка два", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.drawSelf()
        
    }
    
    private func drawSelf() {
        self.view.addSubview(self.verticalStackView)
        self.verticalStackView.addArrangedSubview(postButtonOne)
        self.verticalStackView.addArrangedSubview(postButtonTwo)
        
        let topConstraint = self.verticalStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        let leadingConstraint = self.verticalStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        let trailingConstraint = self.verticalStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        let heightConstraint = self.verticalStackView.heightAnchor.constraint(equalToConstant: 200)
        
        let leadingButtonOneConstraint = self.postButtonOne.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor)
        let trailingButtonOneConstraint = self.postButtonOne.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor)
        let bottomButtonOneConstraint = self.postButtonOne.topAnchor.constraint(equalTo: self.verticalStackView.topAnchor)
        
        
        let leadingButtonTwoConstraint = self.postButtonTwo.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor)
        let trailingButtonTwoConstraint = self.postButtonTwo.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor)
        
        
        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, leadingButtonOneConstraint, trailingButtonOneConstraint, bottomButtonOneConstraint, leadingButtonTwoConstraint, trailingButtonTwoConstraint, heightConstraint
        ].compactMap({ $0 }))
    }
    
    @objc func goToPost(sender:UIButton!)  {
        let postViewController  = PostViewController()
        
        self.navigationController?.pushViewController(postViewController, animated: true)
        
        self.navigationItem.backButtonTitle = "Назад"
    }

    @objc func goToAnimationController(sender:UIButton!)  {
        let postViewController  = PostViewController()

        self.navigationController?.pushViewController(postViewController, animated: true)

        self.navigationItem.backButtonTitle = "Назад"
    }
}

