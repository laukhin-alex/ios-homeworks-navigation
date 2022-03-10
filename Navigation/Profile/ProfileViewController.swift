//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александр on 09.02.2022.
//

import UIKit

final class ProfileViewController: UIViewController {



    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(ProfileTableHeaderViewCell.self, forCellReuseIdentifier: "ArticleCell")
        tableView.backgroundColor = .white
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.layer.borderWidth = 0.5
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private var heightConstraint: NSLayoutConstraint?

    private var dataSource: [Posts] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        self.addPosts()
    }

    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Feed"

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        navBarAppearance.shadowImage = nil
        navBarAppearance.shadowColor = nil
        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }

    private func setupView() {
        self.view.backgroundColor = .systemGray6
        self.view.addSubview(self.tableView)

        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)


        NSLayoutConstraint.activate([
            topConstraint, leadingConstraint, trailingConstraint, bottomConstraint
        ])
    }

    private func addPosts() {
        self.dataSource.append(.init(author: "CJ",
                                     description: "Big smoke chill chill",
                                     image: "gta",
                                     likes: 1,
                                     views: 1))
        self.dataSource.append(.init(author: "unknown",
                                     description: "Very nice view...",
                                     image: "nature",
                                     likes: 100,
                                     views: 500))
        self.dataSource.append(.init(author: "Spotter",
                                     description: "Landing airbus is amazing!",
                                     image: "plane",
                                     likes: 45,
                                     views: 65))
        self.dataSource.append(.init(author: "Hakuna matata",
                                     description: "The best restaurant at the island Zanzibar",
                                     image: "zanzibar",
                                     likes: 32,
                                     views: 43))
    }

}

extension ProfileViewController: ProfileHeaderViewProtocol {
    func didTapShowStatusButton(textFieldIsVisible: Bool, completion: @escaping () -> Void) {
        self.heightConstraint?.constant = textFieldIsVisible ? 300 : 245
        UIView.animate(withDuration: 0.3, delay: 0.1) {
            self.view.layoutIfNeeded()
        } completion: { _ in
            completion()
        }
    }
}



extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ProfileTableHeaderViewCell else { let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        return cell
    }
        let article = self.dataSource[indexPath.row]
        let viewModel = ProfileTableHeaderViewCell.ViewModel(author: article.author,
                                                             description: article.description,
                                                             image: article.image,
                                                             likes: article.likes,
                                                             views: article.views)
        cell.setup(with: viewModel)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var headerView = UIView()
        if section == 0 {
            headerView = ProfileHeaderView()
        }
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return  250
    }

}




