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
        button.addTarget(self, action: #selector(self.goToAnimationController), for: .touchUpInside)
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
        

        
        
        NSLayoutConstraint.activate([
            self.verticalStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            self.verticalStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.verticalStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.verticalStackView.heightAnchor.constraint(equalToConstant: 200),

            self.postButtonOne.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor),
            self.postButtonOne.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor),
            self.postButtonOne.topAnchor.constraint(equalTo: self.verticalStackView.topAnchor),


            self.postButtonTwo.leadingAnchor.constraint(equalTo: self.verticalStackView.leadingAnchor),
            self.postButtonTwo.trailingAnchor.constraint(equalTo: self.verticalStackView.trailingAnchor)
        ].compactMap({ $0 }))
    }
    
    @objc func goToPost(sender:UIButton!)  {
        let postViewController  = PostViewController()
        
        self.navigationController?.pushViewController(postViewController, animated: true)
        
        self.navigationItem.backButtonTitle = "Back"
    }

    @objc func goToAnimationController(sender:UIButton!)  {
        let animationViewController  = AnimationViewController()

        self.navigationController?.pushViewController(animationViewController, animated: true)

        self.navigationItem.backButtonTitle = "Back"
    }
}

