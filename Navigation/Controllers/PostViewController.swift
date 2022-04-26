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
        let title = "Мой ПОСТ? МОЙ!"
        self.navigationItem.title = title
        let infoViewButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(action))
        navigationItem.rightBarButtonItem = infoViewButton
    }

    @objc func action(sender:UIBarButtonItem!)  {
        let infoView = InfoViewController()
        self.navigationController?.present(infoView, animated: true, completion: nil)
    }
}
