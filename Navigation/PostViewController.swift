//
//  PostViewController.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        let title = Post.init(title: "Мой ПОСТ? МОЙ!")
        self.navigationItem.title = title.title
        let infoViewButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(action))
        navigationItem.rightBarButtonItem = infoViewButton
        // Do any additional setup after loading the view.
    }
    @objc func action(sender:UIBarButtonItem!)  {
        let infoView = InfoViewController()

        self.navigationController?.present(infoView, animated: true, completion: nil)
    }
}
