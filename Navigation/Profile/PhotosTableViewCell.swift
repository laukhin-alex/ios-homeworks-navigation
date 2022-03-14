//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александр on 12.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private lazy var backView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    lazy var collectionLabel: UILabel = {
        


    }
}
