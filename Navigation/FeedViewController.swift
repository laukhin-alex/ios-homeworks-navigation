//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .systemYellow
        let postButton = UIButton(type: .custom) as UIButton
        postButton.clipsToBounds = true
        postButton.backgroundColor = .blue
        postButton.layer.cornerRadius = 12
        postButton.setTitle("Показать пост", for: .normal)
        postButton.setTitleColor(.systemYellow, for: .normal)
        postButton.frame = CGRect(x: 20, y: 300, width: 200,
                                  height: 100)
   
        postButton.translatesAutoresizingMaskIntoConstraints = true
        postButton.addTarget(self, action: #selector(makeAction), for: .touchUpInside)
        self.view.addSubview(postButton)
    }
    @objc func makeAction(sender:UIButton!)  {
        let postViewController  = PostViewController()

        self.navigationController?.pushViewController(postViewController, animated: true)

        self.navigationItem.backButtonTitle = "Назад"
    }
}

