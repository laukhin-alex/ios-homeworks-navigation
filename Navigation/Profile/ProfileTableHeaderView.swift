//
//  ProfileTableHeaderView.swift
//  Navigation
//
//  Created by Александр on 01.03.2022.
//

import UIKit

final class ProfileTableHeaderView: UITableView {

    struct Post {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int

    }
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: .zero)
        view.backgroundColor = .lightGray
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


}
